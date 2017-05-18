<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="uc1" TagName="DocumentExplorer" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<script runat="server" language="C#">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        Asi.Web.UI.MasterPageBase masterPageBase = Page.Master as Asi.Web.UI.MasterPageBase;
        if (masterPageBase != null)
            masterPageBase.ScrollContentPane = false;
        Page.Title = Asi.ResourceManager.GetPhrase("RFMList", "RFM Analytics List");

        AddChildUserControl(ObjectBrowser1);
    }
    protected override void OnLoad(EventArgs e)
    {
        CheckSecurity();
        base.OnLoad(e);

        ObjectBrowser1.RootFolder = "$/RFMAnalysis/DefaultSystem/Process Engines";
        if (!IsPostBack)
            ObjectBrowser1.DataBind();
    }
    private void CheckSecurity()
    {
        if (Asi.Security.Utility.AppPermission.AppDemand((int)Asi.AppPermissionType.Browse, "RFM") == false)
            Asi.Web.Security.RejectAccess(Controls);

        if (Asi.LicenseManagement.LicenseManager.GetLicenseManager().CheckLegacyLicense("RFM") == false)
        {
            throw new Asi.LicenseManagement.LicenseManagerException(Asi.ResourceManager.GetPhrase("Asi.LicenseManagement.LicenseManager.UserNotLicensedForType",
                "The current user is not licensed to use the type {0}.", new [] { typeof(Asi.RFM.RFMDefinition).FullName }));
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
    public static string[] GetAddressCompletionList(string prefixText, int count)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.GetAddressCompletionList(prefixText);
    }    
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static bool CheckForPasteConflict(string selectedKeys, Guid targetHierarchyKey)
    {
        return Asi.Web.UI.Common.BSA.ObjectBrowserHelper.CheckForPasteConflict(selectedKeys.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries), targetHierarchyKey);
    }
</script>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script id="ResizeEvent" type="text/javascript">
    //<![CDATA[
        addResizeEvent(Window_Resize);
    //]]>
    </script>

    <uc1:DocumentExplorer id="ObjectBrowser1" runat="server" ShowAddress="false" AllowMultiSelect="false" ShowHierarchyTree="false" ShowSummary="false" AllowUpwardNavigation="false" DoubleClickAction="Edit" TypeFilter="FOL,RFM,IQD" />
</asp:Content>