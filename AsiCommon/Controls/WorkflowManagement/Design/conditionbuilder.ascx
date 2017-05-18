<%@ Register TagPrefix="WfDesign" TagName="ResourcePicker" Src="ResourcePicker.ascx" %>
<%@ Register TagPrefix="WfDesign" TagName="ExplicitValueBuilder" Src="ExplicitValueBuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ConditionBuilder" Codebehind="ConditionBuilder.ascx.cs" %>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<WfDesign:ResourcePicker id="FirstResourcePicker" runat="server"></WfDesign:ResourcePicker>
	<hr>
	<asp:Label id="OperatorLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xOperator</asp:Label>
	&nbsp;
	<asp:DropDownList id="OperatorDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
	<hr>
	<asp:Label id="SecondOperandTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xType</asp:Label>
	&nbsp;
	<asp:DropDownList id="SecondOperandDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="SecondOperandDropDownList_SelectedIndexChanged"></asp:DropDownList>
	<br>
	<WfDesign:ExplicitValueBuilder id="SecondExplicitValue" runat="server"></WfDesign:ExplicitValueBuilder>
	<WfDesign:ResourcePicker id="SecondResourcePicker" runat="server"></WfDesign:ResourcePicker>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>
