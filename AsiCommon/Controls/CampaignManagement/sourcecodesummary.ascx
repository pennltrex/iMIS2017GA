<%@ Control Language="c#" AutoEventWireup="false" Inherits="ChildSummaryScreen" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>

<script runat="server">
        public override string AtomComponentName
        {
            get
            {
                return "SourceCode";
            }
        }
    public Asi.Business.CampaignManagement.SourceCode SourceCode
    {
        get
        {
            EnsureAtomObject();
            return AtomObject[0] as Asi.Business.CampaignManagement.SourceCode;
        }
    }
    
    public override void  DataBind()
    {
 	     base.DataBind();
         AppealLink.NavigateFromTemplateUrl = String.Format(PARENT_LINK_FORMAT_STRING, "Appeal", SourceCode.Solicitation.AppealKey);
         AppealLink.Text = Asi.Business.CampaignManagement.AppealController.Appeal((Guid)SourceCode.Solicitation.AppealKey, Container).Name;
    }
     protected override void OnLoad(EventArgs e)
     {
         base.OnLoad(e);
     }
     private void CheckSourceCodeCompleteStatus()
     {
         int listCount = SourceCode.GetSourceLists().Length;
         const string SPACER = " " ;

         if (listCount == 1)
         {
             imgBullet1True.Visible = true;
             imgBullet1False.Visible = false;
             lblSourceListCount.Text = String.Format("{0}{1}{2}", "One ",SPACER, Asi.ResourceManager.GetPhrase("SourceListPopulated", "source list exists for this source code"));
             WorkflowStatusControl.Visible = false;
         }
         else if (listCount > 1)
         {
             imgBullet1True.Visible = true;
             imgBullet1False.Visible = false;
             lblSourceListCount.Text = String.Format("{0}{1}{2}", listCount.ToString() , SPACER , Asi.ResourceManager.GetPhrase("SourceListsPopulated", "source lists exist for this source code"));
             WorkflowStatusControl.Visible = false;
         }
         if (listCount == 0)
         {
             imgBullet1True.Visible = false;
             imgBullet1False.Visible = true;
             lblSourceListCount.Text = Asi.ResourceManager.GetPhrase("SourceListNotPopulated", "Source lists have not been created for this source code");
         }
         else if (!CheckValidInsert())
         {  // check for valid insert
             imgBullet1True.Visible = false;
             imgBullet1False.Visible = true;
             lblSourceListCount.Text = Asi.ResourceManager.GetPhrase("ValidInsertNotAvailable", "The source code must contain a valid insert in order to generate output");
             WorkflowStatusControl.Visible = false;
         }
         else if((String.IsNullOrEmpty(SourceCode.SourceCodeTypeCode.ToString())) ||(String.IsNullOrEmpty(SourceCode.MemberObjectType.ToString())))
         {  
             imgBullet1True.Visible = false;
             imgBullet1False.Visible = true;
             lblSourceListCount.Text = Asi.ResourceManager.GetPhrase("ValidMemberTypeNotAvailable", "The List Member Type and Source Code type for the source code must be defined in order to generate output");
             WorkflowStatusControl.Visible = false;
         }
         else
         {
             WorkflowStatusControl.Visible = true;
         }
         lblSourceListCount.Text = GetTranslatedPhrase(lblSourceListCount.Text);
     }

     private bool CheckValidInsert()
     {
         if (SourceCode.Package != null)
         {
             Asi.Business.PackageManagement.PackageItem[] items = SourceCode.Package.GetItems();
             for (int j = 0; j < items.Length; j++)
             {
                 Asi.Business.PackageManagement.Supplement suppplement = Asi.Business.PackageManagement.SupplementController.Supplement(items[j].SupplementKey);
                 //only care about supplements that have PE's (i.e. document keys) associated
                 if (!(suppplement.DocumentKey.Equals(Guid.Empty)))
                 {
                     return (true);
                 }
             }
         }
         return (false);
     }
     private void SetOverrideMessage()
     {
         WorkflowStatusControl.ComponentKey = Asi.Business.Common.RegisteredComponentController.RegisteredComponent("SourceCode", "BusinessController").RegisteredComponentKey;
         WorkflowStatusControl.BusinessItemKey = SourceCode.SourceCodeKey;

         if ((SourceCode.OutputGenerated) && (WorkflowStatusControl.StatusMonitor == null))
         {
             WorkflowStatusControl.OverRideMessage = String.Format("{0}{1}", Asi.ResourceManager.GetPhrase("SourceCodeWorkflowSuccessStatus", "Output has been generated for this source code at "), SourceCode.LastDropDate.ToString());
         }
     }
     protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        if (this.SourceCode != null &&
            this.SourceCode.Solicitation != null &&
            this.SourceCode.Solicitation.Appeal != null &&
            this.SourceCode.Solicitation.Appeal.Campaign != null)
        {
            Asi.Business.CampaignManagement.CampaignBudgetLevel bLevelEnum = 
                Asi.Web.UI.Common.CampaignManagement.CMCommon.GetBudgetLevel(this.SourceCode.Solicitation.Appeal.Campaign.SystemKey);
            if (bLevelEnum == Asi.Business.CampaignManagement.CampaignBudgetLevel.Appeal)
            {              
                this.TargetRevenueInput.Visible = false;              
                this.SmartControl6.Visible = false;
                this.CostPerThousandCaption.Visible = false;                              
                this.ROIPercentageInput.Visible = false;               
                this.OverheadCostValue.Visible = false;
            }
        }
 
       
     
         

         CreatedByInput.Caption = GetTranslatedPhrase("Created by");
         CreatedByInput.BoundPropertyName = "CreatedByUserKey";
         UpdatedByUserKeyInput.Caption = GetTranslatedPhrase("Updated by");
         UpdatedByUserKeyInput.BoundPropertyName = "UpdatedByUserKey";
         DescriptionInput.Caption = GetTranslatedPhrase("Description");
         DescriptionInput.BoundPropertyName = "Description";
         CheckSourceCodeCompleteStatus();
         SetOverrideMessage();
         DataBind();
    }
    </script>
       
