<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationModuleProductList" Codebehind="CertificationModuleProductList.ascx.cs" %>

<script type="text/javascript">

    function ProductListCallBackFunction(radWindow)
    {
        var hiddenResult = document.getElementById('<%# hiddenResult.ClientID %>');
        if (radWindow.result)
        {
            hiddenResult.value = radWindow.result;
            document.forms[0].submit();
        }
    }

</script>

<input type="hidden" id="hiddenResult" runat="server" />

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false" ShowHeader="False" BorderStyle="None">
    <div class="FloatRight" style="padding-bottom:10px;">
        <asiweb:StyledButton ID="btnAddProduct" runat="server" Text="Add" Width="60" Height="25" />
    </div>
    <asiweb:Lister2 id="lstCertificationModuleProductGrid"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        EnableClientSideDelete="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationModule/CertificationModuleProductList"
        DeleteColumnLocation="End"
        EditColumnLocation="None"
        SelectColumnLocation="None"
        OnPreEvaluateQuery="lstCertificationModuleProductGrid_PreEvaluateQuery"
        OnItemDeleted="lstCertificationModuleProductGrid_ItemDeleted"
    />

</asiweb:PanelTemplateControl2>
