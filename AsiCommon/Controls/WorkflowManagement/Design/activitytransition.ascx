<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ActivityTransition" Codebehind="ActivityTransition.ascx.cs" %>
<asp:label id="TransitionLabel" CssClass="BSAPrompt" runat="server">xCondition Transitions</asp:label>
<div align="right"><asp:button id="UpButton" CssClass="BSAText" runat="server" Text="xMove Up" onclick="UpButton_Click"></asp:button>&nbsp;
	<asp:button id="DownButton" CssClass="BSAText" runat="server" Text="xMove Down" onclick="DownButton_Click"></asp:button></div>
<asp:ListBox id="TransitionListBox" runat="server" Width="100%" CssClass="BSAText"></asp:ListBox>
<br>
<br>
<asp:Label id="ExceptionLabel" runat="server" CssClass="BSAPrompt">xException Transitions</asp:Label>
<div align="right">
	<asp:Button id="ExceptionUpButton" Text="xMove Up" runat="server" CssClass="BSAText" onclick="ExceptionUpButton_Click"></asp:Button>&nbsp;
	<asp:Button id="ExceptionDownButton" Text="xMove Down" runat="server" CssClass="BSAText" onclick="ExceptionDownButton_Click"></asp:Button>
</div>
<asp:ListBox id="ExceptionListbox" runat="server" Width="100%" CssClass="BSAText"></asp:ListBox>
