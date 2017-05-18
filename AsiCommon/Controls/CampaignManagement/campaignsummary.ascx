<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.CampaignSummary" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>

<script runat="server">

    public override string AtomComponentName
    {
        get
        {
            return "Campaign";
        }
    }

    public Asi.Business.CampaignManagement.Campaign Campaign
    {
        get
        {
            EnsureAtomObject();
            return AtomObject[0] as Asi.Business.CampaignManagement.Campaign;
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Campaign", "BusinessController").RegisteredComponentKey;
        WorkflowStatusControl.BusinessItemKey = Campaign.CampaignKey; 
        WorkflowStatusControl.SuccessStatusMessage = Asi.ResourceManager.GetPhrase("CampaignWorkflowSuccessStatus", "Output has been generated for this campaign ");
        WorkflowStatusControl.NoWorkflowItemSubmitted = Asi.ResourceManager.GetPhrase("Campaign_NoWorkflowItemSubmitted", "Output has not been generated for this campaign");
        WorkflowStatusControl.WorkflowItemSubmitted = Asi.ResourceManager.GetPhrase("Campaign_WorkflowItemSubmitted", "Output Generation has been submitted for this campaign ");
        WorkflowStatusControl.ErrorStatusMessage = Asi.ResourceManager.GetPhrase("CampaignWorkflowSuccessStatus", "An error has occured while generating output for this campaign");
        PredictedResponseRateInput.Caption.Replace("Display","");
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        NameInput.Caption = GetTranslatedPhrase("Name");
        NameInput.BoundPropertyName = "Name";
        CreatedByInput.Caption = GetTranslatedPhrase("Created by");
        CreatedByInput.BoundPropertyName = "CreatedByUserKey";
        UpdatedByUserKeyInput.Caption = GetTranslatedPhrase("Updated by");
        UpdatedByUserKeyInput.BoundPropertyName = "UpdatedByUserKey";
        DescriptionInput.Caption = GetTranslatedPhrase("Description");
        DescriptionInput.BoundPropertyName = "Description";
        DataBind();
        
        
    }
</script>
      
<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
            <asiweb:SmartControl runat="server" ID="NameInput"  DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
            <asiweb:SmartControl translate="yes" runat="server" ID="CampaignTypeCodeInput" BoundPropertyName="CampaignTypeCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
            <asiweb:SmartControl translate="yes" runat="server" ID="StatusInput" BoundPropertyName="CampaignStatusCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
            <asiweb:SmartControl translate="yes" runat="server" ID="StartDateInput" BoundPropertyName="StartDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
            <asiweb:SmartControl translate="yes" runat="server" ID="EndDateInput" BoundPropertyName="EndDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />

        <div id="Div1" class="PanelFieldGraph Left">
            <asiweb:iPieChart id="IPieChart1" runat="server" ExploadOffset="35" FontType="Tahoma" Pie3DRatio="8" PieRatio="70" FontSize="7"></asiweb:iPieChart>  
        </div> 
        
        <asiweb:SmartControl translate="yes" runat="server" ID="SmartControl2" BoundPropertyName="TotalRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="SmartControl6" BoundPropertyName="RelevantCost" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="SmartControl4" BoundPropertyName="TargetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="RevenuePerThousandInput" BoundPropertyName="RevenuePerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="CostPerThousandCaption" BoundPropertyName="CostPerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="ROIPercentageInput" BoundPropertyName="DisplayROIPercentage" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="ROI Percentage" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="ResponseRateInput" BoundPropertyName="DisplayResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Response Rate" NullValue="&nbsp;" />
             
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
        
        <asiweb:SmartControl translate="yes" runat="server" ID="CampaignCodeInput" BoundPropertyName="LegacyCampaignCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="CreatedByInput"  DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="CreatedOnInput" BoundPropertyName="CreatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedByUserKeyInput"  DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="UpdatedOnInput" BoundPropertyName="UpdatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="DescriptionInput"  DisplayType="ReadOnlyField" DisplayCaption="true" Height="187px" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="NetRevenueInput" BoundPropertyName="NetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="SmartControl8" BoundPropertyName="FirstResponseDate" DisplayType="ReadOnlyField" NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl translate="yes" runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="ReadOnlyField" NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl translate="yes" runat="server" ID="HighResponseAmountInput" BoundPropertyName="HighResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="AverageTransactionAmountInput" BoundPropertyName="AverageTransactionAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="LowResponseAmountCaption" BoundPropertyName="LowResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl translate="yes" runat="server" ID="PredictedResponseRateInput" BoundPropertyName="DisplayPredictedResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Predicted Response Rate" NullValue="&nbsp;" />
             
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>
    
<table cellpadding="0" cellspacing="0">
    <uc1:AdditionalProperties ID="AdditionalProperties1" runat="server" IsEditable="False"></uc1:AdditionalProperties>
</table>
<br />
<br />
<table cellpadding="0" cellspacing="0">
<tr>
   	<td class="PanelTableValue" valign="middle" align="left">
        <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server" />  
  </td>
</tr>
</table>