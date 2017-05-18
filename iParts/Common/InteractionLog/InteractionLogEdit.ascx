<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InteractionLogEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.InteractionLog.InteractionLogEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />         
    </div> 