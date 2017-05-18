<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/assignmentbuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.AssignmentList" Codebehind="AssignmentList.ascx.cs" %>
<div align="right">
	<asp:Button id="AddButton" Text="xAdd" runat="server" CssClass="BSAText" onclick="AddButton_Click"></asp:Button>&nbsp;
	<asp:Button id="RemoveButton" Text="xRemove" runat="server" CssClass="BSAText" onclick="RemoveButton_Click"></asp:Button>
</div>
<asp:ListBox id="AssignmentListBox" runat="server" AutoPostBack="True" Width="100%" CssClass="BSAText" onselectedindexchanged="AssignmentListBox_SelectedIndexChanged"></asp:ListBox>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
