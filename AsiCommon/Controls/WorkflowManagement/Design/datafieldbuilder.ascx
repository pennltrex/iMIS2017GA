<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.DataFieldBuilder" Codebehind="DataFieldBuilder.ascx.cs" %>
<div style="BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid">
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
	<asp:Label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xName</asp:Label>
	&nbsp;
	<asp:TextBox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
	<br>
	<asp:Label id="DescriptionLabel" runat="server" style="text-align:right; vertical-align:top; width:100px" CssClass="BSAPrompt">xDescription</asp:Label>
	&nbsp;
	<asp:TextBox id="DescriptionTextBox" runat="server" TextMode="MultiLine" CssClass="BSAText" Width="250"></asp:TextBox>
	<br>
	<asp:Label id="DataTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xDataType</asp:Label>
	&nbsp;
	<asp:DropDownList id="DataTypeDropDownList" runat="server" CssClass="BSAText" onselectedindexchanged="DataTypeDropDownList_SelectedIndexChanged"></asp:DropDownList>
	<br>
	<asp:Label id="ValueLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xValue</asp:Label>
	&nbsp;
	<asp:TextBox id="ValueTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
	<asp:CheckBox id="PersistCheckBox" runat="server" Visible="False" Text="xPersist in workflow" CssClass="BSAText"></asp:CheckBox>
	<div class="SpacerB"><img height="4" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
</div>