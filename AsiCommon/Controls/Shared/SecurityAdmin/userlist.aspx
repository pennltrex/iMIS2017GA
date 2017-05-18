<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="User Maintenance" %>
<%@ Register TagPrefix="uc1" TagName="UserList" Src="UserList.ascx" %>

<asp:Content id="UserListContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<uc1:UserList id="TheUserList" runat="server"></uc1:UserList>
</asp:Content>
