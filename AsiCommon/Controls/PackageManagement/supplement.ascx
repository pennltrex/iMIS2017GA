<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.PackageManagement.SupplementUI" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Supplement.ascx.cs" %>
<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/PackageManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="Supplements" TagName="Summary" Src="~/AsiCommon/Controls/PackageManagement/SupplementSummary.ascx" %>
<%@ Register TagPrefix="Supplements" TagName="Definition" Src="~/AsiCommon/Controls/PackageManagement/SupplementDefinition.ascx" %>
<%@ Register TagPrefix="Supplements" TagName="ProcessList" Src="~/AsiCommon/Controls/PackageManagement/ProcessList.ascx" %>

<asiweb:PanelTemplateControl2 runat="server" ID="InsertsPanel" TemplateTitle="Inserts" Collapsible="false" style="margin:auto;">
    
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <div class="CommandBar" style="padding-bottom:0.6em;">
	    <uc2:TaskButtons id="TB1" runat="server" ShowNewButton="true"></uc2:TaskButtons>
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
            <telerik:RadTab Text="Process" PageViewID="ProcessPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
        RenderMode="Block">

        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
            CssClass="ContentTabbedDisplay">

            <telerik:RadPageView runat="server" ID="SummaryPage">
                <Supplements:Summary ID="Summary" runat="server" />
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="DefinitionPage">
                <Supplements:Definition ID="Definition" runat="server" />
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="ProcessPage">
                <Supplements:ProcessList ID="ProcessList" runat="server" />
            </telerik:RadPageView>

        </telerik:RadMultiPage>

    </telerik:RadAjaxPanel> 

    <div style="white-space:nowrap; text-align:right;padding-top:5px; width:100%;">        
        <asiweb:StyledButton ID="btnSave" runat="server" CommandButtonType="Save" /> 
        <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" />       
    </div>

</asiweb:PanelTemplateControl2> 