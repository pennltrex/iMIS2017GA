<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Document Editor" %>
<%@ Register TagPrefix="uc1" TagName="DocLoadPort" Src="~/AsiCommon/Controls/Shared/DocumentLoadUtility/DocumentEditor.ascx" %>

<script runat="server">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(DocLoadPort1);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!IsPostBack)
            DataBind();
    }
</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:docloadport id="DocLoadPort1" runat="server"></uc1:docloadport>
</asp:Content>
