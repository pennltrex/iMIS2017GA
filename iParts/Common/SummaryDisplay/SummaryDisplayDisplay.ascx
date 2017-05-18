<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SummaryDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.SummaryDisplay.SummaryDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:StyledLabel ID="errorLabel" runat="server" CssClass="Info" Visible="False"></asiweb:StyledLabel>
    <asp:Panel ID="QueryControlsPanel" runat="server" translate="yes">
    </asp:Panel>
</asp:Panel>       
