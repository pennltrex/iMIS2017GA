<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PremiumDefinitionDisplayDisplay.ascx.cs" 
    Inherits="Asi.Web.iParts.Fundraising.PremiumDefinitionDisplay.PremiumDefinitionDisplayDisplay" Title="Configure premiums" %>
<%@ Import Namespace="Asi" %>
<%@Register tagPrefix="asiweb" namespace="Asi.Web.UI.WebControls" assembly="Asi.Web"  %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" Collapsible="false" ScrollBars="None" BorderStyle="None" translate="yes">
    <div class="PanelField Left">
        <div style="display: inline;">
            <asp:Label runat="server" Text="Name" CssClass="Label Required" AssociatedControlID="NameTextBox"></asp:Label>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox ID="NameTextBox" MaxLength="65" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredValidatorForName" Text="Required" runat="server" ControlToValidate="NameTextBox"  Display="Dynamic"/>  
        </div>
    </div>
    <div class="PanelField Left">
        <div style="display: inline;">
            <asp:Label runat="server" Text="Eligible gift items" CssClass="Label" aria-hidden="true"></asp:Label>
        </div>
        <div class="PanelFieldValue"  translate="no" runat="server">
            <telerik:RadComboBox ID="EligibleGiftItemsSelector" runat="server" Height="200" Width="200" CheckBoxes="True" EnableAriaSupport="true" Label="Eligible gift items" LabelCssClass="sr-only" />
        </div>
    </div>
    <div class="PanelField Left">
        <div style="display: inline;">
           <asp:Label runat="server" Text="Source codes" CssClass="Label" aria-hidden="true"></asp:Label>
        </div>
        <div class="PanelFieldValue" translate="no" runat="server">
            <telerik:RadComboBox ID="SourceCodesSelector" runat="server" Height="200" Width="200" CheckBoxes="True" EnableAriaSupport="true" Label="Source codes" LabelCssClass="sr-only" />
        </div>
    </div>
    <div class="PanelField Left">
        <asp:Label runat="server" Text="Available starting" CssClass="Label" aria-hidden="true"></asp:Label>
        <asiweb:StyledLabel runat="server" id="CalendarFromDateLabel" Text="Availability Start Date" CssClass="screen-reader-text" AssociatedControlID="CalendarFromDate"></asiweb:StyledLabel>
        <asiweb:BusinessCalendar2 ID="CalendarFromDate" runat="server" />
        <asiweb:DateTimeValidator runat="server" ControlToValidate="CalendarFromDate"/>  
        <asiweb:StyledLabel runat="server"  ID="CalendarFromTimeLabel" Text="Availability Start Time" CssClass="screen-reader-text" AssociatedControlID="CalendarFromTime"></asiweb:StyledLabel>
        <asiweb:BusinessCalendar2 runat="server" ID="CalendarFromTime" ControlType="TimePicker" UseSqlDateTimeMinValue="true" DisplayTimeZone="True" />
    </div>
    <div class="PanelField Left">
        <asp:Label runat="server" Text="Available until" CssClass="Label" aria-hidden="true"></asp:Label>
        <asiweb:StyledLabel runat="server" id="CalendarToDateLabel" Text="Availability End Date" CssClass="screen-reader-text" AssociatedControlID="CalendarToDate"></asiweb:StyledLabel>
        <asiweb:BusinessCalendar2 ID="CalendarToDate" runat="server" ToolTip="to date" Caption="and" DisplayCaption="True" PositionCaption="Left"/>
        <asiweb:DateTimeValidator runat="server" ControlToValidate="CalendarToDate"/>
        <asiweb:StyledLabel runat="server" id="CalendarToTimeLabel" Text="Availability End Time" CssClass="screen-reader-text" AssociatedControlID="CalendarToTime"></asiweb:StyledLabel>
        <asiweb:BusinessCalendar2 runat="server" ID="CalendarToTime" ControlType="TimePicker" UseSqlDateTimeMinValue="true" DisplayTimeZone="True" />
        <asp:CustomValidator ID="CalendarValidator" runat="server" Enabled="False" EnableClientScript="False" ErrorMessage="invalid date range">   
        </asp:CustomValidator>				
    </div>
    <div class="PanelField Left" id="PremiumDiv" runat="server">
        <div style="display: inline;">
            <asp:Label runat="server" Text="Premiums" CssClass="Label" aria-hidden="true"></asp:Label>
        </div>
        <div class="PanelFieldValue" translate="no" runat="server">
            <telerik:RadComboBox ID="PremiumsSelector" runat="server" Height="200" Width="200" CheckBoxes="True" EmptyMessage="(Any)" EnableAriaSupport="true" Label="Premiums" LabelCssClass="sr-only" />
        </div>
    </div>
    <div class="PanelField FloatRight" id="ButtonDiv" runat="server">
       <asp:Button ID="SaveButton" Text="Save" CssClass="TextButton PrimaryButton" CommandName="Update" runat="server" />
       <asp:Button ID="CancelButton" Text="Cancel" CssClass="TextButton" CommandName="Cancel" CausesValidation="False" runat="server" />
    </div>
</asiweb:PanelTemplateControl2> 

