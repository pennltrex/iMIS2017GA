// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.BusinessFileUpload
// ###########################################################

function BusinessFileUploadProperties()
{
    this.CallBackValueControl = null;
    this.CallBackDisplayControl = null;
    this.AllowMultiple = false;
}

var businessFileUploadProperties = new BusinessFileUploadProperties();

//
// Called when user clicks on upload button
//       BusinessFileUpload_Upload
function BusinessFileUpload_Upload(valueControl, displayControl, displayControlHref, fileTypes, enableDescriptionField, singleSelect, documentStorageKey, documentServerPath, maxFileSize)
{
    businessFileUploadProperties.CallBackValueControl = valueControl;
    if (displayControl != null) {
        businessFileUploadProperties.CallBackDisplayControl = displayControl;
    } else {
        businessFileUploadProperties.CallBackDisplayControl = displayControlHref;
    }
    businessFileUploadProperties.AllowMultiple = !singleSelect;

    OpenFileUpload(BusinessFinderControl_UploadCallback, documentStorageKey, documentServerPath, maxFileSize, fileTypes, enableDescriptionField);
    return CancelEvent();
}
//
// Function called after the user uploads a file in the dialog
//
function BusinessFinderControl_UploadCallback(dialogWindow)
{
    if (businessFileUploadProperties.CallBackValueControl != null)
    {
        if (dialogWindow.result == null || dialogWindow.result.length == 0)
            return;

        businessFileUploadProperties.CallBackValueControl.value = dialogWindow.result;
        if (document.all)
            businessFileUploadProperties.CallBackDisplayControl.innerText = dialogWindow.Filename;
        else
            businessFileUploadProperties.CallBackDisplayControl.textContent = dialogWindow.Filename;
            
        // Set focus on the link after callback
        var uploadButton = getNextObject(businessFileUploadProperties.CallBackValueControl);
        uploadButton.focus();
        
        // Show delete button
        var deleteButton = getNextObject(uploadButton);
        deleteButton.style.display = 'inline';
    }
    
    // reset globals
    businessFileUploadProperties.CallBackValueControl = null;
    businessFileUploadProperties.CallBackDisplayControl = null;
    businessFileUploadProperties.AllowMultiple = false;
}
//
// Called when user clicks the delete button (non-multiple value control)
//
function BusinessFinderControl_Delete(valueControl, displayControl, displayControlHref, descriptionLabel, defaultText)
{
    valueControl.value = '';
    if (displayControl != null)
        displayControl.innerHTML = defaultText;

    if (displayControlHref != null) {
        displayControlHref.innerHTML = defaultText;
        displayControlHref.href = null;
        displayControlHref.style.textDecoration = 'none';
        displayControlHref.style.color = '#000';
    }
    
    if (descriptionLabel != null) {
        descriptionLabel.style.display = 'none';
    }

    // Set focus on the link after delete
    var uploadButton = getNextObject(valueControl);
    uploadButton.focus();
    
    // Hide delete button
    var deleteButton = getNextObject(uploadButton);
    deleteButton.style.display = 'none';
    
    return CancelEvent();
}
