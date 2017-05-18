<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.Setup" Codebehind="Setup.ascx.cs" %>
<%@ Register TagPrefix="Opportunities" TagName="Types" Src="~/AsiCommon/Controls/OpportunityManagement/SetupOpportunityTypes.ascx"%>
<%@ Register TagPrefix="Opportunities" TagName="ActionPlans" Src="~/AsiCommon/Controls/OpportunityManagement/SetupActionPlans.ascx"%>
<%@ Register TagPrefix="Opportunities" TagName="Security" Src="~/AsiCommon/Controls/Shared/Groups/SetupGroupList.ascx"%>
<%@ Register TagPrefix="Opportunities" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<script type="text/javascript">
    function HideErrorMessages() {
        var templateUserMessagesID = document.getElementById('TemplateUserMessagesID').value;
        var errorElement = document.getElementById(templateUserMessagesID);
        if (errorElement != null) {
            errorElement.style.display = "none";
        }
    }

    function RefreshAndClear() {
        HideErrorMessages();
        objectBrowserClass.RefreshNode();
    }
</script>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" OnClientTabSelected="HideErrorMessages">
    <Tabs>
        <telerik:RadTab Text="Process Types" PageViewID="ProcessTypesPage" />
        <telerik:RadTab Text="Action Plans" PageViewID="ActionPlansPage" />
        <telerik:RadTab Text="Security Groups" PageViewID="SecurityGroupsPage" />
        <telerik:RadTab Text="Project Process Outputs" PageViewID="ProjectProcessOutputsPage" />
    </Tabs>
</telerik:RadTabStrip> 

<telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
    RenderMode="Block">

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px;padding:5px;">

        <telerik:RadPageView runat="server" ID="ProcessTypesPage">
            <Opportunities:Types runat="server" ID="Types" />    
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ActionPlansPage">
            <Opportunities:ActionPlans runat="server" ID="ActionPlans" />    
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SecurityGroupsPage">
            <Opportunities:Security runat="server" ID="SetupGroupList" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProjectProcessOutputsPage">
                
            <Opportunities:ObjectBrowser runat="server" ID="PEList" Height="400" Width="100%"
                TypeFilter="FOL,OPP,IQD"
                DocumentPath="$/Common/Shared Documents/Processes"
                ShowHierarchyTree="false"
                ShowSummary="false"
                ShowContainers="true"
                ShowFilename="false"
                DoubleClickAction="Edit"
                AllowMultiSelect="false"
                AllowUpwardNavigation="false"
            />
                     
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</telerik:RadAjaxPanel> 
