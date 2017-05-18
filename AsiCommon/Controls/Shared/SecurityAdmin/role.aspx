<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Role Editor" %>
<%@ Register TagPrefix="uc1" TagName="RolesPortfolio" Src="Role.ascx" %>

<asp:Content id="RolesContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:RolesPortfolio id="RolesPortfolio" runat="server"></uc1:RolesPortfolio>
</asp:Content>
