<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPaySettings.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayEnrollments.AutoPaySettings" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl2 runat="server" ID="DisplayPanel" ShowHeader="True" Collapsible="False" ScrollBars="None" ShowBorder="True" translate="yes">
<%-- DONATIONS --%>
<div class="PanelField Left AutoWidth">
    <div class="PanelFieldValue">
        <asiweb:BusinessCheckBox runat="server" ID="AllowUsersCreateRecurringDonations" AutoPostBack="True" OnCheckedChanged="AllowUsersCreateRecurringDonations_OnCheckedChanged" />
    </div> 
    <div style="display: inline;">  
        <asiweb:StyledLabel runat="server" ID="LabelAllowUsersCreateRecurringDonations" Text="Allow users to create recurring donations" AssociatedControlID="AllowUsersCreateRecurringDonations" 
            CssClass="Floatnone"></asiweb:StyledLabel>
    </div>
</div>
<p class="clearfix">&nbsp;</p>
<div class="ShowFieldset">
<fieldset runat="server" id="RecurringDonationsPanel" class="ShowLegend">
    <legend><asiweb:StyledLabel runat="server" ID="RecurringDonationsPanelTitle"></asiweb:StyledLabel></legend>
    <div class="PanelField Left AutoWidth">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox runat="server" ID="DefaultToRecurring" />
        </div>
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="LabelDefaultToRecurring" Text="Donations are recurring by default" AssociatedControlID="DefaultToRecurring"></asiweb:StyledLabel>
        </div>
    </div>
    <div class="PanelField Left AutoWidth">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox runat="server" ID="AllowDonorsChangeAmount"/>
        </div>
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="LabelAllowDonorsChangeAmount" Text="Allow donors to change the amount of their donation" 
                AssociatedControlID="AllowDonorsChangeAmount"></asiweb:StyledLabel>
        </div>
    </div>
    <div runat="server" ID="CollectionDateDiv">
    <div class="PanelField Left AutoWidth">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox runat="server" ID="AllowDonorsSelectCollectionDate" AutoPostBack="True" OnCheckedChanged="AllowDonorsSelectCollectionDate_OnCheckedChanged" />
        </div>
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="LabelAllowDonorsSelectCollectionDate" Text="Allow donors to choose their collection date" 
                AssociatedControlID="AllowDonorsSelectCollectionDate"></asiweb:StyledLabel>
        </div>
    </div>
    <p class="clearfix">&nbsp;</p>
    <div class="PanelField Left SubItems" runat="server" ID="DonorsCollectionDayPanel">
        <div class="PanelFieldValue">
            <p><asiweb:StyledLabel runat="server" ID="DonorsDateSelection" CssClass="Required Label" Text="Donors may select:"></asiweb:StyledLabel></p>
            <asiweb:BusinessRadioButtonList runat="server" ID="DonorsCollectionDayRadioButtonList" RepeatDirection="Horizontal" CausesValidation="True" />
        </div>
    </div>
    </div>
</fieldset>
</div>
 

<%-- MEMBERSHIPS --%>
<div class="PanelField Left AutoWidth">
    <div class="PanelFieldValue">
        <asiweb:BusinessCheckBox runat="server" ID="AllowUsersCreateRenewingMemberships" AutoPostBack="True" OnCheckedChanged="AllowUsersCreateRenewingMemberships_OnCheckedChanged" />
    </div>
    <div style="display: inline;">
        <asiweb:StyledLabel runat="server" ID="LabelAllowUsersCreateRenewingMemberships" Text="Allow users to create auto-renewing memberships" 
            AssociatedControlID="AllowUsersCreateRenewingMemberships"></asiweb:StyledLabel>
    </div>
</div>
<p class="clearfix">&nbsp;</p>
<div class="ShowFieldset">
<fieldset runat="server" id="MembershipsPanel" class="ShowLegend">
    <legend><asiweb:StyledLabel runat="server" id="MembershipPanelTitle"></asiweb:StyledLabel></legend>
     <div class="PanelField Left AutoWidth" runat="server" id="DefaultAutoRenewPanel">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox runat="server" ID="DefaultAutoRenew" />
        </div>
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="LabelDefaultAutoRenew" Text="Memberships are auto-renewing by default" AssociatedControlID="DefaultAutoRenew"></asiweb:StyledLabel>
        </div>
    </div>
    <div class="PanelField Left AutoWidth" runat="server" ID="RequiredAutoRenewPanel">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox runat="server" ID="RequiredAutoRenew" AutoPostBack="True" OnCheckedChanged="RequiredAutoRenew_OnCheckedChanged" />
        </div>
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="LabelRequiredAutoRenew" Text="Memberships are required to be auto-renewing" AssociatedControlID="RequiredAutoRenew"></asiweb:StyledLabel>
        </div>
    </div>
</fieldset>
</div>

</asiweb:PanelTemplateControl2>