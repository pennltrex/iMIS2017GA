<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="bsa" TagName="DefaultSummary" Src="~/asicommon/controls/bsa/documentsummarydefault.ascx" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <bsa:DefaultSummary ID="DefaultSummaryControl" runat="server" />
</asp:Content>