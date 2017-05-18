<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.AssignmentBuilder" Codebehind="AssignmentBuilder.ascx.cs" %>
<%@ Register TagPrefix="WfDesign" TagName="ResourcePicker" Src="ResourcePicker.ascx" %>
<%@ Register TagPrefix="WfDesign" TagName="ExpressionBuilder" Src="ExpressionBuilder.ascx" %>
<asp:Label id="ToLabel" runat="server" CssClass="BSAPrompt">xAssign To</asp:Label>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<WfDesign:ResourcePicker id="ToResourcePicker" runat="server"></WfDesign:ResourcePicker>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>
<asp:Label id="ValueLabel" runat="server" CssClass="BSAPrompt">xValue</asp:Label>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<WfDesign:ExpressionBuilder id="ValueExpressionBuilder" runat="server"></WfDesign:ExpressionBuilder>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>

