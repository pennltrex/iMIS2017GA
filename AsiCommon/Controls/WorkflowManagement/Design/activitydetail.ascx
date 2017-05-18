<%@ Reference Control="~/asicommon/controls/workflowmanagement/workflowdesigner.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ActivityDetail" Codebehind="ActivityDetail.ascx.cs" %>
<asp:Label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xName</asp:Label>
&nbsp;
<asp:TextBox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="DescriptionLabel" runat="server" style="text-align:right; vertical-align:top; width:100px" CssClass="BSAPrompt">xDescription</asp:Label>
&nbsp;
<asp:TextBox id="DescriptionTextBox" runat="server" TextMode="MultiLine" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="ImplementationLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xType</asp:Label>
&nbsp;			
<asp:DropDownList id="ImplementationDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="JoinTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xJoin Type</asp:Label>
&nbsp;			
<asp:DropDownList id="JoinTypeDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="SplitTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xSplit Type</asp:Label>
&nbsp;			
<asp:DropDownList id="SplitTypeDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="ResponsibleLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xResponsible</asp:Label>
&nbsp;
<asp:DropDownList id="ResponsibleDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
<br>
<asp:Label id="Label1" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:Label>
&nbsp;
<asp:CheckBox id="StartCheckpointCheckBox" runat="server" CssClass="BSAText"></asp:CheckBox>
<br>
<asp:Label id="Label2" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:Label>
&nbsp;
<asp:CheckBox id="FinishCheckpointCheckBox" runat="server" CssClass="BSAText"></asp:CheckBox>
