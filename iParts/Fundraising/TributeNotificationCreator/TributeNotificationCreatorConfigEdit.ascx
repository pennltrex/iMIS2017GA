<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeNotificationCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.TributeNotificationCreator.TributeNotificationCreatorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>


    <div class="AutoWidth">
        <asiweb:SmartControl ID="NotificationType" runat="server" BoundPropertyName="NotificationType" DisplayCaption="true" PositionCaption="Left" 
            DataSaveUponStateChange="false" AutoPostBack="false" />
          
        <asiweb:SmartControl ID="CommunicationDocumentPathControl" runat="server" BoundPropertyName="CommunicationDocumentPathControl" DisplayCaption="true" PositionCaption="Left" 
            DataSaveUponStateChange="false" AutoPostBack="false" InputFieldCssClass="InputXLargeWrapper" />    
        
        <asiweb:SmartControl ID="SourceFolderPathControl" runat="server" BoundPropertyName="SourceFolderPathControl" DisplayCaption="true" PositionCaption="Left" 
            DataSaveUponStateChange="false" AutoPostBack="false" DocumentTypesAllowed="FOL,IQD" InputFieldCssClass="InputXLargeWrapper" />  
    </div>    
 