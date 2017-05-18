<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialProfileListCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.SocialProfileListCreator.SocialProfileListCreatorDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="SocialNetworkConnections" Src="SocialNetworkConnectionsDisplay.ascx" %>

<uc1:SocialNetworkConnections ID="socialNetworkConnections" runat="server" /> 

<asp:Repeater id="ItemsList" runat="server" OnItemDataBound="ItemsListItemDataBound" >               
    <ItemTemplate>            
        <asp:HyperLink runat="server" id="SocialNetworkHyperLink" Target="_blank" >
            <asp:Image runat="server" ID="SocialNetworkImage" SkinID="SocialNetworkImage" />
        </asp:HyperLink>                       
    </ItemTemplate>
</asp:Repeater>        
<asiweb:StyledLabel runat="server" ID="NoRecordsFoundMessageLabel" Text='<%# NoRecordsFound %>' Visible="False" translate="yes" />
<asiweb:StyledLabel ID="errorLabel" CssClass="Error" runat="server" visible="false" /> 
<asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" style="display:none" />                   