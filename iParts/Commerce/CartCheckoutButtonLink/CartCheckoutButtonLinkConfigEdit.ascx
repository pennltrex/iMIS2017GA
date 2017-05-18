<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartCheckoutButtonLinkConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.CartCheckoutButtonLink.CartCheckoutButtonLinkConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
            
       <asiweb:SmartControl ID="DisplayContinueLinkCriteriaDropDown" 
           runat="server" 
           BoundPropertyName="DisplayMode" 
           DisplayCaption="true" 
           PositionCaption="Left"
           ShowNullItem="false" ></asiweb:SmartControl>
   
    </div>    
 </asiweb:paneltemplatecontrol>