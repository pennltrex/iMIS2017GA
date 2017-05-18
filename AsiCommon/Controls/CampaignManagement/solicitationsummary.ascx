<%@ Control Language="c#" AutoEventWireup="false" Inherits="ChildSummaryScreen" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>

<script runat="server">

    public override string AtomComponentName
    {
        get
        {
            return "Solicitation";
        }
    }
    
    public Asi.Business.CampaignManagement.Solicitation Solicitation
    {
        get
        {
            EnsureAtomObject();
            return AtomObject[0] as Asi.Business.CampaignManagement.Solicitation;
        }
    }
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);      
        WorkflowStatusControl.SuccessStatusMessage = Asi.ResourceManager.GetPhrase("SolicitationWorkflowSuccessStatus", "Output has been generated for this solicitation  ");
        WorkflowStatusControl.NoWorkflowItemSubmitted = Asi.ResourceManager.GetPhrase("Solicitation_NoWorkflowItemSubmitted", "Output has not been generated for this solicitation");
        WorkflowStatusControl.WorkflowItemSubmitted = Asi.ResourceManager.GetPhrase("Solicitation_WorkflowItemSubmitted", "Output Generation has been submitted for this solicitation ");
        WorkflowStatusControl.ErrorStatusMessage = Asi.ResourceManager.GetPhrase("SolicitationWorkflowSuccessStatus", "An error has occured while generating output for this solicitation");
        SetOverrideMessage();
    }
    
    public override void  DataBind()
    {
        AppealKey.BoundAtom = Solicitation;

        base.DataBind();
        
        CampaignLink.NavigateFromTemplateUrl = String.Format(PARENT_LINK_FORMAT_STRING, "Campaign", Solicitation.Appeal.CampaignKey);
        CampaignLink.Text = Asi.Business.CampaignManagement.CampaignController.Campaign((Guid)Solicitation.Appeal.CampaignKey, Container).Name;
    }

    private void SetOverrideMessage()
    {
        WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Solicitation", "BusinessController").RegisteredComponentKey;
        WorkflowStatusControl.BusinessItemKey = Solicitation.SolicitationKey ;

        if (WorkflowStatusControl.StatusMonitor == null)
          {
              // get the ASM associated with the parent
            WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Appeal", "BusinessController").RegisteredComponentKey;
            WorkflowStatusControl.BusinessItemKey = Solicitation.Appeal.AppealKey ;
            if (WorkflowStatusControl.StatusMonitor == null)
            {
                // get the ASM associated with the parent
                WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Campaign", "BusinessController").RegisteredComponentKey;
                WorkflowStatusControl.BusinessItemKey = Solicitation.Appeal.Campaign.CampaignKey ;
            }
          }
        if (WorkflowStatusControl.StatusMonitor != null)
        {
            WorkflowStatusControl.SuccessStatusMessage = Asi.ResourceManager.GetPhrase("solicitationWorkflowSuccessStatus", "Output has been generated for this solicitation");
        }
    }
    
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        if (this.Solicitation != null &&
            this.Solicitation.Appeal != null &&
            this.Solicitation.Appeal.Campaign != null)
        {
            Asi.Business.CampaignManagement.CampaignBudgetLevel bLevelEnum =
                Asi.Web.UI.Common.CampaignManagement.CMCommon.GetBudgetLevel(this.Solicitation.Appeal.Campaign.SystemKey);
            if (bLevelEnum == Asi.Business.CampaignManagement.CampaignBudgetLevel.Appeal)
            {
                this.TargetRevenueInput.Visible = false;
                this.SmartControl6.Visible = false;
                this.CostPerThousandInput.Visible = false;
                this.ROIPercentageInput.Visible = false;
            }
        }
     
       
            

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
 
<asiweb:PanelTemplateControl2 runat="server" ShowHeader="false" FieldSet="true" RoundedCorners="false" BorderStyle="None" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
        <asiweb:SmartControl runat="server" ID="NameInput" translate="no"   DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div1" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="AppealKey" BoundPropertyName="AppealKey" AssociatedControlID="ParentLink" />           
            <asiweb:StyledHyperLink runat="server" Id="ParentLink"><%#Parent.Name%></asiweb:StyledHyperLink>          
        </div>
        <asiweb:SmartControl runat="server" ID="CreatedByInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="StartDateInput" BoundPropertyName="StartDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="EndDateInput" BoundPropertyName="EndDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div3" class="PanelFieldGraph Left">
            <asiweb:iPieChart id="IPieChart1" runat="server" ExploadOffset="35" FontType="Tahoma" Pie3DRatio="8" PieRatio="70" FontSize="7"></asiweb:iPieChart>
        </div>
        <asiweb:SmartControl runat="server" ID="SmartControl2" BoundPropertyName="TotalRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl6" BoundPropertyName="RelevantCost" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="TargetRevenueInput" BoundPropertyName="TargetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="RevenuePerThousandInput" BoundPropertyName="RevenuePerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="CostPerThousandInput" BoundPropertyName="CostPerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ROIPercentageInput" BoundPropertyName="DisplayROIPercentage" DisplayType="ReadOnlyField" DisplayCaption="true" UnitText="%" Caption="ROI Percentage" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ResponseRateInput" BoundPropertyName="DisplayResponseRate" DisplayType="ReadOnlyField" DisplayCaption="true" UnitText="%" Caption="Response Rate" NullValue="&nbsp;" />
    
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
    
        <asiweb:SmartControl runat="server" ID="StatusCodeInput" BoundPropertyName="SolicitationStatusCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div2" class="PanelField Left">
            <asiweb:StyledLabel ID="CampaignLabel" runat="server" Text="Campaign" AssociatedControlID="CampaignLink" />
            <asiweb:StyledHyperlink runat="server" ID="CampaignLink" translate="no"/>
        </div>
        <asiweb:SmartControl runat="server" ID="CreatedOnInput" BoundPropertyName="CreatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedByUserKeyInput" translate="no"  DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />            
        <asiweb:SmartControl runat="server" ID="UpdatedOnInput" BoundPropertyName="UpdatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="DescriptionInput" translate="no"  DisplayType="ReadOnlyField" DisplayCaption="true" Height="187px" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="NetRevenueInput" BoundPropertyName="NetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl8" BoundPropertyName="FirstResponseDate" DisplayType="ReadOnlyField"  NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="ReadOnlyField"  NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="HighResponseAmountInput" BoundPropertyName="HighResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="AverageTransactionAmountInput" BoundPropertyName="AverageTransactionAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="LowResponseAmountCaption" BoundPropertyName="LowResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="PredictedResponseRateInput" BoundPropertyName="DisplayPredictedResponseRate" DisplayType="ReadOnlyField" DisplayCaption="true" UnitText="%" Caption="Predicted Response Rate" NullValue="&nbsp;" />
    
    </asiweb:PanelTemplateColumn>
    
    <uc1:AdditionalProperties ID="AdditionalProperties1" runat="server" IsEditable="False" AtomComponentName="Solicitation"></uc1:AdditionalProperties>

</asiweb:PanelTemplateControl2>

<br />
<br />

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" ShowHeader="false" FieldSet="true" RoundedCorners="false" BorderStyle="None">
    <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server"
         BusinessItemKey = '<%# this.Solicitation.SolicitationKey %>' 
         ComponentKey = '<%# Asi.Business.Common.RegisteredComponentController.RegisteredComponent("Solicitation", "BusinessController").RegisteredComponentKey %>'/>   
</asiweb:PanelTemplateControl2>