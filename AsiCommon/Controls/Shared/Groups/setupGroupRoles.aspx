<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Setup Groups" %>
<%@ Register TagPrefix="uc1" TagName="SetupGroupRoles" Src="SetupGroupRoles.ascx" %>

<asp:Content id="SetupGroups" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:SetupGroupRoles id="SetupGroupRolesControl" runat="server"/>
</asp:Content>

