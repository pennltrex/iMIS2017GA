<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Panel ID="editablePanel" runat="server" CssClass="AddPadding Scroll" translate="yes" />
<div id="LocalButtonBar" runat="server" class="FloatRight">
    <asiweb:StyledButton ID="SaveButton" CssClass="PrimaryButton" OnClick="OnSaveButtonClicked" OnClientClick="clearCheckAll()" runat="server" />
    <asiweb:StyledButton ID="CancelButton" CssClass="TextButton" OnClick="OnCancelButtonClicked" CausesValidation="False" runat="server"/>
</div>