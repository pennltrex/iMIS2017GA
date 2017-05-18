<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationPledgeCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationPledgeCreator.RecurringDonationPledgeCreatorDisplay" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <div runat="server" id="divRunPledges" style="text-align:left;float:left;white-space: nowrap;padding-left:5px;" translate="yes">
        <asp:Label ID="lblRunDate" runat="server" Text="<%# RunDateLabelText %>" style="padding-right:5px;" />
        <asiweb:BusinessCalendar2 id="runDate" runat="server" Value="<%# DefaultRunDate %>" DisplayCaption="true" PositionCaption="Left"/>

        <asiweb:StyledButton runat="server" ID="buttonRunPledges" CssClass="PrimaryButton" OnClick="ButtonRunPledgesClick" Text="<%# RunButtonText %>" Enabled="true" /> <br />

    </div>

</asp:Panel>