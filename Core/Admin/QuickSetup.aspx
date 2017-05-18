<%@ Page Language="C#" AutoEventWireup="true" Inherits="Core_Admin_QuickSetup" Title="Web components configuration" Codebehind="QuickSetup.aspx.cs" %>
<asp:Content ID="Content5" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:PanelTemplateControl2 ID="SystemConfigPageTemplateControl" runat="server" Collapsible="false" Text="Organization settings">
    <div class="PanelField Top">
        <asp:Label ID="OrganizationNameLabel" runat="server" Text="The full name of the organization that owns the site" AssociatedControlID="OrganizationName"></asp:Label>
        <div class="PanelFieldValue">
            <asp:TextBox ID="OrganizationName" CssClass="InputXLarge" Columns="60" runat="server"></asp:TextBox>
            <asp:Label ID="OrganizationNameHint" runat="server" Text="e.g., Association of Business Corporations" CssClass="Info"></asp:Label>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="OrganizationAbbrevLabel" runat="server" Text="The abbreviated name of the organization that owns the site" AssociatedControlID="OrganizationAbbrev"></asp:Label>
        <div class="PanelFieldValue">
            <asp:TextBox ID="OrganizationAbbrev" runat="server"></asp:TextBox>
            <asp:Label ID="OrganizationAbbrevHint" runat="server" Text="e.g., ABC" CssClass="Info"></asp:Label>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="EmailAddressLabel" runat="server" Text="The default email address for the site:" AssociatedControlID="EmailAddress"></asp:Label>
        <div class="PanelFieldValue">
            <asp:TextBox ID="EmailAddress" CssClass="InputXLarge" Columns="40" runat="server"></asp:TextBox>
            <asp:Label ID="EmailAddressHint" runat="server" Text="for the webmaster, contact us, etc." CssClass="Info"></asp:Label>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="WebCustomerTypeLabel" runat="server" Text="The default Customer Type to use when creating new customers online" AssociatedControlID="WebCustomerType"></asp:Label>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="WebCustomerType" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="WebCompanyTypeLabel" runat="server" Text="The default Customer Type to use when creating new organizations online" AssociatedControlID="WebCompanyType"></asp:Label>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="WebCompanyType" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="WebMemberEventGuestTypeLabel" runat="server" Text="The default Customer Type for event guests added by members" AssociatedControlID="WebMemberEventGuestType"></asp:Label>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="WebMemberEventGuestType" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="PanelField Top">
        <asp:Label ID="WebNonMemberEventGuestTypeLabel" runat="server" Text="The default Customer Type for event guests added by non-members" AssociatedControlID="WebNonMemberEventGuestType"></asp:Label>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="WebNonMemberEventGuestType" runat="server"></asp:DropDownList>
        </div>
    </div>
        
    <div class="PanelField">
        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" TextMode="MultiLine" Rows="3" ID="StayLowerTextBox" PositionCaption="Top" RenderPanelField="true" runat="server" />   
        <asiweb:BusinessCheckBox DisplayCaption="True" id="AutoUpperLowerCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />   
        <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" TextMode="MultiLine" Rows="3" ID="CompanySortPrefixesTextBox" PositionCaption="Top" RenderPanelField="true" runat="server" />   
    </div>
        
    <div class="PanelField Top">
        <asp:Label ID="Label1" runat="server" Text="Synchronize Desktop or Advanced Accounting Console settings changes to the web" AssociatedControlID="RefreshSettings"></asp:Label>
        <div class="PanelFieldValue">
            <asiweb:StyledButton runat="server" ID="RefreshSettings" OnClick="RefreshSettings_OnClick" Text="Refresh Cached Settings"/>
        </div>
    </div>
  
    </asiweb:PanelTemplateControl2>
</asp:Content>

