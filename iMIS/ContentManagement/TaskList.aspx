<%@ Page Language="C#" Title="View Task List" Inherits="iMIS_ContentManagement_TaskList" Codebehind="TaskList.aspx.cs" %>
<%@ Register TagName="TaskList" TagPrefix="cc1" src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/TaskList.ascx"%>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="TemplateBody">
    <cc1:TaskList ID="TaskListControl" runat="server" />
</asp:Content>
