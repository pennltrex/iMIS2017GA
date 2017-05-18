<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PremiumRuleCreator.aspx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.PremiumRuleCreator" %>
<%@ Import Namespace="Asi" %>
<%@Register tagPrefix="asiweb" namespace="Asi.Web.UI.WebControls" assembly="Asi.Web"  %>
<%@Register tagPrefix="PremiumDefinitionDisplay" tagName="PremiumDefinitionDisplay" Src="../../Fundraising/PremiumDefinitionDisplay/PremiumDefinitionDisplayDisplay.ascx"%>

<asp:Content ID="ContentPanel" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="true" Collapsible="false" ScrollBars="None" BorderStyle="None" >
         <PremiumDefinitionDisplay:PremiumDefinitionDisplay ID="PremiumDefinition" ProductEditMode="true" SupressSaveButton="true" runat="server"/>

    </asiweb:PanelTemplateControl>
 </asp:Content>