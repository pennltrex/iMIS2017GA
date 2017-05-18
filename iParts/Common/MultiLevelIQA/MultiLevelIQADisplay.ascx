<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiLevelIQADisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.MultiLevelIQA.MultiLevelIQADisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    
    <!-- TODO: Remove this label, and add your own UI elements. -->
    <asiweb:StyledLabel ID="QueryDisplayControl" runat="server"></asiweb:StyledLabel>
    <telerik:RadGrid ID="RadGridControl" runat="server" />
</asp:Panel>       
