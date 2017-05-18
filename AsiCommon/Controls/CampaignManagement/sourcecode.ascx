<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/SourceCodeProfile.ascx" TagName="Profile" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/sourcecodesummary.ascx" TagName="Summary" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/SourceCodeInserts.ascx" TagName="Inserts" %>
<%@ Register TagPrefix="Campaigns" Src="~/AsiCommon/Controls/CampaignManagement/SourceCodeSourceList.ascx" TagName="SourceList" %>
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.SourceCode1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SourceCode.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false"  translate="yes" >

    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton runat="server" ID="SaveAs" Text="Save As" />
        <asiweb:StyledButton runat="server" ID="NewInsert" AutoPostBack="false" Text="New Insert" OnClientClick="CMOpenDialog('PM.Supplement',false,800,600,'iNewObject=Supplement&iChildWorkSpaceID=' + Math.random()*10,null,null,null,'New Insert');" />
        <asiweb:StyledButton runat="server" ID="GenerateOutput" Text="Generate Output" />
        <asiweb:StyledButton runat="server" ID="NewSourceCode" Text="New Source Code" />
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" OnTabClick="Tab_TabClick">
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" Value="0" />
            <telerik:RadTab Text="Profile" PageViewID="ProfilePage" Value="1" />
            <telerik:RadTab Text="Inserts" PageViewID="InsertsPage" Value="2" />
            <telerik:RadTab Text="Source Lists" PageViewID="SourceListsPage" Value="3" />
        </Tabs>
    </telerik:RadTabStrip> 
    
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px" RenderSelectedPageOnly="true">

        <telerik:RadPageView runat="server" ID="SummaryPage">
            <Campaigns:Summary runat="server" ID="SourceCodeSummary" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ProfilePage">
            <Campaigns:Profile runat="server" ID="SourceCodeProfile" />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="InsertsPage">
            <div style="padding:5px;">
                <Campaigns:Inserts runat="server" ID="SourceCodeInserts" />
            </div>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SourceListsPage">
            <div style="padding:5px;">             
                <Campaigns:SourceList runat="server" ID="SourceCodeSourceList" /> 
            </div>             
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</asiweb:PanelTemplateControl2>
