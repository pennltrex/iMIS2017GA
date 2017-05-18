<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="CertificationProgramRegisterConfirmation" Src="~/AsiCommon/Controls/CertificationManagement/CertificationProgramRegisterConfirmation.ascx" %>


<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(certificationProgramRegisterConfirmation))
        {
            AddChildUserControl(certificationProgramRegisterConfirmation);
        }
    }

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:CertificationProgramRegisterConfirmation ID="certificationProgramRegisterConfirmation" runat="server" />
</asp:Content>
