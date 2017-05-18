<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_SegmentationDefSelectorContainer" Codebehind="SegmentationDefSelectorContainer.ascx.cs" %>
<%@ Register TagPrefix="Campaigns" TagName="JobSelector" Src="~/AsiCommon/Controls/CampaignManagement/SourceList/SegmentationJobSelector.ascx" %>
<%@ Register TagPrefix="Campaigns" TagName="DefSelector" Src="~/AsiCommon/Controls/CampaignManagement/SourceList/SegmentationSelector.ascx" %>

<asp:UpdatePanel ID="JobSelectorUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
        <Campaigns:JobSelector runat="server" ID="JobSelectorControl" />
        <Campaigns:DefSelector runat="server" ID="DefSelectorControl" Visible="false" />
    </ContentTemplate>
</asp:UpdatePanel>
