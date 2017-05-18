<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimaryOrganizationSelectorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.PrimaryOrganizationSelector.PrimaryOrganizationSelectorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<div runat="server" id="DivPrimaryOrganizationSelector">
	<div runat="server" id="DivPanelField" >
			<asiweb:BusinessComboBox runat="server" id="PrimaryOrganizationComboBox" RenderPanelField="True" DisplayCaption="True" 
                EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="True" EmptyMessage="Enter an organization" ShowNullItem="true" 
                OnItemsRequested="PrimaryOrganizationComboBoxItemsRequested" IsCaseSensitive="false" MaxLength="80" ShowToggleImage="false" 
                OnSelectedIndexChanged="PrimaryOrganizationComboBoxSelectionChanged" Width="12.25em" /> 
			<asiweb:AsiRequiredFieldValidator runat="server" ID="PrimaryOrganizationComboBoxRequiredValidator"
                ControlToValidate="PrimaryOrganizationComboBox" CssClass="Important" />
            <asiweb:BusinessTextBox runat="server" ID="PrimaryOrganizationTextBox" TextMode="SingleLine" Visible="false" DisplayCaption="True"/>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="PrimaryOrganizationTextBoxRequiredValidator"
                ControlToValidate="PrimaryOrganizationTextBox" CssClass="Important" />
	</div>
    <div style="clear:both;"></div> 
</div>