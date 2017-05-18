<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="CertificationModuleMaintenanceList" Src="~/AsiCommon/Controls/CertificationManagement/CertificationModuleMaintenanceList.ascx" %>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(certificationModuleMaintenanceList))
        {
            AddChildUserControl(certificationModuleMaintenanceList);
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

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:CertificationModuleMaintenanceList ID="certificationModuleMaintenanceList" runat="server" />
</asp:Content>