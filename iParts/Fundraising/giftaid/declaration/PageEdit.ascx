<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.PageEdit" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" fieldset="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" DataSaveUponStateChange="false" />
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="20em">
        <div class="AutoWidth">
            <asiweb:SmartControl ID="Ex3Input" runat="server" BoundPropertyName="DeclarationStartDateOption" DisplayCaption="true" PositionCaption="Top" />
            <asiweb:SmartControl ID="Ex4Input" runat="server" BoundPropertyName="DeclarationExpirationYears" DisplayCaption="true" />
            <asiweb:SmartControl ID="Ex5Input" runat="Server" BoundPropertyName="DefaultDeclarationMethod" DisplayCaption="true" />
        </div>   
    </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl>