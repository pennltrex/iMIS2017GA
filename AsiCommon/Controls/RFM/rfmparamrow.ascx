<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMParamRow" Codebehind="RFMParamRow.ascx.cs" %>

<div class="FloatNone PanelField">
    <asp:label id="RankingLabel" runat="server" Width="30px"/>
    <asiweb:BusinessTextBox id="RankingText" runat="server" width="60px" cssclass="InputNumeric" ontextchanged="RankingText_TextChanged" />
    <asp:ImageButton id="AddButton" runat="server" SkinID="PanelCommandButtonAdd" onclick="AddButton_Click" />
    <asp:ImageButton id="RemoveButton" runat="server" SkinID="PanelCommandButtonDelete" onclick="RemoveButton_Click" />
</div>

