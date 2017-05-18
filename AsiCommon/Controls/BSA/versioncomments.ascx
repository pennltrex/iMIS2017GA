<%@ Control language="c#" EnableViewState="false" Inherits="Asi.Web.UI.Common.BSA.VersionComments" Codebehind="VersionComments.ascx.cs" %>
<asiweb:PanelTemplateControl ID="VersionsComments" runat="server" ShowHeader="False" Collapsible="false" BorderStyle="none">
<table>
    <tr>
        <td class="PanelField" style="padding:3px;"><asp:label id="VersionLabelLabel" Runat="server"><strong>Version Label</strong></asp:label></td>
        <td style="padding:3px;"><asp:label id="VersionLabel" Runat="server"/></td>
    </tr>
    <tr>
        <td class="PanelField" style="padding:3px;"><asp:label id="VersionCommentLabel" Runat="server"><strong>Version Comment</strong></asp:label></td>
        <td style="padding:3px;"><asp:textbox id="VersionComment" TextMode="MultiLine" rows="4" Columns="40" Runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align:right;padding:3px;" colspan="2"><asiweb:StyledButton ID="UpdateButton" runat="server" Text="Update" /></td>
    </tr>
</table>  
</asiweb:PanelTemplateControl>