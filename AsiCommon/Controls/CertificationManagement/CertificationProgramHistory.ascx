<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgramHistory" Codebehind="CertificationProgramHistory.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="CertificationProgramHistoryPanel" runat="server" Collapsible="False" ShowHeader="True" TemplateTitle="Certification Programs" BorderStyle="None">
    <asp:HiddenField id="aspHiddenResult" runat="server" />
    <script type="text/javascript">

        // This function is called after clicking the register link in CertificationProgramHistoryLister, so we store CertificationProgramKey in the returnValue 
        // of the confirmation RadWindow and then we can redirect to the CertificationModuleList page.
        function CertificationModuleListCallBackFunction(radWindow) {
            var aspHiddenResult = radWindow.SourceObject;
            if (aspHiddenResult == null)
                aspHiddenResult = document.getElementById('<%# aspHiddenResult.ClientID %>');

            if (radWindow.result && aspHiddenResult != null) {
                aspHiddenResult.value = radWindow.result;
            }
            document.forms[0].submit();
        }

        // This function is called after clicking the register button in the CertificationProgramDetails page, after registering the user this way we should only 
        // refresh the CertificationProgramHistoryLister.
        function CertificationProgramHistoryCallBackFunction(radWindow) {
            var aspHiddenResult = document.getElementById('<%# aspHiddenResult.ClientID %>');
            if (aspHiddenResult != null)
                aspHiddenResult.value = null;
            if (radWindow.result && radWindow.result !== 'CloseButton_Click' && aspHiddenResult != null) {
                aspHiddenResult.value = radWindow.result;
                document.forms[0].submit();
            }
        }

    </script>

    <div class="CommandBar">
	    <asiweb:StyledButton ID="btnPrintTranscript" runat="server" />
	</div>

    <asiweb:Lister2 id="CertificationProgramHistoryLister" runat="server"
        AjaxEnabled="true"
        LinkTargetBehavior="NewWindowEachLink"
        LinkProperty="Name"
        SortingEnabled="true"
        ColumnReorderingEnabled="false"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        Width="100%"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        ExportButtonLocation="none"
        DisableQueryEdit="true"
        SelectColumnLocation="None"
        UseUniformKey="false"
        TargetUrl="~/iMIS/CertificationManagement/CertificationProgramDetails.aspx?TemplateType=D"
        TargetTemplateType="D"
        AddTargetTemplateType="D"
        TargetUrlKeyParameterName="iUniformKey" 
        SelectMode="True"
        SelectMultipleEnabled="false"  
        OnItemDataBound="CertificationProgramHistoryListerItemDataBound" 
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationProgram/CertificationProgramHistoryList"                    
        />
</asiweb:PanelTemplateControl2>    
