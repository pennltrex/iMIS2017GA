<%@ Control AutoEventWireup="false" Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.GenerateSourceCode.DisplaySourceCodeOptions" Codebehind="DisplaySourceCodeOptions.ascx.cs" %>
<%@ Register TagPrefix="CreateSourceCodes" TagName="FromSolicitation" Src="~/AsiCommon/Controls/CampaignManagement/GenerateSourceCode/FromSolicitation.ascx" %>
<%@ Register TagPrefix="CreateSourceCodes" TagName="FromSegments" Src="~/AsiCommon/Controls/CampaignManagement/GenerateSourceCode/FromSegments.ascx" %>

<asiweb:ParameterList ID="ParameterList1" runat="server">
    <asiweb:Parameter name="SolicitationKey" Type="CurrentContext" Value="SubjectUniformKey" operation="Equal" id="AtomPanel_ParameterList_1_Parameter_0" runat="server" />
</asiweb:ParameterList>    

<asiweb:PanelTemplateControl runat="Server" ID="MainPanel" Collapsible="false">

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
        <Tabs>
            <telerik:RadTab Text="Copy from Solicitations" PageViewID="FromSolicitationsPage" />
            <telerik:RadTab Text="Create from Segments" PageViewID="FromSegmentsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
        RenderMode="Block">

        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
            CssClass="ContentTabbedDisplay" Style="margin-top:-1px">

            <telerik:RadPageView runat="server" ID="FromSolicitationsPage">
            <ContentTemplate>
                <CreateSourceCodes:FromSolicitation ID="FromSolicitation" runat="server" />
            </ContentTemplate>   
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="FromSegmentsPage">
            <ContentTemplate>
                <CreateSourceCodes:FromSegments ID="FromSegments" runat="server" />
            </ContentTemplate>    
            </telerik:RadPageView>

        </telerik:RadMultiPage>

    </telerik:RadAjaxPanel> 

</asiweb:PanelTemplateControl>