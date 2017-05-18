<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ProcessParticipant" Codebehind="ProcessParticipant.ascx.cs" %>
<div align="right">
	<asp:button id="NewButton" Text="xNew" runat="server" CssClass="BSAText" onclick="NewButton_Click"></asp:button>
	&nbsp;
	<asp:button id="RemoveButton" Text="xRemove" runat="server" CssClass="BSAText" onclick="RemoveButton_Click"></asp:button>
</div>
<asp:listbox id="ParticipantListBox" runat="server" Width="100%" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="ParticipantListBox_SelectedIndexChanged"></asp:listbox>
<div class="SpacerB"><img height="2" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<asp:label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:label>
	&nbsp; <INPUT id="IdHidden" type="hidden" name="IdHidden" runat="server">
	<asp:textbox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:textbox>
	<br>
	<asp:label id="AssigneeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:label>
	&nbsp;
	<asp:Label id="AssigneeNameLabel" runat="server" CssClass="BSAPrompt"></asp:Label>
	&nbsp;&nbsp;
	<asp:button id="SelectButton" Text="xSelect" runat="server" CssClass="BSAText" onclick="SelectButton_Click"></asp:button>
	<br>
	<INPUT id="PlaceHolderHidden" type="hidden" name="PlaceHolderHidden" runat="server">
	<asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>
