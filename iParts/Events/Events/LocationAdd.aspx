<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationAdd.aspx.cs" Inherits="Asi.Web.iParts.Events.LocationAdd" %>
<%@ Register TagPrefix="uc1" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody" translate="yes">
    <asiweb:PanelTemplateControl2 ID="Panel1" runat="server" TemplateTitle="Create a location" Collapsible="false" BorderStyle="None" >    
        <uc1:ContactAccountCreator runat="server" ID="ContactAccountCreator"            
            Collapsible="false"
            ShowBorder="false"
            HideForAuthenticatedUsers="False" 
            AccountTypeAllowed="CompanyOnly"
            IncludePrimaryOrganizationSelection="true"
            RequirePrimaryOrganizationSelection="false"
            IncludePrefix="false" 
            IncludeSuffix="false"
            IncludeDesignation="false"
            IncludeInformalName="false"
            IncludeTitle="false"
            IncludePhone="true"
            IncludeAddress="true"                               
            RequireAddress="false"
            RequireAddress2="false"
            MultipleAddressLines="true"
            />    
        <input type="hidden" id="PartyId" runat="server"/>   
        <input type="hidden" id="AddressId" runat="server"/> 
    </asiweb:PanelTemplateControl2> 
</asp:Content>
