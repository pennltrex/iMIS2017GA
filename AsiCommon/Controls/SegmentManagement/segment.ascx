<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentDefinitions" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Segment.ascx.cs" %>

<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/SegmentManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="Segment" TagName="Definition" Src="~/AsiCommon/Controls/SegmentManagement/SegmentDefinition.ascx" %>
<%@ Register TagPrefix="Segment" TagName="Results" Src="~/AsiCommon/Controls/SegmentManagement/SegmentResults.ascx" %>

<asiweb:PanelTemplateControl2 runat="server" Collapsible="false">
    <asiweb:TitleBar ID="TitleBar" runat="server" DoNotTranslateTitle="True"></asiweb:TitleBar>
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <div class="CommandBar" style="padding-bottom:0.6em;">
        <uc2:taskbuttons id="TB1" runat="server" ButtonPortfolioType="Job"></uc2:taskbuttons>
        <asiweb:StyledButton ID="btnDuplicateSeg" runat="server" />
	</div>
    	
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true">
        <Tabs>
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Results" PageViewID="ResultsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
        RenderMode="Block">

        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
            CssClass="ContentTabbedDisplay">

            <telerik:RadPageView runat="server" ID="DefinitionPage">
                <ContentTemplate>
                    <Segment:Definition ID="Definition" runat="server" />
                </ContentTemplate>   
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="ResultsPage">
                <ContentTemplate>
                    <Segment:Results ID="Results" runat="server" />
                </ContentTemplate>    
            </telerik:RadPageView>

        </telerik:RadMultiPage>

    </telerik:RadAjaxPanel> 
	 
    <div style="width: 100%; text-align: right; padding-top: 5px; white-space: nowrap;">
        <asiweb:StyledButton ID="btnSave" runat="server" CommandButtonType="Save" />
        <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" />
    </div>
    
</asiweb:PanelTemplateControl2>