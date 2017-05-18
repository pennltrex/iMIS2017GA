<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceCodeProfile" Codebehind="SourceCodeProfile.ascx.cs" %>
<%@ Register Src="AdditionalProperties.ascx" TagName="AdditionalProperties" TagPrefix="uc1" %>
<%@ Register Src="CostCollectionEditor.ascx" TagName="CostCollectionEditor" TagPrefix="Campaigns" %>

<asiweb:PanelTemplateControl2 ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false" translate="yes">

    <asiweb:PanelTemplateColumn ID="SummaryPanelLeftColumn" runat="server" Width="49%">
    
        <asiweb:SmartControl runat="server" ID="NameInput" BoundPropertyName="Code" DisplayType="EditableField" 
            DisplayCaption="true" TextBoxWidth="100%" InputFieldStyle="margin-left: -3px;" TabIndex="1"/>
        <div id="Div1" class="PanelField Left">
            <asiweb:BusinessLabel runat="server" ID="SolicitationCaption" BoundPropertyName="SolicitationKey" AssociatedControlID="ParentLink" Text="Solicitation" />           
            <asiweb:StyledHyperLink runat="server" Id="ParentLink" TabIndex="3" translate="no"/>        
        </div> 
        <asiweb:SmartControl runat="server" ID="DescriptionInput" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true" TabIndex="5"/> 
        <asiweb:SmartControl runat="server" ID="SmartControl3" BoundPropertyName="TotalEstimatedCost" DisplayType="ReadOnlyField" DisplayCaption="true" TabIndex="9"/>
        <asiweb:StyledLabel CssClass="iMISUserMessage" ID="OutOfDateMessage" runat="server" Visible="false" />
        <asiweb:SmartControl runat="server" ID="CodeInput" BoundPropertyName="MemberObjectType" DisplayType="EditableField" DisplayCaption="true" InputFieldStyle="margin-left: -3px;" TabIndex="11"/>
        <asiweb:SmartControl runat="server" ID="LastResponseDateInput" BoundPropertyName="LastResponseDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="12"/>
        <asiweb:SmartControl AutoPostBack="true" runat="server" ID="SourceCodeTypeCodeValue"  BoundPropertyName="SourceCodeTypeCode" DisplayType="EditableField" DisplayCaption="true" TabIndex="13"/>
        <div style="clear:both; margin-left:1px;">
            <asiweb:SmartControl runat="server" ID="ExternalFileNameInput" BoundPropertyName="ExternalFileName" 
                DisplayType="EditableField" DisplayCaption="true" TextBoxColumns="20" CaptionStyle="width:10.8em;" TabIndex="14"/>
            <asiweb:SmartControl runat="server" ID="ExternalListCountInput" BoundPropertyName="ExternalListCount" 
                DisplayType="EditableField" DisplayCaption="true" CaptionStyle="width:10.8em;" TabIndex="15"/>
        </div>
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateRightColumn" runat="server" Width="50%">
      
        <asiweb:SmartControl runat="server" ID="StatusInput" BoundPropertyName="SourceCodeStatusCode" 
            DisplayType="EditableField" DisplayCaption="true" InputFieldStyle="margin-left: -3px;" TabIndex="2"/>        
        <div id="Div2" class="PanelField Right">
            <asiweb:BusinessLabel runat="server" ID="AppealKey" BoundPropertyName="AppealKey" AssociatedControlID="AppealLink" Text="Appeal" />           
            <asiweb:StyledHyperLink runat="server" Id="AppealLink" TabIndex="4" translate="no"/>         
        </div>            
        <asiweb:SmartControl runat="server" ID="CostInput" BoundPropertyName="OverheadCost" DisplayType="EditableField" DisplayCaption="true" TabIndex="6"> 
            <Campaigns:CostCollectionEditor runat="server" ID="CCEditor" /> 
        </asiweb:SmartControl>         
        <asiweb:SmartControl runat="server" MinValue="0" MaxValue="100" ID="PredictedResponseRateInput" 
            BoundPropertyName="DisplayPredictedResponseRate" DisplayType="EditableField" DisplayCaption="true" 
            UnitText="%" TextBoxColumns="10" Caption="Predicted Response Rate" TabIndex="7"/>
        <asiweb:SmartControl runat="server" ID="LastDropDateInput" BoundPropertyName="LastDropDate" DisplayType="EditableField" DisplayCaption="true" TabIndex="8"/>
        <asiweb:SmartControl runat="server" ID="TargetRevenueInput" OnDataChange="TargetRevenueInput_OnDataChange" 
            BoundPropertyName="TargetRevenue" DisplayType="EditableField" DisplayCaption="true" TabIndex="10"/>
    
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl2>

<asiweb:PanelTemplateControl2 ID="Additional" runat="server" FieldSet="true" ShowHeader="false" TextBoxColumns="20" Collapsible="false">
   <uc1:AdditionalProperties id="AdditionalProperties1" runat="server" IsEditable="True" />
</asiweb:PanelTemplateControl2>