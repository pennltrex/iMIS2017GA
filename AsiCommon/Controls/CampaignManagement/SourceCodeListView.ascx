<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceCodeListView" Codebehind="SourceCodeListView.ascx.cs" %>
<%@Register TagName="SourceCodeListItem" TagPrefix="asiweb" Src="~/AsiCommon/Controls/CampaignManagement/SourceCodeListItem.ascx"%>
<asp:Repeater runat="server" ID="SourceCodeRepeater" DataSource="<%#GetSourceCodes()%>">
    <ItemTemplate>
        <tr class="ExpGridAlternateRow" style="display:none;">
            <td style="background:#FFFFFF;">
                <input type="hidden" id="appealkey" value="<%#AppealKey%>" />
                <input type="hidden" id="solicitationkey" value="<%#SolicitationKey%>" />
                <input type="hidden" id="sourcecoderow" value="1" />
                &nbsp;
            </td>
            <td style="background:#FFFFFF;">&nbsp;</td>
            <asiweb:SourceCodeListItem runat="server" ID="SourceCodeListItem" />
        </tr>
    </ItemTemplate>
</asp:Repeater>
       