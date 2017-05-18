<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Bae.Web.Customer.AccountManagement.CertificationManagement.OfferingList" MasterPageFile="~/Templates/MasterPages/Empty.master" Codebehind="OfferingList.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <asiweb:PanelTemplateControl ID="panelOfferings" runat="server" Collapsible="False" BorderStyle="None">

        <div style="font-weight:bold;color:#26558D; margin:10px 0 10px 0;">
            <asiweb:StyledLabel runat="server" ID="lblEnroll"></asiweb:StyledLabel>
        </div>
        
        <div style="font-weight:bold;color:#26558D; margin:10px 0 10px 0;">
            <asiweb:StyledLabel runat="server" ID="lblAlreadyEnrolled"></asiweb:StyledLabel>
        </div>

        <asiweb:Lister2 id="lstOfferingGrid" runat="server"
            AjaxEnabled="true"
	        LinkTargetBehavior="SameWindow"
	        TargetUrl="~\Core\AccountManagement\CertificationManagement\CertificationCustomerExperienceEdit.aspx"
            AddTargetUrl="~\Core\AccountManagement\CertificationManagement\CertificationCustomerExperienceEdit.aspx"      
	        DataSourceDocumentPath = "$/ExperienceManagement/DefaultSystem/Queries/Offering/OfferingRegistrationList"
            UseUniformKey = "true"
            SelectMode = "true"
            SelectMultipleEnabled = "false"
            GroupingEnabled = "false"
            ColumnReorderingEnabled = "false"
            ExportButtonLocation = "None"
            OnPreEvaluateQuery="lstOfferingGrid_PreEvaluateQuery"
            SelectColumnLocation="None"
            LinkProperty="Offering"
            DisableQueryEdit="true"
        />

    </asiweb:PanelTemplateControl>
</asp:Content>