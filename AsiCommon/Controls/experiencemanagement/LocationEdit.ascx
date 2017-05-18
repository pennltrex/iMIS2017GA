<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.LocationEdit" Codebehind="LocationEdit.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsed="false" FieldSet="true" 
    Collapsible="false" TemplateTitle="Provider location" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="14em">
        <asiweb:SmartControl runat="server" BoundPropertyName="LocationName" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="LocationStatusCode" DisplayCaption="true"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<asiweb:SmartPanel 
    ColumnLabelWidth="14em" 
    DisplayFormat="Update" 
    HideIfNoProperties="true" 
    ID="customData" 
    PropertiesToHide="LocationKey, LocationName, LocationDescription, LocationStatusCode, ContactKey, 
        CreatedByUserKey, CreatedOn, UpdatedByUserKey, UpdatedOn" 
    runat="server" 
    UseParentAtomObject="true" />