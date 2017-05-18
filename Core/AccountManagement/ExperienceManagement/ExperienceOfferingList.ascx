<%@ Import namespace="Asi.Web.UI.WebControls"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Bae.Web.Customer.AccountManagement.ExperienceManagement.ExperienceOfferingList" Codebehind="ExperienceOfferingList.ascx.cs" %>

<asiweb:PanelTemplateControl ID="OfferingsPanel" runat="server" Collapsible="False">
    <asiweb:StyledLabel id="chooseLabel" runat="server" CssClass="PanelTitle"></asiweb:StyledLabel>
        <asiweb:Lister2 id="lstOffering" runat="server"
            AjaxEnabled="true"
	        LinkTargetBehavior="SameWindow"

            PagingEnabled="true"
            PagerMode="Advanced"
            PageSize="10"

	        TargetUrl="~/Core/AccountManagement/CustomerExperiencesEdit.aspx"
	        TargetUrlParameters="iNewObject=true&iCustomerExperienceClass=OfferedCustomerExperience&FromStaff=false&TemplateType=D"
	        TargetUrlKeyParameterName="iAssociatedKey"
	        TargetTemplateType="D"
	        
	        DataSourceDocumentPath = "$/ExperienceManagement/DefaultSystem/Queries/Offering/ExperienceOfferingList"
            UseUniformKey = "true"
            SelectMode = "true"
            SelectMultipleEnabled = "false"
            
            GroupingEnabled = "false"
            ColumnReorderingEnabled = "false"
	        
            OnPreEvaluateQuery="lstOffering_PreEvaluateQuery"
        />

</asiweb:PanelTemplateControl>