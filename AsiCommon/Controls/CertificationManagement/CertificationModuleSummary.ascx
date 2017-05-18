<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationModuleSummary" Codebehind="CertificationModuleSummary.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="14em">
        <asp:Panel ID="programRow" runat="server" Visible="false">
            <div class="PanelField Left">
	            <asp:Label ID="Label1" runat="server" AssociatedControlID="lnkCertificationProgram" Text="Certification Program" />
	            <div class="PanelFieldValue">
                    <asiweb:StyledHyperlink id="lnkCertificationProgram" runat="server" />
                </div>
            </div>
        </asp:Panel>
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" id="NumberOfUnits" BoundPropertyName="NumberOfUnits" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="EnrolleeCanRecord" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresGrade" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApproval" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="CertificationStaffOnly" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="StatusCode" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="FileAttachment" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="AttachmentInstructions" DisplayCaption="true" DisplayType="ReadOnlyField"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Display" UseParentAtomObject="true" 
    PropertiesToHide="Name, Code, Description, NumberOfUnits, EnrolleeCanRecord, RequiresGrade, RequiresApproval, 
        CertificationStaffOnly, StatusCode, Date, Location, CertificationModuleKey, MarkedForDeleteOn, CreatedByUserKey, 
        CreatedOn, UpdatedByUserKey, UpdatedOn, FileAttachment, AttachmentInstructions" ColumnLabelWidth="14em" HideIfNoProperties="true" />
