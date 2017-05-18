<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.FormsAuthentication.Logout" Codebehind="Logout.ascx.cs" %>
<asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/iMIS/ContentManagement/Template.aspx?NavigationCode=Home" OnLoggedOut="LoginStatus1_OnLoggedOut" />
