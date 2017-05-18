<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmationDisplayConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.OrderConfirmationDisplay.OrderConfirmationDisplayConfigEdit" %>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false"
    BorderStyle="None">
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
        ID="UrlParameterNameControl" runat="server" BoundPropertyName="UrlParameterName" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />

</asiweb:PanelTemplateControl>