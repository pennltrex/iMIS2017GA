<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SolicitationProfile" Codebehind="SolicitationProfile.ascx.cs" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>

<asiweb:PanelTemplateControl runat="server" ShowHeader="false" FieldSet="true" RoundedCorners="false" BorderStyle="None" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
               
        <asiweb:SmartControl runat="server" ID="NameInput" BoundPropertyName="Name" DisplayType="EditableField" 
            DisplayCaption="true" TextBoxWidth="100%" InputFieldStyle="margin-left: -3px;" TabIndex="1"/>
        
        <div id="Div1" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="AppealKey" Text="Appeal" AssociatedControlID="ParentLink" />
            <asiweb:StyledHyperLink runat="server" Id="ParentLink" TabIndex="3"><%#Parent.Name%></asiweb:StyledHyperLink>
        </div>
        <asiweb:SmartControl runat="server" ID="StartDateInput" BoundPropertyName="StartDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="5"/>
        <asiweb:SmartControl runat="server" ID="PredictedResponseRateInput" BoundPropertyName="DisplayPredictedResponseRate" DisplayType="EditableField"
            DisplayCaption="true" MinValue="0" MaxValue="100" UnitText="%" Caption="Predicted Response Rate" TabIndex="7"/><br />
        <asiweb:SmartControl runat="server" ID="DescriptionInput" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true" TabIndex="9"/>
        <uc1:AdditionalProperties id="AdditionalProperties1" runat="server" IsEditable="True" />
        
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
    
        <asiweb:SmartControl runat="server" ID="StatusInput" BoundPropertyName="SolicitationStatusCode" 
            DisplayType="EditableField" DisplayCaption="true" InputFieldStyle="margin-left: -3px;" TabIndex="2"/>
        <div id="Div2" class="PanelField Right">
            <asiweb:StyledLabel ID="CampaignLabel" runat="server" Text="Campaign" AssociatedControlID="CampaignLink" />
            <asiweb:StyledHyperlink runat="server" ID="CampaignLink" TabIndex="4" translate="no"/>
        </div>
        <asiweb:SmartControl runat="server" ID="EndDateInput" BoundPropertyName="EndDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="6"/>
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="8"/>
        <asiweb:SmartControl runat="server" ID="ReminderDateInput" BoundPropertyName="ReminderDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="10"/>
    
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl>
