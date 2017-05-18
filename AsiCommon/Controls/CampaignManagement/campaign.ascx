<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.CampaignUI" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Campaign.ascx.cs" %>
<%@ Register Src="campaigndefinition.ascx" TagName="campaigndefinition" TagPrefix="Campaigns" %>
<%@ Register Src="CampaignSummary.ascx" TagName="CampaignSummary" TagPrefix="Campaigns" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/Security/ManageSecurity.ascx" TagName="SecurityControl" TagPrefix="Campaigns" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false" DoNotTranslateTitle="True">

    <asiweb:TitleBar ID="TitleBar" runat="server" DoNotTranslateTitle="True"></asiweb:TitleBar>
    <div class="CommandBar" style="padding-bottom:0.6em;" translate="yes">
        <asiWeb:StyledButton ID="SaveAsButton" runat="server" Text="Save As" />
        <asiweb:StyledButton ID="GenerateOutputButton" runat="server" Text="Generate Output" />
        <asiweb:StyledButton ID="NewCampaign" runat="server" Text="New Campaign" />
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" translate="yes"
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" OnTabClick="Tab_TabClick">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" Value="0" />
            <telerik:RadTab Text="Profile" PageViewID="ProfilePage" Value="1" />
            <telerik:RadTab Text="Appeals" PageViewID="AppealsPage" Value="2" />
            <telerik:RadTab Text="Security" PageViewID="SecurityPage" Value="3" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="1"
        CssClass="ContentTabbedDisplay" RenderSelectedPageOnly="true">

        <telerik:RadPageView runat="server" ID="SummaryPage">
            <Campaigns:CampaignSummary ID="CampaignSummary" runat="server"/>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProfilePage">
            <Campaigns:campaigndefinition ID="Campaigndefinition" runat="server"/>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="AppealsPage">
            <asiweb:Lister2 id="AppealsGrid" runat="server" 
                DisableQueryEdit = "true"
                AjaxEnabled="true"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"
                ColumnReorderingEnabled="false"
                DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/AppealList"       
                TargetContentCode="CM.Appeal"
                EnableClientSideDelete="false"
                EditColumnLocation="None"
                SelectColumnLocation="Beginning"
                DeleteColumnLocation="End"                                      
                AddButtonEnabled="true"
                AddLinkTargetBehavior="SameWindow"
                AddButtonLocation="TopRight"
                LinkTargetBehavior="SameWindow"
                AddButtonText="Add an Appeal"                                       
                AddTargetUrlParameters="iNewObject=Appeal"
                UseUniformKey="true"      
                translate="yes"                                       
            /> 
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SecurityPage">
            <div style="padding:5px;">             
                <Campaigns:SecurityControl runat="server" ID="SecurityControl" />
            </div>             
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</asiweb:PanelTemplateControl2>