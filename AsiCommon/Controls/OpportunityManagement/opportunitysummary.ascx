<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunitySummary" Codebehind="OpportunitySummary.ascx.cs" %>

<asiweb:PanelTemplateControl ID="SummaryPanel" runat="server" FieldSet="true" TemplateTitle="Summary Information">
    <asiweb:PanelTemplateColumn ID="SummaryPanelColumn1" runat="server">
        <asiweb:SmartControl id="ProjectID" runat="server" BoundPropertyName="Id" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="Description" runat="server" BoundPropertyName="Description" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="ProcessType" runat="server" BoundPropertyName="OpportunityTypeKey" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="Status" runat="server" BoundPropertyName="OpportunityStatusCode" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="WinProbability" runat="server" BoundPropertyName="WinProbability" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asp:PlaceHolder ID="DynamicControls" runat="server" />
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="SummaryPanelColumn2" runat="server" >       
        <asiweb:SmartControl id="SourceCode" runat="server" BoundPropertyName="SourceCodeKey" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="CurrentStage" runat="server" BoundPropertyName="CurrentActionPlanStageName" DisplayType="ReadONlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="CreatedBy" runat="server" BoundPropertyName="CreatedByUserKey" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="CreatedOn" runat="server" BoundPropertyName="CreatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="UpdatedBy" runat="server" BoundPropertyName="UpdatedByUserKey" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl id="UpdatedOn" runat="server" BoundPropertyName="UpdatedOn" DisplayType="ReadOnlyField" DisplayCaption="true" />
        <asiweb:SmartControl ID="ExpirationDate" runat="server" BoundPropertyName="ExpirationDate" DisplayType="ReadOnlyField" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
<div style="height:5px">&nbsp;</div>
<asiweb:PanelTemplateControl ID="ProspectPanel" runat="server" TemplateTitle="Primary Contact" FieldSet="true" Collapsed="true">
    <div class="PanelField">
        <%--TODO: create Navigation item for Contact edit page and use NavigateNavigationCode--%>
        <asp:LinkButton ID="ProspectName" runat="server"/>
		<asp:label id="companyValue" runat="server"></asp:label>
	    <asp:label id="NoAddressLabel" runat="server" Visible="false" Text="(No Address found)" />
        <asiweb:SmartControl ID="ProspectFullAddress" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="FullAddress" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    </div>
    <asiweb:SmartControl ID="MemberType" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="MemberType" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="ProspectStatus" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="Status" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="WorkPhone" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="WorkPhone" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="HomePhone" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="HomePhone" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="TollFree" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="TollFree" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="Fax" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="Fax" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="EmailAddress" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="Email" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
    <asiweb:SmartControl ID="WebAddress" runat="server" OnNeedBoundAtom="ProspectControl_NeedBoundAtom" BoundPropertyName="Website" DisplayCaption="true" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" />
</asiweb:PanelTemplateControl>  
<div style="height:5px">&nbsp;</div>
<asiweb:PanelTemplateControl ID="RelatedProjectsPanel" runat="server" TemplateTitle="Related Projects" Collapsed="true">
    <asiweb:Lister2 ID="RelatedProjects" runat="server" PageSize="10" 
        LinkTargetBehavior="NewWindowEachLink" LinkTargetWidth="95%" LinkTargetHeight="95%"
        DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/RelatedOpportunityList"
        OnPreEvaluateQuery="RelatedProjects_PreEvaluateQuery"
        TargetUrl="~/iMIS/OpportunityManagement/Opportunity.aspx" />
</asiweb:PanelTemplateControl>
