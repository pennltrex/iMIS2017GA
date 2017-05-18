<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.GroupsList" Codebehind="GroupsList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" OnTabClick="RadTabStrip1SelectedIndexChange">
    <Tabs>
        <telerik:RadTab Text="Contacts" PageViewID="ContactsPage" />
        <telerik:RadTab Text="Owners" PageViewID="OwnersPage" />
        <telerik:RadTab Text="Competitors" PageViewID="CompetitorsPage" />
    </Tabs>
</telerik:RadTabStrip> 

<telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel" runat="server" EnableAJAX="false"
    RenderMode="Block">

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" ScrollBars="Auto"
        CssClass="ContentTabbedDisplay">

        <telerik:RadPageView runat="server" ID="ContactsPage">
            <asp:PlaceHolder ID="ContactsPlaceHolder" runat="server" />    
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="OwnersPage">
            <asp:PlaceHolder ID="OwnersPlaceHolder" runat="server" />    
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="CompetitorsPage">
            <asp:PlaceHolder ID="CompetitorsPlaceHolder" runat="server" />
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</telerik:RadAjaxPanel> 
