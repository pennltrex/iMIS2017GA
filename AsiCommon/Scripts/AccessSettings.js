// ###########################################################
// JavaScript functions necessary for use with 
// the AccessSettings panel (~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx).
// ###########################################################


function RoleAccessGranted_Click(checkBox, initialLoad)
{
    if (initialLoad == null)
        initialLoad = false;

    var targetControlID = checkBox.getAttribute('data-targetControlID');
    if (targetControlID == null)
        targetControlID = checkBox.parentNode.getAttribute('data-targetControlID');

    if (targetControlID != null)
    {
        var targetPermissionControl = $get(targetControlID);
        if (targetPermissionControl != null)
        {
            targetPermissionControl.style.display = checkBox.checked ? 'block' : 'none';
            if (!initialLoad && !checkBox.checked)
                targetPermissionControl.Clear();
        }
    }
}

var PermissionEnum_FullControl = 1;
var PermissionEnum_Read = 2;
var PermissionEnum_Add = 4;
var PermissionEnum_Edit = 8;
var PermissionEnum_Delete = 16;
//var PermissionEnum_Select = 32;

function FullControl_Click(checkbox)
{
    if (checkbox.checked)
        checkbox.OtherCheckBoxesSpan.setAttribute('disabled', 'disabled');
    else
        checkbox.OtherCheckBoxesSpan.removeAttribute('disabled');
    
    //This is needed for Chrome and FF to handle enable/disable of the permissions checkboxes
    var allinput = checkbox.OtherCheckBoxesSpan.getElementsByTagName("input");   
    for (i = 0; i < allinput.length; i++) {
        if (allinput[i].type == "checkbox") {
            if (checkbox.checked) {
                allinput[i].nextSibling.style.color = "#a6a0a0";
                allinput[i].disabled = true;
                allinput[i].setAttribute('disabled', 'disabled');
                allinput[i].checked = false;
            } else {
                allinput[i].nextSibling.style.color = "";
                allinput[i].disabled = false;
                allinput[i].removeAttribute('disabled');
            }
        }
    }
}
function PermissionControlClear(permissionControl)
{
    var wasFullControl = permissionControl.FullControlCheckBox.checked;
    permissionControl.FullControlCheckBox.checked = false;
    permissionControl.ReadCheckBox.checked = false;
    permissionControl.AddCheckBox.checked = false;
    permissionControl.EditCheckBox.checked = false;
    permissionControl.DeleteCheckBox.checked = false;
    //permissionControl.SelectCheckBox.checked = false;

    // Remove the disabled attribute to really clear the control
    if (wasFullControl)
        permissionControl.FullControlCheckBox.OtherCheckBoxesSpan.removeAttribute('disabled');
}
function InitializePermissionControls()
{
    for (var i=0; i<PermissionControls.length; i++)
    {
        var permissionControl = $get(PermissionControls[i]);
        if (permissionControl != null)
        {
            var permissionEditPanel = $get(permissionControl.id + '_PermissionEditPanel');

            var checkBoxes = permissionEditPanel.getElementsByTagName('input');
            permissionControl.FullControlCheckBox = checkBoxes[0];
            if (permissionEditPanel.firstElementChild)
                checkBoxes[0].OtherCheckBoxesSpan = permissionEditPanel.firstElementChild.lastElementChild;
            else
                checkBoxes[0].OtherCheckBoxesSpan = permissionEditPanel.firstChild.lastChild;
            if (permissionControl.FullControlCheckBox.checked)
                checkBoxes[0].OtherCheckBoxesSpan.setAttribute('disabled', 'disabled');
            else
                checkBoxes[0].OtherCheckBoxesSpan.removeAttribute('disabled');
            permissionControl.ReadCheckBox = checkBoxes[1];
            permissionControl.AddCheckBox = checkBoxes[2];
            permissionControl.EditCheckBox = checkBoxes[3];
            permissionControl.DeleteCheckBox = checkBoxes[4];
            //permissionControl.SelectCheckBox = checkBoxes[5];

            permissionControl.Clear = function()
            {
                PermissionControlClear(this);
            }
            permissionControl.GetPermission = function()
            {
                var result = 0;

                if (this.FullControlCheckBox.checked)
                    result = result | PermissionEnum_FullControl;
                if (this.ReadCheckBox.checked)
                    result = result | PermissionEnum_Read;
                if (this.AddCheckBox.checked)
                    result = result | PermissionEnum_Add;
                if (this.EditCheckBox.checked)
                    result = result | PermissionEnum_Edit;
                if (this.DeleteCheckBox.checked)
                    result = result | PermissionEnum_Delete;
                //            if (this.SelectCheckBox.checked)
                //                result = result | PermissionEnum_Select;

                return result;
            }

            permissionControl.setAttribute('Permission', permissionControl.GetPermission());
        }
    }
    //if (typeof (RoleAccessGrantedCheckboxes) !== "undefined")
    for (var j = 0; j < RoleAccessGrantedCheckboxes.length; j++) {
        var roleAccessGranted = $get(RoleAccessGrantedCheckboxes[j]);
        if (roleAccessGranted != null) {
            RoleAccessGranted_Click(roleAccessGranted);
        }
    }
}

var buttonClientID;
function AccessSettings_AddButton_Click(refreshButtonClientID, sourcePath)
{
    buttonClientID = refreshButtonClientID;
    // Add additional filter to only show Groups with GroupType == 'iMISModuleUsers'
    OpenFinderAdder(AddDialogCompleted, false, null, sourcePath, null, null);
    return CancelEvent();
}

function AddDialogCompleted(dialogWindow) 
{
    if (!dialogWindow.result)
        return;
    InitiateControlEventWithArgument(buttonClientID, dialogWindow.result);
}

// This is needed so that script is properly registered on an async postback
if(typeof(Sys) !== "undefined")Sys.Application.notifyScriptLoaded();