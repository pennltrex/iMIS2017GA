<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuthorizationProviders.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Shared.ExternalAuthorizationProviders.AuthorizationProviders" %>

<asp:ListView runat="server" ID="providerDetails" ItemType="System.String" SelectMethod="GetProviderNames" ViewStateMode="Disabled" 
    OnItemCreated="ListView_ItemCreated">
    <ItemTemplate>      
        <Button runat="server" ID="providerButton"
            CausesValidation="False" OnServerClick="providerButton_OnClick" >                
        </Button>                             
    </ItemTemplate>    
    <EmptyDataTemplate></EmptyDataTemplate>
</asp:ListView>

<div class="LineThruContainer" id="LineThruContainerDiv" runat="server" Visible="false">
    <div class="LineThruBlock">   
        <strong class="LineThru"><asp:Label runat="server" translate="yes" Text="or"/></strong>   
    </div>
</div>