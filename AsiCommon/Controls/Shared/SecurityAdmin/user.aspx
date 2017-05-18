<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="uc1" TagName="UserPortfolio" Src="User.ascx" %>

<asp:Content id="UserContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:UserPortfolio id="UserPort1" runat="server"></uc1:UserPortfolio>
</asp:Content>