<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/datafieldbuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.DataFieldList" Codebehind="DataFieldList.ascx.cs" %>
<div align="right">
	<asp:Button id="AddButton" Text="xAdd" runat="server" CssClass="BSAText" onclick="AddButton_Click"></asp:Button>&nbsp;
	<asp:Button id="RemoveButton" Text="xRemove" runat="server" CssClass="BSAText" onclick="RemoveButton_Click"></asp:Button>
</div>
<asp:ListBox id="DataFieldListBox" runat="server" AutoPostBack="True" Width="100%" CssClass="BSAText" onselectedindexchanged="DataFieldListBox_SelectedIndexChanged"></asp:ListBox>
<div class="SpacerB"><img height="2" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
