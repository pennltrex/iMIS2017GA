<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.ItemCreatorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>    
    <asiweb:SmartControl 
        ID="SimpleItemType" runat="server" BoundPropertyName="SimpleItemType" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
 </asiweb:paneltemplatecontrol>