<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenInvoiceListDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OpenInvoiceListDisplay.OpenInvoiceListDisplayConfigEdit" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth"> 
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />         
    </div>    

    <asp:Panel class="ClearFix form-inline" id="FinancialEntitySection" runat="server">
        <asiweb:SmartControl runat="server" ID="FilterByFinancialEntity" BoundPropertyName="FilterByFinancialEntity" DisplayCaption="True"
            PositionCaption="Right" DataSaveUponStateChange="False" AutoPostBack="True" />
        <asiweb:StyledLabel runat="server" ID="FinancialEntityLabel" BoundPropertyName="SelectedFinancialEntity" CssClass="screen-reader-text" 
            RenderPanelField="False" AssociatedControlID="FinancialEntitySelect" />
        <asiweb:SmartControl runat="server" ID ="FinancialEntitySelect" BoundPropertyName="SelectedFinancialEntity" DisplayCaption="False"
            DataSaveUponStateChange="False" />
    </asp:Panel>

    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayOption" runat="server" BoundPropertyName="DisplayOption" DisplayCaption="true" 
            PositionCaption="Top" DataSaveUponStateChange="false" AutoPostBack="true" InputFieldCssClass="SubItems" />       
        <div class="SubItems">
            <asiweb:SmartControl ID="NoOpenInvoice" runat="server" BoundPropertyName="NoOpenInvoice" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
        </div> 
    </div>

 </asiweb:paneltemplatecontrol>