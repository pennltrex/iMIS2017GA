<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ExperienceManagement.ProgramDefinition" Codebehind="ProgramDefinition.ascx.cs" %>
<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="15em" >
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceUnitKey" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Minimum" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Maximum" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="UserDefinedExperiences" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApproval" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramStatusCode" DisplayCaption="true" OnDataChange="ProgramStatusDataChange" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
