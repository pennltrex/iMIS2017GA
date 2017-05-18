<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/transitionmain.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/conditionbuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.TransitionCondition" Codebehind="TransitionCondition.ascx.cs" %>
<asp:DropDownList id="EvaluationDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<div align="right">
	<asp:Button id="AddButton" Text="xAdd" runat="server" CssClass="BSAText" onclick="AddButton_Click"></asp:Button>&nbsp;
	<asp:Button id="RemoveButton" Text="xRemove" runat="server" CssClass="BSAText" onclick="RemoveButton_Click"></asp:Button>
</div>
<asp:ListBox id="ConditionListBox" runat="server" AutoPostBack="True" Width="100%" CssClass="BSAText" onselectedindexchanged="ConditionListBox_SelectedIndexChanged"></asp:ListBox>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
