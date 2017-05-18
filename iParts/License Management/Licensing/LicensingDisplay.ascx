<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LicensingDisplay.ascx.cs" Inherits="Asi.Web.iParts.LicenseManagement.Licensing.LicensingDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register tagPrefix="license" tagName="Display" src="LicenseDisplay.ascx" %>


<telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 
<telerik:RadAjaxPanel ID="radAjaxPanel1" runat="server" LoadingPanelID="radAjaxLoadingPanel1" >
    <asp:Button runat="server" id="EditPanelTrigger" OnClick="EditPanelTriggerClick" style="display:none" Text="text"></asp:Button>
    <asp:Button runat="server" ID="refreshTrigger" Style="display: none" Text="text" OnClick="RefreshTriggerClick"></asp:Button>
    <div id="LicenseDisplayDiv" runat="server">
        <license:Display runat="server" ID="LicenseDisplay"/>
    </div>
    
</telerik:RadAjaxPanel>
