<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimaryNavigationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Website.PrimaryNavigation.PrimaryNavigationDisplay" %>
<%@ Register TagPrefix="uc1" TagName="PageNavR" Src="../AsiControls/PageNavRControl.ascx" %>
<div id="PrimaryNavigationPH" class="PrimaryNavigationPlaceholder EditModePlaceholder" runat="server">    
    <div class="PrimaryNavigationPlaceholderInner EditModePlaceholderInner">Primary navigation</div>
</div>
<div id="PrimaryNavigationArea" runat="server" class="primary-navigation-area">
    <div id="PrimaryNavigationControl" runat="server" class="collapse navbar-collapse nav-primary">
        <uc1:PageNavR ID="NavControl" runat="server" />
    </div>
</div>