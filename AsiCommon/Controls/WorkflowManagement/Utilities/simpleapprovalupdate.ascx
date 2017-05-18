<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SimpleApprovalUpdate" Codebehind="SimpleApprovalUpdate.ascx.cs" %>
<P align="center">
	<asp:Button id="ApproveButton" runat="server" Text="xApprove" onclick="ApproveButton_Click"></asp:Button>&nbsp;
	<asp:Button id="RejectButton" runat="server" Text="xReject" onclick="RejectButton_Click"></asp:Button></P>
<p align="center">
	<asp:Literal id="MarkupLiteral" runat="server"></asp:Literal>
</p>
<p align="center"><asp:Label id="MessageLabel" runat="server">xMessage</asp:Label></p>
