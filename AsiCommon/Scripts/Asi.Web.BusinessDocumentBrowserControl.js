// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.BusinessFinderControl
// ###########################################################


function BusinessDocumentBrowserProperties()
{
    this.TypeFilter = null;
    this.DocumentHierarchyKey = null;
    this.DocumentPath = null;
    this.RootFolder = null;
    this.AllowUpwardNavigation = true;
    this.ShowAddress = true;
    this.AutoPostback = false;
    this.ValueControlID = null;
    this.ShowMenu = false;
}

//
// Called when user clicks on browse button
//
function BusinessDocumentBrowserControl_Select(businessDocumentBrowserProperties)
{    
    var urlParamString = '&ShowRecycleBin=false';
    if (businessDocumentBrowserProperties.TypeFilter)
    {
        urlParamString += '&TypeFilter=' + businessDocumentBrowserProperties.TypeFilter;
    }
    if (businessDocumentBrowserProperties.DocumentHierarchyKey)
    {
        urlParamString += '&DocumentHierarchyKey=' + businessDocumentBrowserProperties.DocumentHierarchyKey;
    }
    if (businessDocumentBrowserProperties.DocumentPath)
    {
        urlParamString += '&DocumentPath=' + businessDocumentBrowserProperties.DocumentPath;
    }
    if (businessDocumentBrowserProperties.RootFolder)
    {
        urlParamString += '&iRootFolder=' + businessDocumentBrowserProperties.RootFolder;
        urlParamString += '&AutoSelectFirstDocument=true';
        if (!businessDocumentBrowserProperties.DocumentPath)
            urlParamString += '&DocumentPath=' + businessDocumentBrowserProperties.RootFolder;
    }
    if (!businessDocumentBrowserProperties.AllowUpwardNavigation)
    {
        urlParamString += '&AllowUpwardNavigation=' + businessDocumentBrowserProperties.AllowUpwardNavigation;
    }
    if (!businessDocumentBrowserProperties.ShowAddress)
    {
        urlParamString += '&ShowAddress=' + businessDocumentBrowserProperties.ShowAddress;
    }
    if (businessDocumentBrowserProperties.ShowMenu) {
        urlParamString += '&ShowMenu=' + businessDocumentBrowserProperties.ShowMenu;
        urlParamString += '&ShowMenuPublish=false&ShowMenuVersions=false&ShowMenuRun=false&ShowMenuPreview=false&ShowMenuNew=true';
    }

    //function OpenObjectBrowser(urlParamString, returnFunc, singleSelect)
    OpenObjectBrowser(urlParamString, function(dialogWindow) { BusinessDocumentBrowserControl_SelectCallBack(dialogWindow, businessDocumentBrowserProperties); }, true, false);
    return CancelEvent();
}
//
// Function called after the user makes a selection in the dialog
//
function BusinessDocumentBrowserControl_SelectCallBack(dialogWindow, businessDocumentBrowserProperties)
{
    var valueControl = $(businessDocumentBrowserProperties.ValueControlID);
    if (valueControl != null)
    {
        var dialogResult = dialogWindow.result;
        if (dialogResult == null || dialogResult.length == 0)
        {
            return;
        }

        // Set selected path
        valueControl.value = dialogWindow.SelectedDocumentPath;

        // Set the document version key for the selected document
        var documentVersionKeyControl = $(businessDocumentBrowserProperties.DocumentVersionKeyValueControlID);
        if (documentVersionKeyControl != null)
            documentVersionKeyControl.value = dialogWindow.SelectedDocumentVersionKey;
            
        // Set focus on the link after callback
        valueControl.focus();

        if (businessDocumentBrowserProperties.AutoPostBack)
        {
            submitForm(valueControl);
        }
    }
}
