<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Set up module" %>

<%@ Register TagPrefix="asiweb" TagName="OpportunityManagementSetup" Src="~/AsiCommon/Controls/OpportunityManagement/Setup.ascx" %>

<%@ Import Namespace="System.Web.Services"%>
<%@ Import Namespace="Asi.Web.UI.Common.BSA"%>

<script runat="server" language="C#">

    /// <summary>
    /// Gets or sets an indication of whether the animations should be displayed when an ajax request is invoked.
    /// </summary>
    /// <value>
    /// true id the AjaxAnimation should be shown on this page; false if it should not be shown.
    /// </value>
    /// <remarks>There is a bug in UpdatePanelAnimationExtender so if you have any UpdatePanels on your page
    /// then you must not set this property to true.</remarks>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }

    /// <summary>
    /// Extends the base class to add a call to <see cref="M:System.Web.UI.Control.EnsureChildControls"/>
    /// </summary>
    /// <param name="e"></param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(opportunitySetupControl))
        {
            AddChildUserControl(opportunitySetupControl);
        }
    }

    /// <summary>
    /// Makes sure the AtomObject is available (if applicable) grabs and stores the ReturnUrl parameter
    /// from the query string or the <see cref="P:System.Web.HttpRequest.UrlReferrer"/> and adds the debugging panel
    /// if <see cref="P:System.Web.HttpContext.IsDebuggingEnabled"/> is set.
    /// </summary>
    /// <param name="e">The event's arguments</param>
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
            DataBind();
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

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:OpportunityManagementSetup id="opportunitySetupControl" runat="server"/>
</asp:Content>
