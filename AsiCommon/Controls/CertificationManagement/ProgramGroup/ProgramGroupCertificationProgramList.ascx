<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.ProgramGroupCertificationProgramList" Codebehind="ProgramGroupCertificationProgramList.ascx.cs" %>
<script type="text/javascript">
    function CallBackFunction(radWindow) {
        var hiddenResult = document.getElementById('<%# hiddenResult.ClientID %>');
        if (radWindow.result) {
            hiddenResult.value = radWindow.result;
            document.forms[0].submit();
        }
    }
</script>

<input type="hidden" id="hiddenResult" runat="server" />

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="CertificationPrograms" Collapsible="false" BorderStyle="None">

    <asiweb:Lister2 id="lstProgramGroupCertificationProgramGrid"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/ProgramGroup/ProgramGroupCertificationProgramList"
        DeleteColumnLocation="End"
        EditColumnLocation="None"
        SelectColumnLocation="None"
        OnPreEvaluateQuery="lstProgramGroupCertificationProgramGrid_PreEvaluateQuery"
    />

</asiweb:PanelTemplateControl2>

<div style="text-align: right; margin: 20px 10px 10px 0px;">
    <asiweb:StyledButton Height="25" ID="btnAddCertificationProgram" runat="server" Text="Add" Width="60" />
</div>


