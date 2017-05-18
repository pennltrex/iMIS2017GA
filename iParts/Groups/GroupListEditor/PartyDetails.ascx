<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PartyDetails.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.PartyDetails" %>

<%@ Register TagPrefix="uc1" TagName="MiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">   
    <div id="groupNameDiv" runat="server" visible="false"/>    
    <div class="PanelColumn" style="width:70%;">
        <uc1:MiniProfile ID="MiniProfile" runat="server" Collapsed="false" Collapsible="false" 
            DisplayContactName="true" 
            DisplayContactTitle="true" 
            DisplayInstitute="true" 
            AddressToDisplay="Preferred Mailing" 
            DisplayCustomerId="false"
            DisplayBillingCat="false"
            DisplayCustomerJoinDate="false"
            DisplayCustomerType="false"
            DisplayCustomerStatus="false"            
            DisplayPaidThru="false"             
            DisplayContactPicture="false"
            GenerateContactPicture="false" 
            PartyId='<%#PartyId %>' />
        <div class="panel-body-container">
            <div id="membershipsDiv" runat="server" visible="false" class="panel-body" style="background: transparent; border: none;"></div>
        </div>
    </div>
    <div id="contactPictureDiv" runat="server" visible="false" class="PanelColumn" style="width:25%;"> 
        <img id="contactPicture" runat="server" alt="Profile picture" style="border:#ccc 1px solid;padding:2px;" />   
    </div>
</asp:Panel>
