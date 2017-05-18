<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.Setup" Codebehind="Setup.ascx.cs" %>
<%@ Register TagName="SetupGroupList" TagPrefix="Campaigns" Src="~/AsiCommon/Controls/Shared/Groups/SetupGroupList.ascx" %>
<%@ Register TagName="Options" TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/SetupOptions.ascx" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false" 
    BackColor="LightGray" BackgroundPosition="Center" />

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false" Text="Settings" translate ="yes">

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false">
        <Tabs>
            <telerik:RadTab Text="Options" PageViewID="OptionsPage" />
            <telerik:RadTab Text="Security groups" PageViewID="SecurityGroupsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="true"
        RenderMode="Block">

        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
            CssClass="ContentTabbedDisplay">

            <telerik:RadPageView runat="server" ID="OptionsPage">
                <Campaigns:Options runat="server" ID="CampaignOptions" />
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="SecurityGroupsPage">
                <asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl1" Collapsible="false" BorderStyle="None">  
                    <Campaigns:SetupGroupList ID="SetupGroupList" runat="server" SelectFromListerDocumentPath="$/Common/Queries/Search/CsContact" />
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>

        </telerik:RadMultiPage>

    </telerik:RadAjaxPanel> 

</asiweb:PanelTemplateControl2>
