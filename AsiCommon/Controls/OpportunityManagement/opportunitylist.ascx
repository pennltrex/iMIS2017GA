<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityList" Codebehind="OpportunityList.ascx.cs" %>

<script type="text/javascript">
    function AddProcess() 
    {
        ShowDialog('~/AsiCommon/Controls/OpportunityManagement/ProcessTypeSelect.aspx', null, 350, 300,
        'Select Process Type', null, 'E', null, null, null, null, ProcessTypeSelected, null);
    }
    function ProcessTypeSelected(dialogWindow) 
    {
        var dialogResult = dialogWindow.result;
        if (dialogResult == null)
            return;

                    
        var projectEditUrl = '~/iMIS/OpportunityManagement/Opportunity.aspx';
        var url = projectEditUrl + '?iNew=true&iOppTypeKey=' + dialogResult;
        
        // Check to see if the hidden input is set with pre-defined Prospect ID
        var prospectId = $('ProspectId');
        if (prospectId != null)
            url += '&iProspectId=' + prospectId.value;

        // Need to clear out the 'close callback function'. When launching a dialog from a 'close callback function',
        // the function array is not cleared.
        dialogWindow.remove_close(ProcessTypeSelected);

        // Use a new window instance (GenericWindow2). RadWindow gets confused if we try to reuse GenericWindow here.
        //ShowDialog(url, args, width, height, title, iconUrl, templateType, callBackFunction, windowName, closeWindowOnCommit, preserveStatefulBusinessContainer, dialogCloseFunction, sourceObject)
        ShowDialog(url, null, '95%', '95%', 'Process Editor', null, 'E', null, "GenericWindow2", false, false, ProjectDialog_Close, $('<%= Processes.ClientID %>'));
    }
    function ProjectDialog_Close(dialogWindow)
    {
        // Need to clear out the 'close callback function'. When launching a dialog from a 'close callback function',
        // the function array is not cleared.
        dialogWindow.remove_close(ProjectDialog_Close);
        window.location.href = window.location.href;
    }

    addAjaxLoadEvent(CheckCustomerPortfolio);
    function CheckCustomerPortfolio()
    {
        
        var processId = $('CPProcessId');
        var processTypeField = $('ProcessType');
        var parameter;
        if (processId != null && processId.value.length > 0)
        {
            // open an opportunity from customer portfolio
            parameter = 'iUniformKey=' + processId.value;
            OpenOpportunity(parameter);
        }
        else if (processTypeField != null && processTypeField.value.length > 0)
        {
            // create an opportunity from customer portfolio
            parameter = 'iOppTypeKey=' + processTypeField.value;
            OpenOpportunity(parameter);
        }
    }
    function OpenOpportunity(parameter)
    {
        var url = '~/iMIS/OpportunityManagement/Opportunity.aspx?';
        url += parameter;

        // Check to see if the hidden input is set with pre-defined Prospect ID
        var prospectId = $('ProspectId');
        if (prospectId != null)
            url += '&iProspectId=' + prospectId.value;
        ShowDialog(url, null, '95%', '95%', 'Process Editor', null, 'E', null, 'GenericWindow2', false, false, ProjectDialog_Close, $('<%= Processes.ClientID %>'));
    }
</script>

<div id="ProjectsDiv">
    <asiweb:Lister2 id="Processes" runat="server" PageSize="20"
        DisableQueryEdit="true"
        RefreshButtonLocation="TopRight"
        AjaxEnabled="true"
        DeleteColumnLocation="None" 
        DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/OpportunityList"
        TargetUrl="~/iMIS/OpportunityManagement/Opportunity.aspx" 
        LinkTargetBehavior="NewWindowAllShare"
        LinkTargetHeight="95%" 
        LinkTargetWidth="95%"
        TargetUrlParameters="ContentCode=OM.Opportunity&CloseWindowOnCommit=false"
        AddTargetClientScript="AddProcess()" 
        AddButtonLocation="TopRight" 
        AddButtonText="Create New Project"
        AddLinkTargetBehavior="NewWindowEachLink"
        OnItemDeleted="Processes_ItemDeleted"
        UseUniformKey="true"
        EnableClientSideDelete="false"
        SelectMode="true"
        SelectMultipleEnabled="true"
        SelectColumnLocation="End"
        LinkProperty="Description"
        ExportButtonLocation="TopRight" 
        TargetPreserveStatefulBusinessContainer = "true"
        AllowNaturalSort="false"
        />
    <div style="text-align:right; width:100%;">
        <asp:Button ID="DeleteAllSelectedButton" runat="server" Text="delete selected" 
            OnClientClick="return confirm('Are you sure you want to delete all selected items?');" 
            OnClick="DeleteAllSelectedButton_Click" />
    </div>
</div>
