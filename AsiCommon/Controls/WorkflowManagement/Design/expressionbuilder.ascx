<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ExpressionBuilder" Codebehind="ExpressionBuilder.ascx.cs" %>
<%@ Register TagPrefix="WfDesign" TagName="ExplicitValueBuilder" Src="ExplicitValueBuilder.ascx" %>
<%@ Register TagPrefix="WfDesign" TagName="ResourcePicker" Src="ResourcePicker.ascx" %>
<asp:Label id="FirstOperandTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xType</asp:Label>
&nbsp;
<asp:DropDownList id="FirstOperandDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="FirstOperandDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<WfDesign:ExplicitValueBuilder id="FirstExplicitValue" runat="server"></WfDesign:ExplicitValueBuilder>
<WfDesign:ResourcePicker id="FirstResourcePicker" runat="server"></WfDesign:ResourcePicker>
<asp:Label id="FirstExpressionLabel" runat="server" style="TEXT-ALIGN:right" Width="284" CssClass="BSAPrompt">xExpression</asp:Label>
<hr>
<asp:Label id="OperatorLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xOperator</asp:Label>
&nbsp;
<asp:DropDownList id="OperatorDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="OperatorDropDownList_SelectedIndexChanged"></asp:DropDownList>
<hr>
<asp:Label id="SecondOperandTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100"
	CssClass="BSAPrompt">xType</asp:Label>
&nbsp;
<asp:DropDownList id="SecondOperandDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="SecondOperandDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<WfDesign:ExplicitValueBuilder id="SecondExplicitValue" runat="server"></WfDesign:ExplicitValueBuilder>
<WfDesign:ResourcePicker id="SecondResourcePicker" runat="server"></WfDesign:ResourcePicker>
<asp:Label id="SecondExpressionLabel" runat="server" style="TEXT-ALIGN:right" Width="284" CssClass="BSAPrompt">xExpression</asp:Label>
