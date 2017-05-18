<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmbeddedWebPageConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.EmbeddedWebPage.EmbeddedWebPageConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol2 id="ContainerPanel" runat="server" fieldset="true" showheader="false" borderstyle="None">
    <asiweb:SmartControl 
        ID="Source" runat="server" 
        BoundPropertyName="Source" DisplayCaption="true" 
        PositionCaption="left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl 
        ID="Height" runat="server"  
        BoundPropertyName="Height" DisplayCaption="true"
        PositionCaption="left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000" InputFieldCssClass="InputSmallWrapper" />
    <asiweb:SmartControl 
        ID="Width" runat="server" 
        BoundPropertyName="Width" DisplayCaption="true"
        PositionCaption="left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000" InputFieldCssClass="InputSmallWrapper"/>
 </asiweb:paneltemplatecontrol2>