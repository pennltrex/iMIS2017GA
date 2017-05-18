<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.MainDisplay" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>


<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
<asp:Label ID="errorLabel" runat="server" CssClass="Error" Visible="false" />

    <asiweb:PanelTemplateControl ID="mainPanelTemplate" Text="<%#PageTitle%>" runat="server" FieldSet="true"
            ShowHeader="false" BorderStyle="None" >
        
        <asp:placeholder ID="phControls" Runat="server"></asp:placeholder>
    
    </asiweb:PanelTemplateControl>

</asp:Panel>