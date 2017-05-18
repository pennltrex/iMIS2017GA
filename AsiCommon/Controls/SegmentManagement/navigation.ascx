<%@ Control Language="C#" ClassName="navigation" %>


<script language="c#" runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            string url = Asi.Web.Utilities.AddQueryString(Asi.Web.Utilities.GetTildeExpansion() + "/AsiNavigator.aspx?iNavMarker={0}");
            if (Request["TemplateType"] != null)
                url += "&TemplateType=" + Request["TemplateType"];
            
            MenuItem jobItem = new MenuItem(
                Asi.ResourceManager.GetWord("Job"), "Job", 
                "~/AsiCommon/Images/18/18_jobs.gif", 
                string.Format(url, "SM.Job"));
            MenuItem segmentsItem = new MenuItem(
                Asi.ResourceManager.GetWord("Segments"), "Segments",
                "~/AsiCommon/Images/18/18_segments.gif",
                string.Format(url, "SM.SegmentList"));
            
            NavMenu.Items.Add(jobItem);
            NavMenu.Items.Add(segmentsItem);

            string pageType = Page.GetType().ToString();
            if (pageType.Contains("job_aspx"))
                jobItem.Selected = true;
            else if (pageType.Contains("segment_aspx") || pageType.Contains("segmentlist_aspx"))
                segmentsItem.Selected = true;
        }
    }
</script>

<asiweb:PanelTemplateControl ID="SegmentNavPanel" runat="server" TemplateTitle="Segmentation">
    <asp:Menu ID="NavMenu" runat="server" SkinID="VerticalMenu"></asp:Menu>
</asiweb:PanelTemplateControl>
<div style="width:100%; text-align:center;">
    <br />
    <img src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/32/32_segmentation.gif" alt='<%# Asi.ResourceManager.GetPhrase("SMPortfolio","Segmentation Portfolio") %>' align="absMiddle" />
</div>
