<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.PurgeInactiveRegistrations" Codebehind="PurgeInactiveRegistrations.ascx.cs" %>

<script type="text/javascript">
    function CallBackFunction(radWindow, returnValue)
    {
        var hiddenResult = document.getElementById('<%# hiddenResult.ClientID %>');
        if (returnValue)
        {
            hiddenResult.value = returnValue;
            document.forms[0].submit();
        }
    }
</script>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Inactive enrollments" ShowHeader="True" Collapsible="False" BorderStyle="None">

    <input type="hidden" id="hiddenResult" runat="server" />
    <asiweb:Lister2 
        id="lstPurgeRegistrationsGrid" 
        runat="server"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/InactiveRegistrations"
        AjaxEnabled="true" 
        EnableClientSideDelete="false" 
        SelectMultipleEnabled="True"                    
        OnItemDeleted="lstCertificationProgramProductGrid_ItemDeleted"
        SortingEnabled="False" 
        PagingEnabled="true" 
        SelectColumnLocation="Beginning" 
        PagerMode="Advanced" 
        PageSize="20"
        AddButtonEnabled="false"
        DisableQueryEdit="true"
        OnItemDataBound="PurgeRegistrationsItemDataBound" 
        DeleteColumnLocation="End"       
        ColumnReorderingEnabled="false"
        EditColumnLocation="None"
        CollapsiblePanelTemplate="false"
        TargetUrl="~/iMIS/CertificationManagement/CertificationModuleRegistrationList.aspx"
       />

    <div class="FloatRight">
        <asiweb:StyledButton ID="btnPurgeRegistrations" runat="server" />
    </div>
    
</asiweb:PanelTemplateControl2>