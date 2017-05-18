<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="BOD - Business Object Designer" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="boa" TagName="BOAMain" Src="~/AsiCommon/Controls/BOA/boamain.ascx" %>

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
        ChildUserControls.Add(BOAMain1);
    }
</script>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<boa:BOAMain id="BOAMain1" runat="server" />
</asp:Content>