<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgramDefinition" Codebehind="CertificationProgramDefinition.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<!-- present properties:
CertificationProgramName,CertificationProgramDescription, ExperienceUnitKey, MinimumValue, MaximumValue,RequiresApprovalFlag, CertificationProgramStatusCode, IsMultipleIterationFlag,AutoEnrollFlag,AddDesignationFlag,CertificationProgramGroup,PreRequiredProgram,RequiredNumberOfUnits,FormatCertificationNumber,DeadlinePeriodMultiplier,GracePeriodMultiplier
-->
<style type='text/css'>
    #CertificationProgramDescriptionDiv .reToolCell, #CertificationProgramDescriptionDiv .reToolZone {
        display: none !important
    }        
    #CertificationProgramDescriptionDiv .reContentCell, #CertificationProgramDescriptionDiv .RadEditorTextArea {
        height: 100px !important;
        border: none !important;
        padding:0 !important;
        margin:0 !important;
    }
    #CertificationProgramDescriptionDiv table, #CertificationProgramDescriptionDiv textarea {
        height: 100px !important;
        width: 30em !important;
        max-width: none;
    }
</style>
<asiweb:PanelTemplateControl2 ID="TablePanel1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="19em">        
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramName" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper" />
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramStatusCode" DisplayCaption="true" />
        <div class="PanelField Left">
            <asp:Label ID="lblDeadlinePeriod" runat="server" AssociatedControlID="nbDeadlinePeriodMultiplier" Text="Deadline Period" CssClass="Required" />
            <div class="PanelFieldValue">
                <asiweb:NumberBox ID="nbDeadlinePeriodMultiplier"  runat="server" Enabled="true" CssClass="InputXSmall" />
                <asiweb:StyledLabel runat="server" ID="lblDeadlinePeriodTimeUnit" Text="Deadline Period Time Unit" AssociatedControlID="ddlDeadlinePeriodTimeUnit" CssClass="screen-reader-text"></asiweb:StyledLabel>
                <asiweb:BusinessDropDownList ID="ddlDeadlinePeriodTimeUnit" runat="server" Required="True"/>
                <asi:AsiRequiredFieldValidator id="ReqDeadlinePeriodMultiplier" runat="server" ControlToValidate="nbDeadlinePeriodMultiplier" CssClass="Important"></asi:AsiRequiredFieldValidator>
                <asi:AsiRequiredFieldValidator id="ReqDeadlinePeriodTimeUnit" runat="server" ControlToValidate="ddlDeadlinePeriodTimeUnit" CssClass="Important"></asi:AsiRequiredFieldValidator>
            </div>
        </div>
        <div class="PanelField Left">
            <asp:Label ID="lblGracePeriod" runat="server" AssociatedControlID="nbGracePeriodMultiplier" Text="Grace Period"/>
            <div class="PanelFieldValue">
                <asiweb:NumberBox ID="nbGracePeriodMultiplier"  runat="server" Enabled="true" CssClass="InputXSmall" />
                <asiweb:StyledLabel runat="server" ID="lblGracePeriodTimeUnit" Text="Grace Period Time Unit" AssociatedControlID="ddlGracePeriodTimeUnit" CssClass="screen-reader-text"></asiweb:StyledLabel>
                <asiweb:BusinessDropDownList ID="ddlGracePeriodTimeUnit" runat="server" Enabled="true" />
            </div>
        </div>
         <div runat="server" ID="DateDiv" class="PanelField PanelField Left">
             <div class="PanelFieldLabel">
                 <label for="CertificationProgramDescriptionDiv">Description</label>
             </div>
             <div id="CertificationProgramDescriptionDiv" class="PanelFieldValue">         
                <asiweb:SmartControl runat="server" ID="DescriptionInput" BoundPropertyName="CertificationProgramDescription" 
                    EnableTextareaEditorMode="true" HIControlType="HTMLEditor" />                
             </div>
        </div>
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceUnitKey" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApprovalFlag" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="IsMultipleIterationFlag" DisplayCaption="true" />       
        <asiweb:SmartControl runat="server" BoundPropertyName="Designation" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="AddDesignationFlag" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramGroup" DisplayCaption="true" />
        <div class="PanelField Left">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlPreRequiredProgram" Text="Prerequisite Program"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="ddlPreRequiredProgram" runat="server" Enabled="true" OnSelectedIndexChanged="EnableDisableAutoEnroll" AutoPostBack="True"/>
            </div>
        </div>
        <asiweb:SmartControl ID="AutoEnrollControl" runat="server" BoundPropertyName="AutoEnrollFlag" DisplayCaption="true" Caption="Automatically enroll when prerequisite is completed" PositionCaption="Right" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiredNumberOfUnits" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="FormatCertificationNumber" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="AllowCancel" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<div style="text-align: right; margin: 15px">
    <asiweb:StyledButton ID="btnCancel" runat="server" />
</div>

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Update" UseParentAtomObject="true" 
    PropertiesToHide="DeadLinePeriod, DeadlinePeriodMultiplier, DeadlinePeriodTimeUnit, 
        FormatCertificationNumber, GracePeriod, GracePeriodMultiplier, GracePeriodTimeUnit, 
        InitialCertificationProgramRequirementKey, IsMultipleIterationFlag, KeyName, 
        MaintenanceCertificationProgramRequirementKey, MaximumValue, MinimumValue, 
        PreRequiredProgram, ProcessBlueprint, RequiredNumberOfUnits, RequiresApprovalFlag, StagesInOrder, 
        ExperienceUnitKey, AddDesignationFlag, AutoEnrollFlag, CertificationProgramDescription, 
        CertificationProgramKey, CertificationProgramName, CertificationProgramStatusCode, MarkedForDeleteOn, 
        CertificationProgramGroup, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, LastCertificationNumber, Designation,AllowCancel"
        ColumnLabelWidth="19em" HideIfNoProperties="true"
/>
