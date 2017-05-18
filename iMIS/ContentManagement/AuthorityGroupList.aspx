<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Content Authority Groups" %>
<%@ Register TagPrefix="cag" TagName="CAGList" Src="~/AsiCommon/Controls/ContentManagement/AuthorityGroupList.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <cag:CAGList id="Setup1" runat="server"/>
</asp:Content>