<%@ Reference Control="~/asicommon/controls/workflowmanagement/workflowdesigner.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ActivityApplication" Codebehind="ActivityApplication.ascx.cs" %>
<asp:Label id="ApplicationLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xApplication</asp:Label>
&nbsp;
<asp:DropDownList id="ApplicationDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="ApplicationDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<asp:Label id="PanelPurposeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xPanel Purpose</asp:Label>
&nbsp;
<asp:DropDownList id="PanelPurposeDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="PanelPurposeDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<asp:Label id="ShowGoLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xShow And Go</asp:Label>
&nbsp;
<asp:CheckBox id="ShowGoCheckBox" runat="server" CssClass="BSAText"></asp:CheckBox>
<br>
<asp:Label id="SpecificPanelLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xSpecific Panel</asp:Label>
&nbsp;
<asp:DropDownList id="SpecificDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="SpecificParametersLabel" runat="server" style="TEXT-ALIGN:right" Width="100"
	CssClass="BSAPrompt">xSpecific Params</asp:Label>
&nbsp;
<asp:DropDownList id="ParametersPanelDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="MethodLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xMethod Name</asp:Label>
&nbsp;
<asp:DropDownList id="MethodDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="ExecutionModeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xExecution Mode</asp:Label>
&nbsp;
<asp:DropDownList id="ExecutionModeDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="PriorityLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xPriority</asp:Label>
&nbsp;
<asp:DropDownList id="PriorityDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="RetryLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xRetry Count</asp:Label>
&nbsp;
<asp:DropDownList id="RetryDropdownlist" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="PerformerLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xPerformer</asp:Label>
&nbsp;
<asp:DropDownList id="PerformerDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="CategoryLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xCategory</asp:Label>
&nbsp;
<asp:TextBox id="CategoryTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="MessageLabel" runat="server" style="VERTICAL-ALIGN:top; TEXT-ALIGN:right" Width="100"
	CssClass="BSAPrompt">xMessage</asp:Label>
&nbsp;
<asp:TextBox id="MessageTextBox" runat="server" TextMode="MultiLine" CssClass="BSAText" Width="250"></asp:TextBox>
