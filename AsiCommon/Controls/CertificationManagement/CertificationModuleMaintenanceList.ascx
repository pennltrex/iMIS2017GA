<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationModuleMaintenanceList" Codebehind="CertificationModuleMaintenanceList.ascx.cs" %>

<script type="text/javascript">
    // Added this callback so the Lister2 is refreshed after clicking the Register link
    function Lister2_DialogWindowCallback() {
        document.forms[0].submit();
        wait();
    }
</script>

<asiweb:PanelTemplateControl ID="CertificationProgramHistoryPanel" runat="server" Collapsible="False" BorderStyle="None">    
    <asiweb:Lister2 id="CertificationModuleMaintenanceLister" runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        ColumnReorderingEnabled="false"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="10"
        ExportButtonLocation="TopRight"
        SelectColumnLocation="None"
        UseUniformKey="true"
        AllowNaturalSort="false"
        SelectMode="true"
        SelectMultipleEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationProgramRegistration/RegistrationStatusChangeList"
        AddButtonLocation ="BottomLeft"
        AddLinkTargetBehavior = "NewWindowAllShare"
        AddButtonText = "Create New Enrollment"
        AddButtonToolTip = "Create New Enrollment"
        AddTargetUrl = "~/iMIS/CertificationManagement/CertificationProgramDetails.aspx"
        OnItemDataBound="CertificationModuleMaintenanceListerItemDataBound"
        OnPreEvaluateQuery="CertificationModuleMaintenanceListLister_PreEvaluateQuery" 
        DisableQueryEdit="True"
    />
</asiweb:PanelTemplateControl>
