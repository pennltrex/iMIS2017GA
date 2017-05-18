<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.SolicitationUI" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Solicitation.ascx.cs" %>
<%@ Register TagName="SolicitationProfile" TagPrefix="asiweb" Src="~/AsiCommon/Controls/CampaignManagement/SolicitationPRofile.ascx" %>
<%@ Register TagName="SolicitationSummary" TagPrefix="asiweb" Src="~/AsiCommon/Controls/CampaignManagement/SolicitationSummary.ascx" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
   <asiweb:TitleBar ID="TitleBar" runat="server" DoNotTranslateTitle="True"></asiweb:TitleBar>
    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton runat="server" ID="SaveAsButton" Text="Save As" />
        <asiweb:StyledButton runat="server" ID="GenerateOutput" Text="Generate Output" />
        <asiweb:StyledButton runat="server" ID="SourceCodeFromList" Text="Create Source Codes From List" />
        <asiweb:StyledButton runat="server" ID="NewSolicitation" Text="New Solicitation" />
    </div>
 
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop"  translate="yes"
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" OnTabClick="Tab_TabClick">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" Value="0" />
            <telerik:RadTab Text="Profile" PageViewID="ProfilePage" Value="1" />
            <telerik:RadTab Text="Source Codes" PageViewID="SourceCodesPage" Value="2" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px" RenderSelectedPageOnly="True">

        <telerik:RadPageView runat="server" ID="SummaryPage">
            <asiweb:SolicitationSummary runat="server" ID="SolicitationSummary" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProfilePage">
            <asiweb:SolicitationProfile runat="server" ID="SolicitationProfile" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SourceCodesPage">
            <asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl1" Collapsible="false" BorderStyle="None">  
            <asiweb:Lister2 id="SourceCodesGrid" runat="server"
                AjaxEnabled="true"
                DisableQueryEdit="true"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"
                ColumnReorderingEnabled="false"
                DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/SourceCodeList"       
                TargetContentCode="CM.SourceCode"
                EnableClientSideDelete="false"
                EditColumnLocation="None"
                SelectColumnLocation="Beginning"
                DeleteColumnLocation="End"                                      
                AddButtonEnabled="true"
                AddLinkTargetBehavior="SameWindow"
                AddButtonLocation="TopRight"
                LinkTargetBehavior="SameWindow"
                AddButtonText="Add a Source Code"                                       
                AddTargetUrlParameters="iNewObject=SourceCode"
                UseUniformKey="true"       
                translate ="yes"                                                                            
            /> 
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</asiweb:PanelTemplateControl2>
