<%@ Page Language="C#" AutoEventWireup="true"  Inherits="Asi.Web.UI.DisplayPageBase"  MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="asiweb" TagName="AnalyzeRegistrantProgress" Src="~/AsiCommon/Controls/CertificationManagement/AnalyzeRegistrantProgressList.ascx" %>

<%@ Import Namespace="Asi.Web.UI"%>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        PieChart1.DataBind();
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:AnalyzeRegistrantProgress ID="PieChart1" runat="server" />
</asp:Content>
