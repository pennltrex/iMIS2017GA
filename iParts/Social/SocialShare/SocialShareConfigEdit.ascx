<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialShareConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Social.SocialShare.SocialShareConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<div class="AutoWidth">
    <asiweb:SmartControl ID="BorderVisible" runat="server" BoundPropertyName="BorderVisible"
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
</div>
<asiweb:SmartControl ID="UrlToShare" runat="server" BoundPropertyName="UrlToShare"
    DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />

<asiweb:SmartControl ID="LegendText" runat="server" BoundPropertyName="LegendText"
    DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 

<div class="AutoWidth">
    <asiweb:SmartControl ID="IconDimension" runat="server" BoundPropertyName="IconDimension" 
            DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Top" />
</div>