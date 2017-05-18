<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecondaryNavigationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Website.SecondaryNavigation.SecondaryNavigationDisplay" %>
<%@ Register TagPrefix="uc1" TagName="SubNavigation" Src="../AsiControls/SubNavigationControl.ascx" %>

<div id="SecondaryNavigationPH" class="SecondaryNavigationPlaceholder EditModePlaceholder" runat="server">    
    <div class="SecondaryNavigationPlaceholderInner EditModePlaceholderInner">Secondary navigation</div>
</div>
<div id="SecondaryNavigationArea" runat="server">
    <nav class="nav-secondary NotPrinted">                
        <uc1:SubNavigation ID="SubNavControl" runat="server" 
            StartingNodeOffset="0" StartFromCurrentNode="true"
            StartingNodeOffsetAutoSet="true" SelectDefaultNode="false" />    
    </nav>    
</div>