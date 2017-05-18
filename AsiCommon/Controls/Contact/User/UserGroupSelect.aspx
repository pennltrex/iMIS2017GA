<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="asi" TagName="FinderAdder" Src="~/AsiCommon/Controls/Shared/FinderAdder/FinderAdder.ascx" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AddChildUserControl(FinderAdder1);
    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        if (!Page.IsPostBack)
            DataBind();
    }
    protected void FinderAdder1_NeedDataSource(object sender, EventArgs e)
    {
        Asi.Business.Common.Group[] groups = Asi.Business.Common.UserController.User(CurrentContext.SubjectUniformKey, Container).GetAvailableGroups(Asi.Business.Common.GroupType.iMISModuleUsers);
        Array.Sort(groups, GroupCompare);
        FinderAdder1.DataSource = groups;
    }
    private static int GroupCompare(Asi.Business.Common.Group g1, Asi.Business.Common.Group g2)
    {
        return string.Compare(g1.Name, g2.Name, StringComparison.CurrentCultureIgnoreCase);
    }
</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<asi:FinderAdder id="FinderAdder1" runat="server" OnNeedDataSource="FinderAdder1_NeedDataSource"
	    DialogMode="true" AllowMultiSelect="true" PagingEnabled="false" AtomName="Group"  />
</asp:Content>