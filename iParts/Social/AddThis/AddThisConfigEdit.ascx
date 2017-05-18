<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddThisConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Social.AddThis.AddThisConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        <div class="AutoWidth">
            <asiweb:SmartControl 
                ID="DoNotRenderInDesignMode" runat="server" 
                BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl 
                ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl 
                ID="AddThisShowSmallIcons" runat="server" BoundPropertyName="AddThisShowSmallIcons" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        </div>
        <asiweb:SmartControl 
            ID="AddThisUrl" runat="server" BoundPropertyName="AddThisUrl" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="AddThisTitle" runat="server" BoundPropertyName="AddThisTitle" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />    
        <asiweb:SmartControl 
            ID="AddThisDescription" runat="server" BoundPropertyName="AddThisDescription" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />                   
        <asiweb:SmartControl 
            ID="AddThisPubId" runat="server" BoundPropertyName="AddThisPubId" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
 </asiweb:paneltemplatecontrol>