<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgramSummary" Codebehind="CertificationProgramSummary.ascx.cs" %>

<!-- present properties:
CertificationProgramName,CertificationProgramDescription, ExperienceUnitKey, MinimumValue, MaximumValue,RequiresApprovalFlag, CertificationProgramStatusCode, IsMultipleIterationFlag,AutoEnrollFlag,AddDesignationFlag,CertificationProgramGroup,PreRequiredProgram,RequiredNumberOfUnits,FormatCertificationNumber,DeadlinePeriodMultiplier,GracePeriodMultiplier
-->
<asiweb:PanelTemplateControl2 ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="19em">
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramName" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramStatusCode" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramDescription" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <div class="PanelField Left">
            <asp:Label ID="Label2" runat="server" Text="Deadline Period" CssClass="Label" />
            <div class="PanelFieldValue">
                <asiweb:StyledLabel ID="lblDeadlinePeriodMultiplierValue" runat="server" />
            </div>
        </div>
        <div class="PanelField Left">
            <asp:Label ID="Label3" runat="server" Text="Grace Period" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:StyledLabel ID="lblGracePeriodMultiplierValue" runat="server" />
            </div>
        </div>
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceUnitKey" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApprovalFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="IsMultipleIterationFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="AutoEnrollFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Designation" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="AddDesignationFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationProgramGroup" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="PreRequiredProgram" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiredNumberOfUnits" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="FormatCertificationNumber" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="AllowCancel" DisplayCaption="true" DisplayType="ReadOnlyField" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Display" UseParentAtomObject="true" 
    PropertiesToHide="DeadLinePeriod, DeadlinePeriodMultiplier, DeadlinePeriodTimeUnit, 
        FormatCertificationNumber, GracePeriod, GracePeriodMultiplier, GracePeriodTimeUnit, 
        InitialCertificationProgramRequirementKey, IsMultipleIterationFlag, KeyName, 
        MaintenanceCertificationProgramRequirementKey, MaximumValue, MinimumValue, 
        PreRequiredProgram, ProcessBlueprint, RequiredNumberOfUnits, RequiresApprovalFlag, StagesInOrder, 
        ExperienceUnitKey, AddDesignationFlag, AutoEnrollFlag, CertificationProgramDescription, 
        CertificationProgramKey, CertificationProgramName, CertificationProgramStatusCode, MarkedForDeleteOn, 
        CertificationProgramGroup, CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn, LastCertificationNumber, Designation, AllowCancel"
        ColumnLabelWidth="19em" HideIfNoProperties="true"
/>
