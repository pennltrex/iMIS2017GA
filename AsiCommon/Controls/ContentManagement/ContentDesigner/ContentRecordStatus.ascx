<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentRecordStatus" Codebehind="ContentRecordStatus.ascx.cs" %>
<asiweb:BusinessLabel ID="UpdatedByDisplay" runat="Server" RenderPanelField="true" BoundPropertyName="UpdatedByUserKey" DataTextField="FullName" DisplayCaption="true" />
<asiweb:SmartControl ID="UpdatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="UpdatedOn" DisplayCaption="true" />
<asiweb:BusinessLabel ID="CreatedByDisplay" runat="Server" RenderPanelField="true" BoundPropertyName="CreatedByUserKey" DataTextField="FullName" DisplayCaption="true" />
<asiweb:SmartControl ID="CreatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="CreatedOn" DisplayCaption="true" />