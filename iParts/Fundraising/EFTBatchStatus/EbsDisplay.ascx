<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.EFTBatchStatus.EbsDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    
    <asiweb:TitleBar ID="TitleBar" Text="<%#PartTitle%>" TitleBarClickBehavior="DoNothing"
        ShowActionBox="false" runat="server" />

    <asiweb:StyledButton runat="server" ID="ButtonRefreshStatus" CssClass="PrimaryButton" OnClick="ButtonRefreshStatusClick" Text="<%# RefreshButtonText %>" Enabled="true" /> <br />

</asp:Panel>