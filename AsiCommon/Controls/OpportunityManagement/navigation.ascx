<%@ Control Language="C#" ClassName="navigation" %>

<script language="c#" runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        // Set up the left navigation
        if (!Page.IsPostBack)
        {
            string url =
                Asi.Web.Utilities.AddQueryString(Asi.Web.Utilities.GetTildeExpansion() +
                                                 "/AsiNavigator.aspx?iNavMarker={0}&SelectedTab={1}");

            theRadTabStrip.Tabs[0].NavigateUrl = string.Format(url, "OM.Opportunity", "0");
            theRadTabStrip.Tabs[1].NavigateUrl = string.Format(url, "OM.GroupsList", "1");
            theRadTabStrip.Tabs[2].NavigateUrl = string.Format(url, "OM.TaskList", "2");
            theRadTabStrip.Tabs[3].NavigateUrl = string.Format(url, "OM.Documents", "3");
            theRadTabStrip.Tabs[4].NavigateUrl = string.Format(url, "OM.ActivityList", "4");
            theRadTabStrip.Tabs[5].NavigateUrl = string.Format(url, "OM.HistoryList", "5");
        }

        // Highlight the selected tab
        theRadTabStrip.SelectedIndex = !string.IsNullOrEmpty(Request.QueryString["SelectedTab"]) ? Convert.ToInt32(Request.QueryString["SelectedTab"]) : 0;
             
    }  
</script>

<telerik:RadTabStrip runat="server" ID="theRadTabStrip" Orientation="VerticalLeft" 
    SelectedIndex="0" style="float:left;padding-top:3px;" width="100%" 
    ShowBaseLine="true" AutoPostBack="true" >
    <Tabs>
        <telerik:RadTab Text="Project" />
        <telerik:RadTab Text="Groups" />
        <telerik:RadTab Text="Tasks" />
        <telerik:RadTab Text="Documents" />
        <telerik:RadTab Text="Activities" />
        <telerik:RadTab Text="History" />
    </Tabs>
</telerik:RadTabStrip>