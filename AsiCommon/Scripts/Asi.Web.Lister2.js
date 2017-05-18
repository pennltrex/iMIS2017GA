// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.Lister2
//
// Client Methods exposed:
//  GetSelectedKeys()
//  GetSelectedDisplayValues(columnName)
//
// ###########################################################

addLoadEvent(Lister2_Init);
var Listers = null;
function Lister2_Init()
{
  
    if (!Listers || Listers == null || Listers.length == 0)
        return;
        
    for (var i=0; i<Listers.length; i++)
    {
        if (Listers[i] == null)
            continue;
        Listers[i].GetSelectedKeys = function() {
            return Lister2_GetSelectedKeys(this);
        }
        Listers[i].GetSelectedDisplayValues = function(columnName) {
            return Lister2_GetSelectedDisplayValues(this, columnName);
        }
        Listers[i].Refresh = function() {
            Lister2_Refresh(this);
        }
    }

    RemoveGridTabindexFocus();

}

function Lister2_GetGrid(lister)
{
    return $find(lister.getAttribute('data-gridId'));
}

function Lister2_GetSelectedKeys(lister)
{
    var selectedKeys = new Array();
    var grid = Lister2_GetGrid(lister);
    if (grid == null)
    {
        return null;
    }
   
    // For reasons I do not really understand, 
    // the lister Attributes are not refreshed during an ajax postback.  So if the keyColumnName
    // attribute was changed at the server we do not see that change here.  The hidden field 
    // does the same thing, but this method appears to work for the ajax postback.  If the 
    // hiddenField is not present, we fall back on getting the keyColumnName from the Attribute.
    var keyColumnName;
    var hiddenField = this.document.getElementById(lister.getAttribute('data-hiddenFieldId'))
    if (hiddenField != null)
        keyColumnName = hiddenField.value;
    else
        keyColumnName = lister.getAttribute('data-keyColumnName');
        
    if (keyColumnName == null)
    {
        alert('Key Column not identified for this data source, unable to continue.');
        return null;
    }

    var selectedRows = grid.get_masterTableView().get_selectedItems();
    
    for (var i=0;i<selectedRows.length;i++)
    {
        var keyValue = selectedRows[i].getDataKeyValue(keyColumnName);
        if (keyValue == null)
        {
            alert('Unable to get selected key.');
            return null;
        }
        selectedKeys.push(keyValue); 
    }
    return selectedKeys;
}
function Lister2_GetSelectedDisplayValues(lister, displayColumn)
{
    var grid = Lister2_GetGrid(lister);
    var selectedDisplayValues = new Array();

    var selectedRows = grid.get_masterTableView().get_selectedItems();  
     
    for (var i=0; i<selectedRows.length; i++)
    {
        var displayCell = grid.get_masterTableView().getCellByColumnUniqueName(selectedRows[i], displayColumn);
        if (displayCell == null)
            alert('Specified display column does not exist in the list: ' + displayColumn);
        else if (document.all)
            selectedDisplayValues.push(trim(displayCell.innerText));
        else
            selectedDisplayValues.push(trim(displayCell.textContent));
    }
    
    return selectedDisplayValues;
}
function Lister2_Refresh(lister)
{
    var refreshButton = $(lister.id + '_RefreshButton');
    if (refreshButton != null)
        refreshButton.click();
    //InitiateControlEventWithArgument(refreshButton);
}
function Lister2_DialogWindowClose(dialogWindow)
{
    if (dialogWindow.IsDirty)
    {
        var listerControl = dialogWindow.SourceObject;
        Lister2_Refresh(listerControl); 
    }
}
function Lister2_DialogWindowCallback(dialogWindow)
{
}

function RemoveGridTabindexFocus() {
    if (document.querySelectorAll !== undefined) {
        var lister = document.querySelectorAll('.RadGrid');
        if (lister != null && lister !== undefined) {
            for (var e = 0; e < lister.length; e++) {
                var o = lister[e];
                o.removeAttribute("tabindex");
            }
        }
    }
}