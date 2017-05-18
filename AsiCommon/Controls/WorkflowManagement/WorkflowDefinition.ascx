
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManagement.WorkflowDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WorkflowDefinition.ascx.cs" %>
<asp:placeholder id=ErrorMsgPlaceHolder runat="server"></asp:placeholder>
<table class=DataTable style="TABLE-LAYOUT: fixed" cellspacing=1 cellpadding=3 align=center border=0>
  <tr>
    <td class="PanelTablePrompt"><asp:label id=lblDescription runat="server"></asp:label></TD>
    <td class="PanelTableValue"><asp:label id=lblDescriptionValue runat="server"></asp:label>&nbsp;</TD></TR>
  <tr>
    <td class="PanelTablePrompt"><asp:label id=lblCreatedDate runat="server"></asp:label></TD>
    <td class="PanelTableValue" nowrap><asp:label id=lblCreatedDateValue runat="server"></asp:label>&nbsp;</TD></TR>
  <tr>
    <td class="PanelTablePrompt"><asp:label id=lblCreatedBy runat="server"></asp:label></TD>
    <td class="PanelTableValue"><asp:label id=lblCreatedByValue runat="server"></asp:label>&nbsp;</TD></TR>
  <tr>
    <td class="PanelTablePrompt"><asp:label id=lblExecutedDate runat="server"></asp:label></TD>
    <td class="PanelTableValue" nowrap><asp:label id=lblExecutedDateValue runat="server"></asp:label>&nbsp;</TD></TR>
  <tr>
    <td class="PanelTablePrompt"><asp:label id=lblWorkStatus runat="server"></asp:label></TD>
    <td class="PanelTableValue"><asp:label id=lblWorkStatusValue runat="server"></asp:label>&nbsp;</TD></TR>
    <asp:panel id=pnlCompletedFields runat="server">
  <tr>
    <td class="PanelTablePrompt"><asp:label id="lblTaskStatus" runat="server"></asp:label></td>
    <td class="PanelTableValue"><asp:label id="lblTaskStatusValue" runat="server"></asp:label>&nbsp;</td></tr>
  <tr>
    <td class="PanelTablePrompt"><asp:label id="lblComment" runat="server"></asp:label></td>
    <td class="PanelTableValue"><asiweb:SmartControl id="scComment" caption="Comment" runat="server" DisplayType="ReadOnlyField"></asiweb:SmartControl></td>
    </tr>
    </asp:panel>
    </TABLE>
