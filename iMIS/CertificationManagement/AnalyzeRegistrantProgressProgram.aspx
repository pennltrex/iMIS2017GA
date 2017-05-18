<%@ Page Language="C#" AutoEventWireup="true"  Inherits="Asi.Web.UI.DisplayPageBase"  MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="asiweb" TagName="AnalyzeRegistrantProgress" Src="~/AsiCommon/Controls/CertificationManagement/AnalyzeRegistrantProgressProgram.ascx" %>

<%@ Import Namespace="Asi.Web.UI"%>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!IsPostBack)
        {
            DataBind();
        }
    }

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AddChildUserControl(AnalyzeRegistrantProgress);
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:AnalyzeRegistrantProgress ID="AnalyzeRegistrantProgress" runat="server" />
</asp:Content>
