<%@ Page Language="C#" Title="View Theme Task List" Inherits="iMIS_ContentManagement_ThemeTaskList" Codebehind="ThemeTaskList.aspx.cs" %>
<%@ Register TagName="ThemeTaskList" TagPrefix="cc1" src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ThemeTaskList.ascx"%>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="TemplateBody">
    <cc1:ThemeTaskList ID="ThemeTaskListControl" runat="server" />
</asp:Content>
