// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.BusinessFinderControl
// ###########################################################

function BusinessFinderControlProperties()
{
    this.CallBackValueControl = null;
    this.CallBackDisplayControl = null;
    this.Grid = null;
    this.SelectLink = null;
    this.AllowMultiple = false;
    this.CallBackRemoveControl = null;
}

var businessFinderControlProperties = new BusinessFinderControlProperties();

//
// Called when user clicks on select button
//
function BusinessFinderControl_Select(valueControl, displayControl, gridControl, selectLinkControl, singleSelect, documentKey, documentPath, atomName, displayValueColumn, keyValueColumn, filterValue, addTargetUrl, removeControl) 
{
    businessFinderControlProperties.CallBackValueControl = valueControl;
    businessFinderControlProperties.CallBackDisplayControl = displayControl;
    businessFinderControlProperties.CallBackRemoveControl = removeControl;
    businessFinderControlProperties.Grid = gridControl;
    businessFinderControlProperties.SelectLink = selectLinkControl;
    businessFinderControlProperties.AllowMultiple = !singleSelect;
    OpenFinderAdderWithQueryFilter(BusinessFinderControl_SelectCallBack, singleSelect, documentKey, documentPath, atomName, displayValueColumn, keyValueColumn, filterValue, null, null, addTargetUrl);
    return CancelEvent();
}
//
// Function called after the user makes a selection in the dialog
//
function BusinessFinderControl_SelectCallBack(dialogWindow) 
{
    var dialogResult = dialogWindow.result;
    if (businessFinderControlProperties.CallBackValueControl != null)
    {
        if (dialogResult == null || dialogResult.length == 0)
            return;

        if (!businessFinderControlProperties.AllowMultiple)
        {
            businessFinderControlProperties.CallBackValueControl.value = dialogResult[0];
            // If dialogWindow.SelectedDisplayValues is null, make sure the DataTextField property of the BusinessFinderControl is set.
            if (document.all)
                businessFinderControlProperties.CallBackDisplayControl.innerText = dialogWindow.SelectedDisplayValues[0];
            else
                businessFinderControlProperties.CallBackDisplayControl.textContent = dialogWindow.SelectedDisplayValues[0];
            
            // if it's allowed remove, put the button visible after select some value
            if (businessFinderControlProperties.CallBackRemoveControl)
            {
                businessFinderControlProperties.CallBackRemoveControl.style.display = 'block';
            }

            try 
            {
                InitiateControlEventWithArgument(businessFinderControlProperties.CallBackValueControl.id, businessFinderControlProperties.CallBackValueControl.value, 'onchange');
            }
            catch (err) 
            {
                // BP - 3/1/10 - An error will be thrown here when onchange is fired and the
                // control is not set to AutoPostPack. I've removed code here that looked for a
                // specific error description and ignored the error. This error description is 
                // browser specific. Rather than relying on an error description that will be 
                // different between browsers and browser versions, we won't throw an error here.
            };
            
            // Set focus on the link after callback
            businessFinderControlProperties.SelectLink.focus();
        }
        else
        {
            var existing = businessFinderControlProperties.CallBackValueControl.value.split(',');

            var result = '';
            for (var i=0;i<dialogResult.length;i++)
            {
                var foundInExisting = false;
                for (var j=0;j<existing.length;j++)
                {
                    if (existing[j] == dialogResult[i])
                    {
                        foundInExisting = true;
                        break;
                    }
                }

                if (!foundInExisting)
                {
                    result += ',' + dialogResult[i];
                    
                    // add new display row
                    if (businessFinderControlProperties.CallBackDisplayControl != null && dialogWindow.SelectedDisplayValues != null)
                    {
                        var rowToClone = businessFinderControlProperties.Grid.rows[businessFinderControlProperties.Grid.rows.length - 1];
                        var newRow = businessFinderControlProperties.Grid.insertRow(businessFinderControlProperties.Grid.rows.length - 1);
                        
                        for (var j = 0; j < rowToClone.cells.length; j++)
                        {
                            var cell = newRow.insertCell();
                            cell.innerHTML = rowToClone.cells[j].innerHTML;
                            var cssText = rowToClone.cells[j].style.cssText;
                            cell.setAttribute('style', cssText);
                            cell.style.cssText = cssText;
                        }
                        if (document.all)
                            newRow.cells[1].innerText = dialogWindow.SelectedDisplayValues[i];
                        else
                            newRow.cells[1].textContent = dialogWindow.SelectedDisplayValues[i];
                    }
                    try {
                        InitiateControlEventWithArgument(businessFinderControlProperties.CallBackValueControl.id, businessFinderControlProperties.CallBackValueControl.value, 'onchange');                        
                    }
                    catch (err) {
                        // BP - 3/1/10 - An error will be thrown here when onchange is fired and the
                        // control is not set to AutoPostPack. I've removed code here that looked for a
                        // specific error description and ignored the error. This error description is 
                        // browser specific. Rather than relying on an error description that will be 
                        // different between browsers and browser versions, we won't throw an error here.
                    };
                }
            }
            if (result.length > 0)
            {
                // set the value
                result = businessFinderControlProperties.CallBackValueControl.value + result;
                if (result.substr(0,1) == ',')
                    result = result.substr(1);
                businessFinderControlProperties.CallBackValueControl.value = result;
                
                // make sure grid is visible and default text is hidden
                businessFinderControlProperties.Grid.style.display = 'block';

                businessFinderControlProperties.CallBackDisplayControl.style.display = 'none';
            }
            
            // Set focus on the link after callback
            businessFinderControlProperties.SelectLink.focus();
        }
    }
    
    // reset globals
    businessFinderControlProperties.CallBackValueControl = null;
    businessFinderControlProperties.CallBackDisplayControl = null;
    businessFinderControlProperties.CallBackRemoveControl = null;
    businessFinderControlProperties.Grid = null;
    businessFinderControlProperties.SelectLink = null;
    businessFinderControlProperties.AllowMultiple = false;
}
//
// Called when user clicks the delete button (non-multiple value control)
//
function BusinessFinderControl_Clear(valueControl, displayControl, defaultText, removeControl)
{
    valueControl.value = '';
    displayControl.innerHTML = defaultText;
    removeControl.style.display = 'none';
}
//
// Called when user clicks the delete button (multiple value control)
//
function BusinessFinderControl_DeleteItem(valueControl, displayControl, grid_local, itemIndex, defaultText)
{
    var row = findAncestor(eventSource(), "tr");
    itemIndex = row.rowIndex;
    
    // remove the id from the value input control
    var existingValues = valueControl.value.split(',');
    existingValues.splice(itemIndex, 1);

    var result = '';
    for (var i=0;i<existingValues.length;i++)
        result += ',' + existingValues[i];

    if (result.length > 0)
        result = result.substr(1);

    valueControl.value = result;
    
    // remove the item from the grid
    grid_local.deleteRow(itemIndex);
    
    if (valueControl.value.length == 0)
    {
        displayControl.style.display = 'inline';
        grid_local.style.display = 'none';
    }
}
