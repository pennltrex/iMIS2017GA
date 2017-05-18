<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BippConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.BatchInvoicePaymentProcessing.BippConfigEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None"> 

<div class="AutoWidth">
    <asiweb:SmartControl ID="HideClickMe" runat="server" BoundPropertyName="HideClickMe" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" /> 
</div>
    <asiweb:SmartControl ID="ListSourceQuery" runat="server" BoundPropertyName="ListSourceQuery" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 
    <asiweb:SmartControl ID="ButtonText" runat="server" BoundPropertyName="ButtonText" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"></asiweb:SmartControl>
    <asiweb:SmartControl ID="BatchHistoryContentCode" runat="server" BoundPropertyName="BatchHistoryContentCode" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 
    <asiweb:SmartControl ID="ClickMeText" runat="server" BoundPropertyName="ClickMeText" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 
    <asiweb:SmartControl ID="PaymentsSentToDataVaultText" runat="server" BoundPropertyName="PaymentsSentToDataVaultText" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 

    <div class="PanelField Left" ID="DivLabelIQAError" runat="server" >
        <div>
            <label id="LabelIQAErrorLabel" for="LabelIQAError"></label>
        </div>
        <div class="PanelFieldValue">
            <asp:Label ID="LabelIQAError" CssClass="AsiError" runat="server" />
        </div>        
    </div>  

</asiweb:paneltemplatecontrol>