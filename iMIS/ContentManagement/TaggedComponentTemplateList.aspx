<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Define Tagged List Formats" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<script runat="server">

    /// <summary>
    /// 
    /// </summary>
    /// <param name="e"></param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        // Handle scrolling on this page, don't scroll on master page
        ((Asi.Web.UI.MasterPageBase)Master).ScrollContentPane = false;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="e"></param>
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }
    /// <summary>
    /// Wrapper method for the call to get an item's link based on a specified
    /// action.  Has to be here because PageMethod methods must be declared
    /// on a Page and not on a UserControl.
    /// </summary>
    [System.Web.Services.WebMethod]
    public static string GetActionLink(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.GetActionLink(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }
    [System.Web.Services.WebMethod]
    public static Asi.Web.UI.Common.BSA.WindowProperties GetWindowProperties(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.GetWindowProperties(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static bool CheckForPasteConflict(string selectedKeys, Guid targetHierarchyKey)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.CheckForPasteConflict(selectedKeys.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries), targetHierarchyKey);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">
        <asi:ObjectBrowser ID="TaggedComponentBrowser" runat="server" TypeFilter="TCT"
            Text="Tagged List Formats" Mode="Standard" PublishedOnly="false"
            ShowHierarchyTree="false" ShowAddress="false"
            RootFolder="$/ContentManagement/DefaultSystem/TaggedListFormats" AutoSelectFirstDocument="true" />
    </asp:Panel>
</asp:Content>
