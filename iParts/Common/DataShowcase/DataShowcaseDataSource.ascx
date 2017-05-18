<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataShowcaseDataSource.ascx.cs"
    Inherits="Asi.Web.iParts.Common.DataShowcase.DataShowcaseDataSource" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<div style="padding-bottom: 2px; padding-left: 1px;">
    As
    <asiweb:BusinessTextBox runat="server" ID="TextName" CssClass="InputSmall" placeholder="name" />
    from
    <asiweb:BusinessComboBox runat="server" ID="ComboEntity" translate="no" EmptyMessage="source" />
    where
    <asiweb:BusinessTextBox runat="server" ID="TextWhereProperty" placeholder="property" />
    =
    <asiweb:BusinessTextBox runat="server" ID="TextWhereValue" placeholder="value" />
</div>
