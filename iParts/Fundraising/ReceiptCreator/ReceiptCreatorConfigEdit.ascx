<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReceiptCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.ReceiptCreator.ReceiptCreatorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
       
    <asiweb:SmartControl ID="GenerateMode" runat="server" BoundPropertyName="GenerateMode" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" />      
    
    <asiweb:SmartControl ID="CommunicationDocumentPathControl" runat="server" BoundPropertyName="CommunicationDocumentPathControl" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" InputFieldCssClass="InputXLargeWrapper" />    
       
    <asiweb:SmartControl ID="SourceFolderPathControl" runat="server" BoundPropertyName="SourceFolderPathControl" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" DocumentTypesAllowed="FOL,IQD" InputFieldCssClass="InputXLargeWrapper" />       

 </asiweb:paneltemplatecontrol>