<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MiniGroupListDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.MiniGroupListDisplay.MiniGroupListDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <asp:Label ID="SoaErrorText" runat="server" CssClass="Error" Text='<%# ResourceManager.GetPhrase("SoaServiceUnavailable", "Temporarily Unavailable") %>' Visible="false" />

    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
          
    <asp:placeholder ID="Placeholder1" Runat="server"></asp:placeholder>  

</asp:Panel>       
