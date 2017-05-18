<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ExperienceManagement.ProgramSummary" Codebehind="ProgramSummary.ascx.cs" %>
<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="15em" ValueWidth="50em">
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceUnitKey" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Minimum" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Maximum" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="UserDefinedExperiences" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApproval" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramStatusCode" DisplayCaption="true" DisplayType="ReadOnlyField"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>