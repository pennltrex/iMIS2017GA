<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ProcessDetail" Codebehind="ProcessDetail.ascx.cs" %>
<asp:Label id="NameLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xName</asp:Label>
&nbsp;
<asp:TextBox id="NameTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="DescriptionLabel" runat="server" style="VERTICAL-ALIGN:top; TEXT-ALIGN:right"
	Width="100" CssClass="BSAPrompt">xDescription</asp:Label>
&nbsp;
<asp:TextBox id="DescriptionTextBox" runat="server" TextMode="MultiLine" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="CategoryLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xCategory</asp:Label>
&nbsp;
<asp:TextBox id="CategoryTextBox" runat="server" CssClass="BSAText" Width="250"></asp:TextBox>
<br>
<asp:Label id="CleanupLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xCleanup</asp:Label>
&nbsp;
<asp:CheckBox id="CleanupCheckBox" runat="server" CssClass="BSAText"></asp:CheckBox>
