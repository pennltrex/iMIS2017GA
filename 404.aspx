<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>

<script language="C#" runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        Response.StatusCode = 404;
    }
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody" >
    <H1>Server Error</H1>
    <H2><i>HTTP Error 404 - File or directory not found.</i></H2>
    <B>Description:</B> The resource you are looking for might have been removed, had its name changed, or is temporarily unavailable.
</asp:Content>