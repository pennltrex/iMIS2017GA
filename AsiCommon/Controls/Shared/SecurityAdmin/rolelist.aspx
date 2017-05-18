<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Role List" %>
<%@ Register TagPrefix="uc1" TagName="List" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/RoleList.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:List id="List1" runat="server"></uc1:List>
</asp:Content>
