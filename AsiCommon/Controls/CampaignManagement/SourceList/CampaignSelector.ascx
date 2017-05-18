<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_CampaignSelector" Codebehind="CampaignSelector.ascx.cs" %>
<asiweb:StyledLabel runat="server" CssClass="mdTitle" Text="Please Select a Campaign" />

 <asiResultsViewer:QueryResultGrid ID="CampaignsGrid" runat="Server" 
DeleteEnabled="False" QueryPath = "$/CampaignManagement/DefaultSystem/Queries/CampaignList"
SelectItemBehavior="RaiseEvent"

  />