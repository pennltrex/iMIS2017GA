<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Select Item" %>
<%@ Register TagPrefix="uc1" TagName="FinderAdder" Src="FinderAdder.ascx" %>

<script language="C#" runat="server">
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }
    public override bool AjaxChildrenAsTriggers
    {
        get { return false; }
    }
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(FinderAdder1);
    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.User.Identity.IsAuthenticated)
            Response.Redirect("~/AsiCommon/Controls/Shared/FormsAuthentication/Login.aspx");

        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }
    public override Asi.Atom.IAtom CreateAtomObject()
    {
        return null;
    }
</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:FinderAdder id="FinderAdder1" runat="server" AllowExport="true"></uc1:FinderAdder>
</asp:Content>
