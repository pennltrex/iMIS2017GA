<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/assignmentlist.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ActivityAssignments" Codebehind="ActivityAssignments.ascx.cs" %>
<asp:DropDownList id="WhenDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="WhenDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