<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" Collapsible="false" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
        <asiweb:SmartControl runat="server" ID="NameInput" BoundPropertyName="Code" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div1" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="SolicitationCaption" BoundPropertyName="SolicitationKey" AssociatedControlID="ParentLink" Text="Solicitation" />           
            <asiweb:StyledHyperLink runat="server" Id="ParentLink"><%#Parent.Name%></asiweb:StyledHyperLink>          
        </div>     
        <asiweb:SmartControl runat="server" ID="CreatedByInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedByUserKeyInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div3" class="PanelFieldGraph Left">
            <asiweb:iPieChart id="IPieChart1" runat="server" ExploadOffset="35" FontType="Tahoma" Pie3DRatio="8" PieRatio="70" FontSize="7"></asiweb:iPieChart> 
        </div>
        <asiweb:SmartControl runat="server" ID="SmartControl2" BoundPropertyName="TotalRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl6" BoundPropertyName="TotalEstimatedCost" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="TargetRevenueInput" BoundPropertyName="TargetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="RevenuePerThousandInput" BoundPropertyName="RevenuePerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="CostPerThousandCaption" BoundPropertyName="CostPerThousand" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ROIPercentageInput" BoundPropertyName="DisplayROIPercentage" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="ROI Percentage" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="ResponseRateInput" BoundPropertyName="DisplayResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Response Rate" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl10" BoundPropertyName="LastDropDate" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
    
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
    
        <asiweb:SmartControl runat="server" ID="StatusCodeInput" BoundPropertyName="SourceCodeStatusCode" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <div id="Div2" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="AppealKey" BoundPropertyName="AppealKey" AssociatedControlID="AppealLink" Text="Appeal" />           
            <asiweb:StyledHyperLink runat="server" Id="AppealLink" translate="no"></asiweb:StyledHyperLink>          
        </div>        
        <asiweb:SmartControl runat="server" ID="CreatedOnInput" BoundPropertyName="CreatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="UpdatedOnInput" BoundPropertyName="UpdatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="DescriptionInput" translate="no" DisplayType="ReadOnlyField" DisplayCaption="true" Width="100%" Height="187px" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="NetRevenueInput" BoundPropertyName="NetRevenue" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="SmartControl8" BoundPropertyName="FirstResponseDate" DisplayType="ReadOnlyField" NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="ReadOnlyField"  NullValue="No Responses" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="HighResponseAmountInput" BoundPropertyName="HighResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="AverageTransactionAmountInput" BoundPropertyName="AverageTransactionAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="LowResponseAmountCaption" BoundPropertyName="LowResponseAmount" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="PredictedResponseRateInput" BoundPropertyName="DisplayPredictedResponseRate" DisplayType="ReadOnlyField" UnitText="%" DisplayCaption="true" Caption="Predicted Response Rate" NullValue="&nbsp;" />
        <asiweb:SmartControl runat="server" ID="OverheadCostValue" BoundPropertyName="OverheadCost" DisplayType="ReadOnlyField" DisplayCaption="true" NullValue="&nbsp;" />
    
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>    
      
<table cellpadding="0" cellspacing="0">
    <uc1:AdditionalProperties ID="AdditionalProperties1" runat="server" IsEditable="False" AtomComponentName="Solicitation"></uc1:AdditionalProperties>
</table>

<br />
<br />

<table cellpadding="0" cellspacing="0">
	<tr>
		<td class="PanelTableValue" valign="middle" align="left">
            <asp:image id="imgBullet1True" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/check.gif"  imagealign="AbsMiddle" visible="False"></asp:image>
			<asp:image id="imgBullet1False" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/cancel.gif" imagealign="AbsMiddle" visible="False"></asp:image>
			<asp:label id="lblSourceListCount" runat="server" cssclass="StatusProcess"></asp:label>
	    </td>
	</tr>
    <tr>
  	    <td class="PanelTableValue" valign="middle" align="left">
            <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server" 
             BusinessItemKey = "<%#this.SourceCode.SourceCodeKey %>" 
             NoWorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("SourceCode_NoWorkflowItemSubmitted", "Output has not been generated for this source code") %>' 
             WorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("SourceCode_WorkflowItemSubmitted", "Output generation submitted for this source code  ") %>' 
             SuccessStatusMessage = '<%# Asi.ResourceManager.GetPhrase("SourceCodeWorkflowSuccessStatus", "Output has been generated for this source code  ")  %>'  
             ErrorStatusMessage = '<%# Asi.ResourceManager.GetPhrase("SourceCodeWorkflowSuccessStatus", "An error has occurred while generating output for this source code")  %>'  
             ComponentKey = '<%# Asi.Business.Common.RegisteredComponentController.RegisteredComponent("SourceCode", "BusinessController").RegisteredComponentKey %>' />
            </WSDC:WorkflowStatusDisplayControl>
        </td>
    </tr>
</table> 
