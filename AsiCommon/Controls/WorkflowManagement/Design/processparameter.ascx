<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/datafieldlist.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ProcessParameter" Codebehind="ProcessParameter.ascx.cs" %>
<asp:DropDownList id="ParameterDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="ParameterDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
