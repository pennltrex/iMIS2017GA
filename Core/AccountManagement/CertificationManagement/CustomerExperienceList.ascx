<%@ Control Language="C#" AutoEventWireup="true" 
    Inherits="Asi.Bae.Web.Customer.AccountManagement.CertificationManagement.CustomerExperienceList" Codebehind="~/Core/AccountManagement/CertificationManagement/CustomerExperienceList.ascx.cs" %>

<script type="text/javascript">
    function AddExperienceCallBack(radWindow) {
        radWindow.SourceObject.Refresh();
    }
</script>

<asiweb:PanelTemplateControl ID="CustomerExperiencesPanel" runat="server" Collapsible="False">  
    <asiweb:Lister2 id="CustomerEpxerienceLister" runat="server"
        AjaxEnabled="true"
        LinkTargetBehavior="NewWindowEachLink"
        SortingEnabled="true"
        ColumnReorderingEnabled="false"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="10"
        Width="98%"
        
        AllowNaturalSort="false"
        SortPropertiesList="Name"

        AddButtonLocation="TopRight"
        
        SelectColumnLocation="Beginning"
        UseUniformKey="false"
        TargetUrl="~/Core/AccountManagement/CustomerExperiencesEdit.aspx"
        TargetUrlKeyParameterName = "iCustomerExperienceKey"
        
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/CustomerExperience/CustomerExperienceList"

        SelectMode="true"
        SelectMultipleEnabled="false"
        
        OnPreEvaluateQuery="CustomerExperienceListerPreEvaluateQuery"
    />
</asiweb:PanelTemplateControl>
<div class="CommandBar">
    <asiweb:StyledButton ID="CloseButton" runat="server" OnClick="CloseButtonClick" />
</div>