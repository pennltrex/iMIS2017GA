<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentCreatorConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.PaymentCreator.PaymentCreatorConfigEdit" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">  
    <asiweb:SmartControl 
        ID="PaymentPurpose" runat="server" BoundPropertyName="PaymentPurpose" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" RenderPanelField="true" ShowNullItem="false" />
    <asiweb:SmartControl 
        ID="DisplayUpdate" runat="server" BoundPropertyName="DisplayUpdate" CssClass="AutoWidth"
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    <asiweb:SmartControl 
        ID="CommitSequenceControl" runat="server"
        BoundPropertyName="CommitSequence" DisplayCaption="true"
        PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />  
    <asiweb:SmartControl 
        ID="PurchaseOrderNumberRequiredControl" runat="server" BoundPropertyName="PurchaseOrderNumberRequired" CssClass="AutoWidth"
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" Visible='<%# DisplayPurchaseOrderNumberRequiredControl %>'
        Enabled='<%# EnablePurchaseOrderNumberRequiredControl %>' />  
</asiweb:PanelTemplateControl>