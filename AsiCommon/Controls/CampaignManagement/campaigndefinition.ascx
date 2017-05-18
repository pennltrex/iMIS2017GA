<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.CampaignDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="CampaignDefinition.ascx.cs" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>

<asiweb:PanelTemplateControl2 ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
        <asiweb:SmartControl runat="server" TabIndex="1" ID="NameInput" BoundPropertyName="Name" DisplayCaption="true" TextBoxWidth="100%" DisplayType="EditableField" InputFieldStyle="margin-left: -3px;" />            
        <asiweb:SmartControl runat="server" TabIndex="3" ID="StatusInput" BoundPropertyName="CampaignStatusCode" DisplayCaption="true" DisplayType="EditableField" />    
        <asiweb:SmartControl runat="server" TabIndex="5" ID="StartDateInput" BoundPropertyName="StartDate" DisplayCaption="true" DisplayType="EditableField" />
        <asiweb:SmartControl runat="server" TabIndex="7" ID="PredictedResponseRateInput" MinValue="0" MaxValue="100" BoundPropertyName="DisplayPredictedResponseRate" DisplayCaption="true" DisplayType="EditableField" UnitText="%" Caption="Predicted Response Rate" />  
        <asiweb:SmartControl runat="server" TabIndex="9" ID="DescriptionInput" BoundPropertyName="Description" DisplayCaption="true" DisplayType="EditableField" />  
               
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
    
        <asiweb:SmartControl runat="server" TabIndex="2" ID="CampaignCodeInput" BoundPropertyName="LegacyCampaignCode" DisplayCaption="true" DisplayType="EditableField" InputFieldStyle="margin-left: -3px;" />        
        <asiweb:SmartControl runat="server" TabIndex="4" ID="CampaignTypeCodeInput" BoundPropertyName="CampaignTypeCode" DisplayCaption="true" DisplayType="EditableField" InputFieldStyle="margin-left: -3px;" />
        <asiweb:SmartControl runat="server" TabIndex="6" ID="EndDateInput" BoundPropertyName="EndDate" DisplayCaption="true" DisplayType="EditableField" />
        <asiweb:SmartControl runat="server" TabIndex="8" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayCaption="true" DisplayType="EditableField" />          
    
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>
   
<uc1:AdditionalProperties id="AdditionalProperties1" runat="server" IsEditable="True" />