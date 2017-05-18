<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/FinderAdder/FinderAdder.ascx" TagPrefix="asi" TagName="FinderAdder" %>

<script runat="server" type="Text/C#">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
            DataBind();
    }
    public override bool AjaxAnimationsEnabled
    {
        get
        {
            return false;
        }
    }

    protected void UserFinder_NeedDataSource(object sender, EventArgs e)
    {
        UserFinder.TargetUrl = string.Format("/AsiCommon/Controls/Contact/User/UserEdit.aspx?WebsiteKey={0}", CurrentContext.WebsiteKey);
    }

</script>
    
<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Users" Collapsible="false">
    <asi:FinderAdder ID="UserFinder" runat="server" 
        DocumentPath="$/Common/Queries/SecurityAdministration/UserAdministration" OnNeedDataSource="UserFinder_NeedDataSource"/>
    </asiweb:PanelTemplateControl2>
</asp:Content>
