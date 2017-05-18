<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_SolicitationResponseSelector" Codebehind="SolicitationResponseSelector.ascx.cs" %>
<%@ Register TagPrefix="SouceList" TagName="ResponseStaging" Src="~/AsiCommon/Controls/CampaignManagement/SourceList/ResponseStagingContainer.ascx"%>
<%@ Register TagPrefix="SourceList" TagName="CampaignSelector" Src="~/AsiCommon/Controls/CampaignManagement/SourceList/CampaignSelector.ascx" %>

<asp:UpdatePanel ID="ResponseSelectorUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
        <SourceList:CampaignSelector runat="server" Id="CampaignSelectorControl" />
        <div id="divResponseStagingContainer" runat=server style="display:none">
            <SouceList:ResponseStaging runat="server" ID="ResponseStagingContainer" />    
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
