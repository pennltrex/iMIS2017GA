<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_PropertyEditor_PropertyDisplay" Codebehind="PropertyDisplay.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="Display" Collapsed="false" RoundedCorners="false" FieldSet="true">
    <asiweb:SmartControl ID="Label" runat="server" BoundPropertyName="Label" DisplayCaption="true" />
    <asiweb:SmartControl ID="DisplayControl" runat="server" BoundPropertyName="HIControlTypeCode" DisplayCaption="true" AutoPostBack="false" />
    <asiweb:SmartControl ID="DisplayWidth" runat="server" BoundPropertyName="HIControlWidth" DisplayCaption="true" />
    <asiweb:SmartControl ID="DisplayHeight" runat="server" BoundPropertyName="HIControlHeight" DisplayCaption="true" />
    <asiweb:SmartControl ID="AllowMultipleSelect" runat="server" BoundPropertyName="AllowMultiSelectFlag" DisplayCaption="true" PositionCaption="Right" />
    <asiweb:SmartControl ID="DisplayOrientation" runat="server" BoundPropertyName="HIControlRepeatDirection" DisplayCaption="true" ShowNullItem="false" />
    <asiweb:SmartControl ID="DisplayColumns" runat="server" BoundPropertyName="HIControlRepeatColumns" DisplayCaption="true" />
</asiweb:PanelTemplateControl2>