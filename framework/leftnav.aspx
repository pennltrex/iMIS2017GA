<%@ Page Language="c#" AutoEventWireup="false" MasterPageFile="~/framework/framework.master" Title="Medina Left Nav" %>
<%@ Register TagPrefix="asi" TagName="PageSubNav" Src="~/AsiCommon/Controls/Navigation/PageSubNav.ascx" %>

<script language="C#" runat="server">

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        // Set sub nav menu panel title
        SiteMapNode startingNode = Secondary.GetStartingNode();
        if (startingNode != null)
            SubNavPanelTitle.Text = startingNode.Title;
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Secondary.NavItemDataBound += Secondary_NavItemDataBound;
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (Request.Unvalidated["SimClick"] != null)
        {
            Secondary.SelectDefaultNode = false;
            string script;
            if (Request.Unvalidated["Description"] == null)
                script = "SimClick('" + Request.Unvalidated["SimClick"] + "', '');";
            else // The SetCurrentNode function redirect sets the Description (a.k.a. Task/Breadcrumb).
                script = "SimClick('" + Request.Unvalidated["SimClick"] + "', '" + Request.Unvalidated["Description"] + "');";
            
            if (!Page.ClientScript.IsStartupScriptRegistered(GetType(), "SimClick"))
                Page.ClientScript.RegisterStartupScript(GetType(), "SimClick", script, true);
        }
    }

    int nodeCounter = 0;
    int childStartIndex = 0;
    int currentDepth = 0;
    private void Secondary_NavItemDataBound(object sender, TreeNodeEventArgs e)
    {
        SiteMapNode node = (SiteMapNode)e.Node.DataItem;

        // NOTE: all this hacking only works for one level deep, anything deeper and this will fail.
        if (e.Node.Depth != currentDepth)
        {
            currentDepth = e.Node.Depth;
            nodeCounter = childStartIndex;
        }

        if (node["id"] != null)
        {
            Page.ClientScript.RegisterHiddenField(node["id"], Secondary.NavControlClientID + "t" + nodeCounter);
        }

        if (node.ChildNodes.Count > 0)
        {
            childStartIndex = nodeCounter + 1;
            nodeCounter += e.Node.ChildNodes.Count;
        }
        nodeCounter++;
    }


