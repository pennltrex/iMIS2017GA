<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YouTubeVideoConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.YouTubeVideo.YouTubeVideoConfigEdit" %>

    <asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:smartcontrol ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
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
        <div class="PanelField Left">            
        <div class="PanelFieldValue">                
        <asp:Label ID="LabelUrlTypes" runat="server" Text="Enter the URL of a single public YouTube video." />  
        </div>
        </div> 
        <asiweb:SmartControl 
            ID="YouTubeUrl" runat="server" AddValidatorInDesignMode="True"
            BoundPropertyName="YouTubeUrl" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="False"/>                                   
    <div class="AutoWidth">              
        <asiweb:SmartControl 
            ID="AutoPlay" runat="server" 
            BoundPropertyName="AutoPlay" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="HideControls" runat="server" 
            BoundPropertyName="HideControls" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
             </div> 
        <asiweb:SmartControl 
            ID="Width" runat="server" 
            BoundPropertyName="Width" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000"/>
        <asiweb:SmartControl 
            ID="Height" runat="server" 
            BoundPropertyName="Height" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000"/>   
    </asiweb:paneltemplatecontrol>