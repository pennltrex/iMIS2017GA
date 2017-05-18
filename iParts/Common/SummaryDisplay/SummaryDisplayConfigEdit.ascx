<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SummaryDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.SummaryDisplay.SummaryDisplayConfigEdit" %>
<%@ Import Namespace="Asi"%>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" 
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" /> 
   
    <asiweb:SmartControl ID="IQAQueryPath" runat="server" BoundPropertyName="IQAQueryPath" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" CssClass="InputXLargeWrapper"/>

    <asiweb:SmartControl ID="HideWhenNoData" runat="server" BoundPropertyName="HideWhenNoData" 
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" /> 

    <asiweb:SmartControl ID="HideFieldsWithNoData" runat="server" BoundPropertyName="HideFieldsWithNoData" 
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" /> 
 </asiweb:paneltemplatecontrol>