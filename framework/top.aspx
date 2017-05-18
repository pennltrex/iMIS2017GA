<%@ Page Language="c#" AutoEventWireup="false" MasterPageFile="~/framework/framework.master" Title="Top" %>
<%@ Register TagPrefix="asi" TagName="topnav" Src="~/AsiCommon/Controls/Navigation/PageNav.ascx" %>

<script language="C#" runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (HttpContext.Current.Session["WebsiteName"] != null)
        {
            string websiteName = HttpContext.Current.Session["WebsiteName"].ToString();
            if (!string.IsNullOrEmpty(websiteName))
            {
                // I wanted to use FindWebsiteByURL and pass through gstrWebServerURL from desktop, but it didn't work for some reason.
                // Desktop picks off the last segment of the URL and sends it through as websiteName in the url to login.aspx, which then puts it in Session.
                Asi.Business.ContentManagement.Website wstest = Asi.Business.ContentManagement.Website.FindWebsiteByName(websiteName);

                TopNavControl.CurrentNodeKey = Asi.Business.ContentManagement.Website.GetFromWebsiteKey(wstest.WebsiteKey,
                    Asi.AppContext.CurrentContext.StatelessBusinessContainer).HomePageHierarchyKey.ToString();
            }
        }
      
        TopNavControl.MenuItemDataBound += new MenuEventHandler(this.TopNavControl_MenuItemDataBound);
    }

    int nodeCounter = 0;
    private void TopNavControl_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        SiteMapNode node = (SiteMapNode)e.Item.DataItem;
        
        string url = Asi.Web.Utilities.GetTildeExpansion() + "/framework/leftnav.aspx?CurrentNodeKey=" + node.Key;
                
        if (node["collapsed"] != null)
            url += "&Collapsed=" + node["collapsed"];
        
        e.Item.NavigateUrl = url;

        if (node["id"] != null)
        {
            string parentCellId = TopNavControl.NavControlClientID + "n" + nodeCounter;
            Page.ClientScript.RegisterHiddenField(node["id"], parentCellId);
        }
        nodeCounter++;
    }
</script>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="TemplateHead">
    <style type="text/css">
        body, form
        {
            margin: 0 !important;
            padding: 0 !important;
        }
        .yui-t7
        {
            margin: 0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <div id="pagenav">
        <asi:topnav  SiteMapProvider="AsiSiteMapProvider" ID="TopNavControl" runat="server" 
            NavMenuSkinID="HorizontalTabs" NodeClientClick="nodeClick" Target="leftnav" MaximumDynamicDisplayLevels="0" 
            StartFromCurrentNode="true" SelectDefaultNode="true" StartingNodeOffset="-1" ShowScrollButtons="true" PreserveScrollPosition="false" />
    </div>
    <script type="text/javascript">

    // defined in NavigationList.cs
    //var selectedNode = null;
    function nodeClick()
    {
        return nodeClick2(window.event.srcElement);
    }
    function nodeClick2(anchor)
    {
//        if (linkSelected)
//        {
//            clickLink();
//        }


        if (!CheckNavState())
        {
            if (window.event)
                window.event.returnValue = false;
            return false;
        }
        
        // Set active link
        document.all('ActiveLink').value = anchor.id;

        // Deselect previous selected node
        if (NavigationList_SelectedNode != null)
        {
            var selectedClassName = '<%= TopNavControl.SelectedNodeStyleCssClass %>';
            var staticClassName = '<%= TopNavControl.NodeStyleCssClass %>';

            while (NavigationList_SelectedNode.className.indexOf(selectedClassName) > -1)
                NavigationList_SelectedNode.className = NavigationList_SelectedNode.className.replace(selectedClassName, staticClassName);
        }
        
        // Change new selected node's class to the selected class name
        NavigationList_SelectedNode = getParent(getParent(getParent(getParent(anchor))));
        NavigationList_SelectedNode.className = NavigationList_SelectedNode.className.replace('<%= TopNavControl.NodeStyleCssClass %>', '<%= TopNavControl.SelectedNodeStyleCssClass %>');

        return true;
    }
    function SimClick(nodeId, leftNodeId)
    {
        if (document.getElementById(nodeId) == null || document.getElementById(document.getElementById(nodeId).value) == null)
            alert("Could not simulate click on link ID: " + nodeId);
        else
        {
            var node = document.getElementById(document.getElementById(nodeId).value);
            var link = node.firstChild.firstChild.firstChild.firstChild.firstChild;
            var differentNode = getParent(NavigationList_SelectedNode) != node;

            if (leftNodeId != null)
            {
                var prevHref = link.href;
                link.href += "&SimClick=" + leftNodeId;
                link.click();
                link.href = prevHref;
            }
            else
            {
                nodeClick2(link);
            }

            if (differentNode)
                ensureVisible(link);
        }
        
        //if (leftNodeId != null)
        //    parent.leftnav.SimClick(leftNodeId);
    }
    </script>
</asp:Content>
