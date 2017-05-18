<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressSelectorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorConfigEdit" %>

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
    <asiweb:SmartControl ID="AddressPath" runat="server" BoundPropertyName="AddressPath" 
        DisplayCaption="true" DataSaveUponStateChange="false" />    
   <asiweb:SmartControl ID="DisplayButtonOnly" runat="server" BoundPropertyName="DisplayButtonOnly" 
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />    
 </asiweb:paneltemplatecontrol>