<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupOpportunityTypeEditor" Codebehind="SetupOpportunityTypeEditor.ascx.cs" %>
<%@ Register TagPrefix="Opportunity" TagName="Definition" Src="~/AsiCommon/Controls/OpportunityManagement/SetupOpportunityTypeDefinition.ascx" %>
<%@ Register TagPrefix="Opportunity" TagName="Documents" Src="~/AsiCommon/Controls/OpportunityManagement/SetupOpportunityTypeDocuments.ascx" %>

<asiweb:AtomPanelParameterList ID="ParameterListCreate" runat="server" Method="Add" SetBefore="false" MissingParams="Default"></asiweb:AtomPanelParameterList>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
    <Tabs>
        <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
        <telerik:RadTab Text="Documents" PageViewID="DocumentsPage" />
    </Tabs>
</telerik:RadTabStrip> 

<telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
    RenderMode="Block">

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay">

        <telerik:RadPageView runat="server" ID="DefinitionPage">
            <Opportunity:Definition ID="Definition" runat="server" UseParentAtomObject="true" />  
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="DocumentsPage">
            <Opportunity:Documents ID="Documents" runat="server" />    
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</telerik:RadAjaxPanel> 