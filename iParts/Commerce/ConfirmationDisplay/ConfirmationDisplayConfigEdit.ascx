<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ConfirmationDisplay.ConfirmationDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<div class="AutoWidth">
    <asiweb:SmartControl runat="server" ID="ConfirmationMessage" BoundPropertyName="ConfirmationMessage" RenderPanelField="True" 
        DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" Width="95%"></asiweb:SmartControl>
</div>    
 