<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FunctionEditConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Events.FunctionEditConfigEdit" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
<%--    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" DataSaveUponStateChange="false" />--%>
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>    
    
    <asiweb:SmartControl ID="EventKey" runat="server" BoundPropertyName="EventKey" DisplayCaption="true" PositionCaption="Left" />
        
    <asiweb:SmartControl ID="FunctionKey" runat="server" BoundPropertyName="FunctionKey" DisplayCaption="true" PositionCaption="Left" />    
    
 </asiweb:paneltemplatecontrol>