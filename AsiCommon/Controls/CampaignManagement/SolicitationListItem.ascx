<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SolicitationListItem" Codebehind="SolicitationListItem.ascx.cs" %>
<%@ Register TagName="SourceCodeList" TagPrefix="asiweb" Src="~/AsiCommon/Controls/CampaignManagement/SourceCodeListView.ascx"%>
<tr class="ExpGridRow2">
    <td>
        <a href='javascript:ToggleSourceCodes("<%#SolicitationKey%>");' id='<%#SolicitationKey%>Link' title='<%#Asi.ResourceManager.GetPhrase("CampaignMangement.ShowSourceCode","Show Source Codes for this Solicitation.")%>'><script type="text/javascript">document.write(imageHtml.replace("{0}",solicitationsShown?collapsedImageSrc:expandedImageSrc));</script></a>
        <input type="hidden" id="appealkey" value="<%#AppealKey%>" />
        <input type="hidden" id="<%#SolicitationKey%>Collapsed" value="1" />
        <input type="hidden" id="solicitationrow" value="1" />
    </td>
    <td><asp:HyperLink runat="server" ID="SelectLink" NavigateUrl='<%#SelectUrl%>' ToolTip="Edit Item" Text="select" translate="yes" /></td>
    <td><asiweb:SmartControl runat="server" ID="Name" BoundPropertyName="Name" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl1" BoundPropertyName="TotalRevenue" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl2" BoundPropertyName="TargetRevenue" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl3" BoundPropertyName="OverheadCost" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl4" BoundPropertyName="DisplayROIPercentage" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl5" BoundPropertyName="StartDate" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl6" BoundPropertyName="EndDate" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl runat="server" ID="SmartControl7" BoundPropertyName="SolicitationStatusCode" DisplayType="ReadOnlyField" translate="yes"/></td>
</tr>
<asiweb:SourceCodeList runat="server" ID="SourceCodeList" />