</script>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="TemplateHead">
    <style type="text/css">
        body, form
        {
            width: 157px !important;
            padding: 0 !important;
        }
        .yui-t7
        {
            margin-left: 5px !important;
            margin-right: 1px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <div id="SideBarPanel" class="SideBarPanel" style="height:100%;">
        <asp:Panel ID="SubNavPanel" runat="server" CssClass="SubNavPanel">
            <div id="subNavBarHead" class="SubNavPanelHead" runat="server"><asp:Literal ID="SubNavPanelTitle" runat="server" /></div>
            <div id="subNavBarBody" runat="server" class="SubNavPanelBody">
                <asi:PageSubNav ID="Secondary" runat="server" NavigationPaneCode="2"
                    NodeClientClick="nodeClick" Target="imismain" SelectDefaultNode="true"
                    StartFromCurrentNode="true" StartingNodeOffset="0" />
            </div>
        </asp:Panel>
        <%--<asp:Panel ID="SubNavPanelDivider" runat="server" CssClass="SubNavPanelDivider SplitBar NotPrinted" onclick="ResizeWidthForFireFox();"
            ToolTip="Collapse/expand navigation">
            <asp:Image ID="SubNavPanelCollapseImage" runat="server" SkinID="SplitBarCollapseHorizontal" ImageUrl="~/AsiCommon/Images/1.gif" style="vertical-align:middle;" />
        </asp:Panel>--%>
    </div>
    <%--<table style="height:100%; width:154px; margin-left:2px;" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td id="pagesubnav">
                <div style="width:100%; height:100%; overflow:auto;">
                    <asiweb:PanelTemplateControl ID="LeftNavPanel" runat="server" Collapsible="false">
                        <div id="pagesubnavbody">
                            <asi:leftnav ID="LeftNavControl" runat="server" NavigationPaneCode="2"
                                NodeClientClick="nodeClick" Target="imismain" SelectDefaultNode="true" 
                                StartFromCurrentNode="true" StartingNodeOffset="0" />
                        </div>
                    </asiweb:PanelTemplateControl>
                </div>
            </td>
        </tr>
    </table>--%>
    
    <script type="text/javascript">
        var selectedNode = null;
        function nodeClick()
        {
            var anchor = window.event.srcElement;
            if (anchor != null)
                return nodeClick2(anchor);
            return true;
        }
        function nodeClick2(anchor, resetMainPage)
        {
            if (!CheckNavState())
            {
                if (window.event)
                    window.event.returnValue = false;
                return false;
            }

            // Don't select the node if it's just a script execution
            if (anchor.href.indexOf("javascript:") > -1)
            {
                return true;
            }
        
            // Set active link
            document.all('ActiveLink').value = anchor.id;
        
            if (resetMainPage == null)
                resetMainPage = true;
            var resetMainPageQueryStringValue = FindURLParameter('ResetMainPage');
            if (resetMainPageQueryStringValue != null)
                resetMainPage = resetMainPageQueryStringValue == '1';
            SetTask(anchor.innerText, resetMainPage);
            
            // Deselect previous selected node
            if (selectedNode != null)
                selectedNode.className = selectedNode.className.replace('<%= Secondary.SelectedNodeStyleCssClass %>', '<%= Secondary.NodeStyleCssClass %>');
            else
            {
                // selectNode will be null as a result of the SetCurrentNode function redirect.
                // Since the selectedNode variable isn't set we need to search all potential tags for the Css class that desginates a selected item.
                DeselectNodes('a');
                DeselectNodes('td');
            }
        
            // Change new selected node's class to the selected class name
            selectedNode = getParent(anchor);
            selectedNode.className = selectedNode.className.replace('<%= Secondary.NodeStyleCssClass %>', '<%= Secondary.SelectedNodeStyleCssClass %>');
    
            return true;
        }
        function DeselectNodes(tagName) 
        {
            var selectedNodes = document.getElementsByTagName(tagName);
            for (var i = 0; i <= selectedNodes.length; i++)
            {
                if (selectedNodes[i] && selectedNodes[i] != 'undefined')
                {
                    var cssClassAttrubite = "class";
                    var cssClassValue = selectedNodes[i].getAttribute(cssClassAttrubite);
                    if (cssClassValue == null)
                    {
                        // IE uses 'className' instead of 'class'
                        cssClassAttrubite = "className";
                        cssClassValue = selectedNodes[i].getAttribute(cssClassAttrubite);
                    }
                    if (cssClassValue != null)
                    {
                        if (cssClassValue.indexOf('<%= Secondary.SelectedNodeStyleCssClass %>') >= 0 && selectedNodes[i].id && selectedNodes[i].id != '')
                        {
                            selectedNodes[i].setAttribute(cssClassAttrubite, cssClassValue.replace('<%= Secondary.NodeStyleCssClass %>', ''));
                        }
                        selectedNodes[i].setAttribute(cssClassAttrubite, cssClassValue.replace('<%= Secondary.SelectedNodeStyleCssClass %>', '<%= Secondary.NodeStyleCssClass %>'));
                    }
                }
            }
        }
        
        // This function was (originally) put in for the QuickLinks iPart, which replaced the 
        // BigButtonPanel iPart for the primary navigation landing pages.
        function SetCurrentNode(startingNodeKey, nodeId, description)
        {
            // Set active link
            document.all('ActiveLink').value = nodeId;
            window.location.href = gWebRoot + '/framework/leftnav.aspx?StartingNodeKey=' + startingNodeKey + '&CurrentNodeKey=' + nodeId + '&SimClick=' + nodeId + '&Description=' + description;
        }
        function SimClick(nodeId, description)
        {
            var linkHiddenField = document.getElementById(nodeId);
            if (linkHiddenField == null || document.getElementById(linkHiddenField.value) == null)
            {
                // linkHiddenField (or its value) will be null as a result of the SetCurrentNode function.
                if (description != '')
                    SetTask(description, false);
            }
            else
            {
                var linkId = linkHiddenField.value;
                var link = document.getElementById(linkId);
                nodeClick2(link, false);
            }
        }

        function shortcut()
        {
            return true;
        }
    </script>

</asp:Content>
