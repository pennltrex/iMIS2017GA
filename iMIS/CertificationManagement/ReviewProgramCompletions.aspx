<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="ReviewProgramCompletions" Src="~/AsiCommon/Controls/CertificationManagement/ReviewProgramCompletions.ascx" %>

<script runat="server">

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        ReviewProgramCompletions.DataBind();
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:ReviewProgramCompletions ID="ReviewProgramCompletions" runat="server" />
</asp:Content>
