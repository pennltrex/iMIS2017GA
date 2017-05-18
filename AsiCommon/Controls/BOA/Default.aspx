<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" Title="Business Object Designer" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Register TagPrefix="bsa" TagName="ObjectBrowserControl" Src="~/AsiCommon/Controls/BSA/Objectbrowser2.ascx" %>

<script language="C#" runat="server">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        
        ChildUserControls.Add(ObjectBrowser1);
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        bool isStaffUser = ((Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin")) ||
                            (Asi.AppContext.CurrentPrincipal.IsInRole("IsStaff")) ||
                            (Asi.AppContext.CurrentPrincipal.IsInRole("full staff")));

        if (!Asi.Security.Utility.SecurityHelper.IsAuthenticatedUser || !isStaffUser)
        {
            AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, ResourceManager.GetPhrase("AccessDenied", "Access Denied")));
            ObjectBrowser1.Visible = false;
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
            DataBind();
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
    public static Asi.Web.UI.Common.BSA.WindowProperties GetWindowProperties(PageOperation action, TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
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
<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">
	    <bsa:ObjectBrowserControl id="ObjectBrowser1" Runat="server" Mode="Standard" 
	        DocumentPath="$/Design Business Object Definition" Text="BOD Folders"
	        TypeFilter="FOL,BOD" ShowAddress="true" PublishedOnly="false" Visible="true" 
            CssClass="hidden-xs" ShowRecycleBin="True" />
    </asp:Panel>
    
    <asp:Label ID="SmallScreenMessage" Text="Business Object Designer is not supported on the screen size of this browser." CssClass="visible-xs" runat="server" translate="yes"></asp:Label>
</asp:Content>