<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="cag" TagName="Setup" Src="~/AsiCommon/Controls/ContentManagement/AuthorityGroupSetup.ascx" %>

<script runat="server" language="C#">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(Setup1);
    }
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <cag:Setup id="Setup1" runat="server"/>
</asp:Content>