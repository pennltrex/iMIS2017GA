<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/transitionmain.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/workflowdesigner.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.TransitionDetail" Codebehind="TransitionDetail.ascx.cs" %>
<asp:Label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xName</asp:Label>
&nbsp;
<asp:TextBox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="DescriptionLabel" runat="server" style="text-align:right; vertical-align:top; width:100px" CssClass="BSAPrompt">xDescription</asp:Label>
&nbsp;
<asp:TextBox id="DescriptionTextBox" runat="server" TextMode="MultiLine" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="TypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xType</asp:Label>
&nbsp;
<asp:DropDownList id="TypeDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
