<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_WebsiteNavigationAreas" Codebehind="WebsiteNavigationAreas.ascx.cs" %>

<div class="AutoWidth FloatNone">
    <asiweb:SmartControl ID="NavigationPanes" runat="server" BoundPropertyName="NavigationPaneCodes" SurfToEditContentCode="BusinessObjectList"
         SurfToEditQueryStringParams="&iBusinessObjectName=NavigationPane&UseUniformKey=false&PanelColumnWidth=100%" DisplayCaption="true" PositionCaption="Top" 
         InputFieldStyle="clear:both; margin-left: 20px;white-space: nowrap;"></asiweb:SmartControl>
</div>