<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationCreator.RecurringDonationCreatorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:StyledLabel runat="server" ID="ConfigurationErrorMessage" Visible="False" CssClass="Error">The Recurring Donation Creator content item must have a connection to a Donation Creator content item. Please see the configuration help for more information.</asiweb:StyledLabel>
<asiweb:PanelTemplateControl ID="RecurringDonationCreatorDisplayPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">

    <div class="PanelField Top CalloutPanelField1">

        <div class="PanelFieldValue FloatNone">
            <asp:RadioButtonList ID="RecurringDonationOption" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" />
        </div>
    </div>
    <div class="PanelField Left" id="FrequencySelect" runat="server">
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="GiftFrequencyLabel" Text="Select gift frequency" AssociatedControlID="RecurringDonationFrequency"/>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="RecurringDonationFrequency" DisplayCaption="False" Caption="" RenderPanelField="true"></asiweb:BusinessDropDownList>
        </div>
    </div>
    <asp:UpdatePanel ID="collectionDayUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False" >
        <ContentTemplate >
            <div class="PanelField Left" runat="server" ID="collectionDayPanel" translate="yes">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCollectionDay" Text="Collection day" CssClass="Label" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessRadioButtonList runat="server" ID="RadioButtonCollectionDay" />
                    <asiweb:BusinessDropDownList runat="server" ID="DropDownListCollectionDay" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asiweb:PanelTemplateControl>

