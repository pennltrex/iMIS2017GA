<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ProcessApplication" Codebehind="ProcessApplication.ascx.cs" %>
<div align="right">
	<asp:button id="NewButton" Text="xNew" runat="server" CssClass="BSAText" onclick="NewButton_Click"></asp:button>
	&nbsp;
	<asp:button id="RemoveButton" Text="xRemove" runat="server" CssClass="BSAText"></asp:button>
</div>
<asp:listbox id="ApplicationListBox" runat="server" Width="100%" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="ApplicationListBox_SelectedIndexChanged"></asp:listbox>
<div class="SpacerB"><img height="2" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<asp:label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:label>
	&nbsp;
	<asp:textbox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:textbox>
	<INPUT id="IdHidden" type="hidden" name="IdHidden" runat="server">
	<br>
	<asp:label id="TypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:label>
	&nbsp;
	<asp:dropdownlist id="TypeDropDownList" runat="server" CssClass="BSAText"></asp:dropdownlist>
	<asp:Label id="TypeNameLabel" runat="server" CssClass="BSAPrompt"></asp:Label>
	<br>
	<asp:label id="Label1" runat="server" style="text-align:right; width:103px"></asp:label>
	&nbsp;
	<asp:button id="CreateButton" Text="xCreate" runat="server" CssClass="BSAText" onclick="CreateButton_Click"></asp:button>
	<br>
	<asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>
	<asp:placeholder id="PlaceHolder2" runat="server"></asp:placeholder>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>
