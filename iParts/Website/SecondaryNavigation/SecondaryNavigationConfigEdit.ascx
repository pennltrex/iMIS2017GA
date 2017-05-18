<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecondaryNavigationConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Website.SecondaryNavigation.SecondaryNavigationConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:SmartControl 
        ID="SkinName" runat="server" 
        BoundPropertyName="SkinName" DisplayCaption="true"
        PositionCaption="left" DataSaveUponStateChange="false" />

<asiweb:SmartControl 
        ID="NodeStartingLevel" runat="server" 
        BoundPropertyName="NodeStartingLevel" DisplayCaption="true"
        PositionCaption="left" DataSaveUponStateChange="false" />

<asiweb:SmartControl 
        ID="MaxLevels" runat="server" 
        BoundPropertyName="MaxLevels" DisplayCaption="true"
        PositionCaption="left" DataSaveUponStateChange="false" InputFieldCssClass="InputSmallWrapper" />