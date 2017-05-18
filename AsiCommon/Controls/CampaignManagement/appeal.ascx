<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.AppealUI" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Appeal.ascx.cs" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/AppealDefinition.ascx" TagName="AppealDefinition" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/AppealSummary.ascx" TagName="AppealSummary" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/AppealProducts.ascx" TagName="AppealProducts" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
     <asiweb:TitleBar ID="TitleBar" runat="server" DoNotTranslateTitle="True"></asiweb:TitleBar>
    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton runat="server" ID="SaveAsButton" Text="Save As" />
        <asiweb:StyledButton runat="server" ID="GenerateOutput" Text="Generate Output" />
        <asiweb:StyledButton runat="server" ID="NewAppeal" Text="New Appeal" />
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop"   translate ="yes"
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" OnTabClick="Tab_TabClick">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" Value="0" />
            <telerik:RadTab Text="Profile" PageViewID="ProfilePage" Value="1" />
            <telerik:RadTab Text="Products" PageViewID="ProductsPage" Value="2" />
            <telerik:RadTab Text="Solicitations" PageViewID="SolicitationsPage" Value="3" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server"
        CssClass="ContentTabbedDisplay" RenderSelectedPageOnly="true">

        <telerik:RadPageView runat="server" ID="SummaryPage">
            <Campaigns:AppealSummary ID="AppealSummary" runat="server"></Campaigns:AppealSummary>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProfilePage">
            <Campaigns:AppealDefinition runat="server" ID="AppealDefinition" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProductsPage">
            <div style="padding:5px;">
                <Campaigns:AppealProducts runat="server" ID="AppealProducts" />
            </div>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SolicitationsPage">
            <asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl1" Collapsible="false" BorderStyle="None">              
            <asiweb:Lister2 id="SolicitationsGrid" runat="server"
                AjaxEnabled="true"
                DisableQueryEdit="true"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"
                ColumnReorderingEnabled="false"
                DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/SolicitationList"       
                TargetContentCode="CM.Solicitation"
                EnableClientSideDelete="false"
                EditColumnLocation="None"
                SelectColumnLocation="Beginning"
                DeleteColumnLocation="End"                                      
                AddButtonEnabled="true"
                AddLinkTargetBehavior="SameWindow"
                AddButtonLocation="TopRight"
                LinkTargetBehavior="SameWindow"
                AddButtonText="Add a Solicitation"                                       
                AddTargetUrlParameters="iNewObject=Solicitation"
                UseUniformKey="true"            
                translate ="yes"                                                                       
            />
            </asiweb:PanelTemplateControl2>               
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</asiweb:PanelTemplateControl2>