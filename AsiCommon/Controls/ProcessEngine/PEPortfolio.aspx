<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="uc1" TagName="PEPortfolio" Src="~/AsiCommon/Controls/ProcessEngine/PEPortfolio.ascx" %>


<asp:Content id="PEPortfolioContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <link rel="Configuration" href="<% = Asi.Web.Utilities.GetTildeExpansion() %>/DownloadBin/ClientConfig.xml" />
    <uc1:PEPortfolio id="PEPortfolio1" runat="server"></uc1:PEPortfolio>
</asp:Content>