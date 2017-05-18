<%@ Control Language="c#" AutoEventWireup="false" Inherits="ChildSummaryScreen" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>
   
<script runat="server">
    public override string AtomComponentName
    {
        get
        {
            return "Appeal";
        }
    }

    public Asi.Business.CampaignManagement.Appeal Appeal
    {
        get
        {
            EnsureAtomObject();
            return AtomObject[0] as Asi.Business.CampaignManagement.Appeal;
        }
    }
        
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        SetOverrideMessage() ;
    }
        
    private void SetOverrideMessage()
    {
        WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Appeal", "BusinessController").RegisteredComponentKey;
        WorkflowStatusControl.BusinessItemKey = Appeal.AppealKey;
        if (WorkflowStatusControl.StatusMonitor == null)
        {
            // get the ASM associated with the parent
            WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Campaign", "BusinessController").RegisteredComponentKey;
            WorkflowStatusControl.BusinessItemKey = Appeal.Campaign.CampaignKey;
        }
            
        if (WorkflowStatusControl.StatusMonitor != null)
        {
            WorkflowStatusControl.SuccessStatusMessage = Asi.ResourceManager.GetPhrase("AppealWorkflowSuccessStatus", "Output has been generated for this appeal");
        }
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
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>

<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" Collapsible="false" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
        <asiweb:SmartControl runat="server" ID="NameInput" DisplayType="ReadOnlyField" translate="no" DisplayCaption="true" NullValue="&nbsp;"/>
 
        <div id="Div1" class="PanelField Left" style="height:22px;">
            <asiweb:BusinessLabel runat="server" ID="CampaignName" BoundPropertyName="CampaignKey" AssociatedControlID="ParentLink" Text="Campaign" />           
            <asiweb:StyledHyperLink runat="server" Id="ParentLink"><%#Parent.Name%></asiweb:StyledHyperLink>          
        </div>
       
        <asiweb:SmartControl runat="server" ID="CreatedByInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="StartDateInput" BoundPropertyName="StartDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="EndDateInput" BoundPropertyName="EndDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        
        <div id="Div2" class="PanelFieldGraph Left">
            <asiweb:iPieChart id="IPieChart1" runat="server" ExploadOffset="35" FontType="Tahoma" Pie3DRatio="8" PieRatio="70" FontSize="7"></asiweb:iPieChart>  
        </div>  
          
        <asiweb:SmartControl runat="server" ID="SmartControl2" BoundPropertyName="TotalRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl6" BoundPropertyName="RelevantCost" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl4" BoundPropertyName="TargetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="RevenuePerThousandInput" BoundPropertyName="RevenuePerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="CostPerThousandCaption" BoundPropertyName="CostPerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ROIPercentageInput" BoundPropertyName="DisplayROIPercentage" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="ROI Percentage" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ResponseRateInput" BoundPropertyName="DisplayResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Response Rate" NullValue="&nbsp;" />
               
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
        
        <asiweb:SmartControl runat="server" ID="StatusCodeInput" BoundPropertyName="AppealStatusCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="CreatedOnInput" BoundPropertyName="CreatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedByUserKeyInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedOnInput" BoundPropertyName="UpdatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="DescriptionInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" Height="217px" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="NetRevenueInput" BoundPropertyName="NetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl8" BoundPropertyName="FirstResponseDate" DisplayType="ReadOnlyField" NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="ReadOnlyField"  NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="HighResponseAmountInput" BoundPropertyName="HighResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="AverageTransactionAmountInput" BoundPropertyName="AverageTransactionAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="LowResponseAmountCaption" BoundPropertyName="LowResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="PredictedResponseRateInput" BoundPropertyName="DisplayPredictedResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Predicted Response Rate" NullValue="&nbsp;" />
        
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>

<table cellpadding="0" cellspacing="0">
    <uc1:AdditionalProperties ID="AdditionalProperties1" runat="server" IsEditable="False" AtomComponentName="Appeal"></uc1:AdditionalProperties>
</table>
<br />
<br />
<table cellpadding="0" cellspacing="0">
<tr>
  	<td class="PanelTableValue" valign="middle" align="left">
        <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server" 
         BusinessItemKey = "<%#Appeal.AppealKey%>" 
         NoWorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("Appeal_NoWorkflowItemSubmitted", "Output has not been generated for this appeal") %>' 
         WorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("Appeal_WorkflowItemSubmitted", "Output Generation has been submitted for this appeal ") %>' 
         SuccessStatusMessage = '<%# Asi.ResourceManager.GetPhrase("AppealWorkflowSuccessStatus", "Output has been generated for this appeal ")  %>'  
         ErrorStatusMessage = '<%# Asi.ResourceManager.GetPhrase("AppealWorkflowSuccessStatus", "An error has occured while generating output for this appeal")  %>'  
         ComponentKey = '<%# Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Appeal", "BusinessController").RegisteredComponentKey %>'
             ></WSDC:WorkflowStatusDisplayControl>
  	</td>
</tr>
</table>


 