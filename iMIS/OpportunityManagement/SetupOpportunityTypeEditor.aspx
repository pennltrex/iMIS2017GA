<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Process Type Editor - Process Manager" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="asi" TagName="SetupOpportunityType" Src="~/AsiCommon/Controls/OpportunityManagement/SetupOpportunityTypeEditor.ascx" %>

<%@ Import Namespace="System.Web.Services"%>
<%@ Import Namespace="Asi.Web.UI.Common.BSA"%>

<script runat="server" language="C#">
 
    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get
        {
            return false;
        }
    }
    
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        AddChildUserControl(SetupOpportunityTypeEditorControl);
    }
    
    /// <summary>
    /// Wrapper method for the call to get an item's link based on a specified action.
    /// </summary>
    /// <param name="action">The action.</param>
    /// <param name="templateType">Type of the template.</param>
    /// <param name="docType">Type of the doc.</param>
    /// <param name="hierarchyKey">The hierarchy key.</param>
    /// <param name="documentVersionKey">The document version key.</param>
    /// <param name="folderHierarchyKey">The folder hierarchy key.</param>
    /// <param name="itemCount">The item count.</param>
    /// <param name="closeWindowOnCommit">if set to <c>true</c> [close window on commit].</param>
    /// <param name="websiteKey">The website key.</param>
    /// <remarks>Has to be here because PageMethod methods must be declared on a Page and not on a UserControl.</remarks>
    
    [WebMethod]
    public static string GetActionLink(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return ObjectBrowserHelper.GetActionLink(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }

    /// <summary>
    /// Gets the window properties.
    /// </summary>
    /// <param name="action">The action.</param>
    /// <param name="templateType">Type of the template.</param>
    /// <param name="docType">Type of the doc.</param>
    /// <param name="hierarchyKey">The hierarchy key.</param>
    /// <param name="documentVersionKey">The document version key.</param>
    /// <param name="folderHierarchyKey">The folder hierarchy key.</param>
    /// <param name="itemCount">The item count.</param>
    /// <param name="closeWindowOnCommit">if set to <c>true</c> [close window on commit].</param>
    /// <param name="websiteKey">The website key.</param>
    /// <remarks>Has to be here because PageMethod methods must be declared on a Page and not on a UserControl.</remarks>
    [WebMethod]
    public static WindowProperties GetWindowProperties(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return ObjectBrowserHelper.GetWindowProperties(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static bool CheckForPasteConflict(string selectedKeys, Guid targetHierarchyKey)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.CheckForPasteConflict(selectedKeys.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries), targetHierarchyKey);
    }
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asi:SetupOpportunityType ID="SetupOpportunityTypeEditorControl" runat="server" />
</asp:Content>
