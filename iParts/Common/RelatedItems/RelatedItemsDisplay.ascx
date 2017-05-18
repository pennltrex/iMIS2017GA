<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelatedItemsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.RelatedItems.RelatedItemsDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    
    <asiweb:StyledLabel ID="errorLabel" CssClass="Error" runat="server" visible="false" /> 
           
    <div id="divDescription" runat="server" visible="false" />

    <div id="divRadRotatorBlock" class="RelatedItemsHorizontalBlock" runat="server">   
        <div id="divRadRotatorCentered" class="RelatedItemsHorizontalCentered" runat="server">       
            <telerik:RadRotator ID="radRotator" runat="server" visible="false" SkinID="RelatedItems" />
        </div>   
    </div>
                               
    <asp:Placeholder id="ListPlaceholder" runat="server"/> 
    
    <div id="divNoRecordsFound" runat="server" visible="false" />

    <div style="clear: both;"></div>
                         
</asp:Panel> 