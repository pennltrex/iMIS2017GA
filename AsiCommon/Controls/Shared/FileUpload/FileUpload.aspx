<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Upload File" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="uc1" TagName="FileUpload" Src="FileUpload.ascx" %>

<script runat="server" language="C#">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!IsPostBack)
        {
            if (Request.QueryString["DocumentStorageKey"] != null)
                FileUpload1.DocumentStorageKey = new Guid(Request.QueryString["DocumentStorageKey"]);
            if (Request.QueryString["DocumentServerPath"] != null)
                FileUpload1.DocumentServerPath = Request.QueryString["DocumentServerPath"];
        }
    }

    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        AddChildUserControl(FileUpload1);
    }
</script>

<asp:Content ID="TemplateUserMessages" runat="server" ContentPlaceHolderID="TemplateUserMessages"></asp:Content>
<asp:Content ID="TemplateBody" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:FileUpload id="FileUpload1" runat="server" DialogMode="true" />
</asp:Content>