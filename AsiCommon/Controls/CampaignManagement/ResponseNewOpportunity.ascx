<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_ResponseNewOpportunity" Codebehind="ResponseNewOpportunity.ascx.cs" %>
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="<%#TemplateTitle%>" Collapsible="false">

    <asiweb:BusinessDropDownList ID="OpportunityTypeList" runat="Server" ShowNullItem="false"
     QueryPath="$/OpportunityManagement/DefaultSystem/Queries/OpportunityTypeList/Default" 
     DataTextField="Name" DataValueField="key_OpportunityTypeKey" 
    />

    <asp:Button ID="NewOpportunityButton" runat="Server" Text="New" UseSubmitBehavior="false" CssClass="TextButton" />

    <asiResultsViewer:QueryResultGrid ID="OpportunityGrid" runat="Server" 
     DeleteEnabled="False" 
     DeleteConfirmationEnabled="False" 
     QueryPath = "$/OpportunityManagement/DefaultSystem/Queries/OpportunityList/Default" 
     CreateNewEnabled="False"
     SelectEnabled="true"
     UseUniformKey="true"
    />

</asiweb:PanelTemplateControl2>