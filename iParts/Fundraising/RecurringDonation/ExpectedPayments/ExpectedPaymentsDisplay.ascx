<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpectedPaymentsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.ExpectedPayments.ExpectedPaymentsDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    
    <asp:Label ID="ErrorLabel" runat="server"  CssClass="Error" />
    
    <asiweb:PanelTemplateControl ID="MainPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false" BorderStyle="None">
            
        <asiweb:BusinessComboBox AllowCustomText="false" ID="MonthYear" runat="server" DisplayCaption="true" Caption="Month/Year" RenderPanelField="true" style="border-bottom-style:none" />
        
        <div class="PanelField Left" style="border-bottom-style:none">
            <asiweb:StyledLabel ID="StyledLabel1" runat="server" AssociatedControlID="goButton">&nbsp;</asiweb:StyledLabel>
            <asiweb:StyledButton ID="goButton" runat="server" Text="Generate Expected Payments" />
        </div>
      
       <div style="clear:both;">
           <asiweb:StyledLabel ID="StatusLabel" runat="server" CssClass="Info" />
           <asp:CheckBox ID="WarningCheckBox" runat="server" CssClass="Info" Visible="false" />
       </div>
     
       <asiweb:Lister2 ID="ExpectedPaymentsList" runat="server"
            PagerMode="Advanced" PageSize="20" 
            SelectColumnLocation="None" 
            SelectMode="false"   
            SortingEnabled="false"
            DeleteColumnButtonType="Link"
            DeleteColumnLocation="None"
            EnableClientSideDelete="false"
            LinkTargetBehavior="RaiseEvent"
            EnableViewState="true"
            DisplayPropertiesList=""
            DisplayPropertiesTitleOverride=""
            DataSourceDocumentPath="$/Fundraising/DefaultSystem/Queries/Recurring Donations/Recurring Donation Expected Payment Set List">
       </asiweb:Lister2>
       
    </asiweb:PanelTemplateControl>
    
</asp:Panel>       
