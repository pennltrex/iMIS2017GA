<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityUI" Codebehind="Opportunity.ascx.cs" %>
<%@ Register TagPrefix="asiproc" TagName="SummaryControl" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunitySummary.ascx" %>
<%@ Register TagPrefix="asiproc" TagName="DefinitionControl" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityDefinition.ascx" %>
<%@ Register TagPrefix="asiproc" TagName="ActionPlanControl" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityActionPlan.ascx" %>
<%@ Register TagPrefix="asiproc" TagName="SecurityControl" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
    <Tabs>
        <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
        <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
        <telerik:RadTab Text="Action Plan" PageViewID="ActionPlanPage" />
        <telerik:RadTab Text="Security" PageViewID="SecurityPage" />
    </Tabs>
</telerik:RadTabStrip> 

<telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
    RenderMode="Block">

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px;padding:5px;">

        <telerik:RadPageView runat="server" ID="SummaryTab">  
            <asiproc:SummaryControl ID="Summary" runat="server" UseParentAtomObject="true" /> 
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="DefinitionTab">
            <asiproc:DefinitionControl id="Definition" runat="server" UseParentAtomObject="true" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ActionPlanTab">
            <asiproc:ActionPlanControl ID="ActionPlanControl" runat="server" UseParentAtomObject="true" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SecurityTab">
            <asiproc:SecurityControl ID="Security" runat="server" UseParentAtomObject="true" CollapsePanelSetting="false"
            GroupSourcePath="$/OpportunityManagement/DefaultSystem/Queries/SecurityAdministration/GroupAdministration/OpportunitySecurityGroups" 
            UserSourcePath="$/OpportunityManagement/DefaultSystem/Queries/SecurityAdministration/UserAdministration" />  
        </telerik:RadPageView>
           
    </telerik:RadMultiPage>

</telerik:RadAjaxPanel> 