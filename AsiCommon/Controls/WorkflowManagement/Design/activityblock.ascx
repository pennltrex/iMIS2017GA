<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ActivityBlock" Codebehind="ActivityBlock.ascx.cs" %>
<asp:Label id="ActivitySetLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xActivity Set</asp:Label>
&nbsp;
<asp:DropDownList id="ActivitySetDropDownList" runat="server" CssClass="BSAText"></asp:DropDownList>
