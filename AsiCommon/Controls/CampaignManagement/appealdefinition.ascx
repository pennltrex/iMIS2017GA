<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.AppealDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="AppealDefinition.ascx.cs" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>
<%@ Register Src="CostCollectionEditor.ascx" TagName="CostCollectionEditor" TagPrefix="Campaigns" %>

<asiweb:PanelTemplateControl2 ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" translate ="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
           
        <asiweb:SmartControl runat="server" ID="NameInput" BoundPropertyName="Name" DisplayCaption="true" 
            DisplayType="EditableField" TextBoxWidth="100%" InputFieldStyle="margin-left: -3px;" TabIndex="1" /> 
        
        <div id="Div1" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="CampaignCaption" BoundPropertyName="CampaignKey" CssClass="Label" Text="Campaign" />           
            <asiweb:StyledHyperLink runat="server" Id="ParentLink" TabIndex="3"><%#Parent.Name%></asiweb:StyledHyperLink>          
        </div>      
 
        <asiweb:SmartControl runat="server" ID="StartDateInput" BoundPropertyName="StartDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="5"/>
        <asiweb:SmartControl runat="server" ID="PredictedResponseRateInput" MinValue="0" MaxValue="100" UnitText="%" 
            BoundPropertyName="DisplayPredictedResponseRate" DisplayType="EditableField" DisplayCaption="true" Caption="Predicted Response Rate" TabIndex="7"/>
        <asiweb:SmartControl runat="server" ID="TargetRevenueInput" OnDataChange="TargetRevenueInput_OnDataChange" 
            BoundPropertyName="TargetRevenue" DisplayType="EditableField" DisplayCaption="true" TabIndex="9"/>
        <asiweb:SmartControl runat="server" ID="DescriptionInput" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true" TabIndex="10"/>
        
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
    
        <asiweb:SmartControl runat="server" ID="StatusInput" BoundPropertyName="AppealStatusCode" 
            DisplayType="EditableField" DisplayCaption="true" InputFieldStyle="margin-left: -3px;" TabIndex="2" />
			        <table cellspacing="0" cellpadding="0" border="0">
				        <tr>
					        <td>
						        <asiweb:SmartControl runat="server" ID="CostInput" BoundPropertyName="OverheadCost" DisplayType="EditableField" DisplayCaption="true" TabIndex="4" />
					        </td>
                            <td>
					            <Campaigns:CostCollectionEditor runat="server" ID="CCEditor" />
					        </td>
                        </tr>
			        </table>
        <asiweb:SmartControl runat="server" ID="EndDateInput" BoundPropertyName="EndDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="6"/>
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="8"/>
 
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>

<table cellpadding="0" cellspacing="0">
   <uc1:AdditionalProperties id="AdditionalProperties1" runat="server" IsEditable="True" />
</table>
