<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="uc1" TagName="Template" Src="~/AsiCommon/Controls/ContentManagement/Template.ascx" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script runat="server">
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        Page.Header.Controls.Add(
            new LiteralControl(
                @"<style type='text/css'>
                    .ContentPanel
                    {
                        overflow:auto !important;
                    }
                </style>"
                ));
    }
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        this.AddChildUserControl(TemplateControl1);
    }
    public override bool AjaxAnimationsEnabled
    {
        get
        {
            return false;
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
<asp:Content ID="UserMessagesContant" runat="server" ContentPlaceHolderID="TemplateUserMessages">
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">    
    <uc1:Template id="TemplateControl1" runat="server"></uc1:Template>
    <asi:StaticPostBackPosition runat="server" ID="Staticpostbackposition1"/>
</asp:Content>