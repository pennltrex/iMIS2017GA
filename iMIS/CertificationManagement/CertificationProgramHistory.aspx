<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="CertificationProgramHistory" Src="~/AsiCommon/Controls/CertificationManagement/CertificationProgramHistory.ascx" %>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(certificationProgramHistory))
        {
            AddChildUserControl(certificationProgramHistory);
        }
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:CertificationProgramHistory ID="certificationProgramHistory" runat="server" />
</asp:Content>