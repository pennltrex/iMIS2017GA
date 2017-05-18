<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationPledgeCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationPledgeCreator.RecurringDonationPledgeCreatorConfigEdit" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
            
    <asiweb:SmartControl
        ID="RunDateLabelTextControl" runat="server" BoundPropertyName="RunDateLabelText" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl
        ID="RunButtonTextControl" runat="server" BoundPropertyName="RunButtonText" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

 </asiweb:PanelTemplateControl>
