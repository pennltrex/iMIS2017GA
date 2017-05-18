<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.BusinessTree" Codebehind="BusinessTree.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" TagPrefix="radM" Namespace="Telerik.Web.UI" %>

<script type="text/javascript">
    function Menu_Clicked(sender, EventArgs)
    {   
        // We don't want the clicked item to remain selected.
        EventArgs.get_item().blur();
          
        if (EventArgs != null && EventArgs._item != null && EventArgs._item._element.innerText == "Delete")
        {
            var tree = $find("<%=ItemTree.ClientID %>");
            // Can't delete root node
            if (tree.get_selectedNode().get_value() == tree.get_nodes().getNode(0).get_value())
            {
                alert('<%= MessageCannotDeleteRoot %>');
                return false;
            }
            EventArgs.set_cancel(!confirm(String.format('<%= MessageConfirmDeleteTag %>', tree.get_selectedNode().get_text())));
        }
    }
    
    // This method may be called from parent controls.
    function BusinessTreeGetSelectedItems()
    {
        var tree = $find("<%=ItemTree.ClientID %>");
        var i;
        var tagGuids = "";
        var allNodesLen = tree.get_allNodes().length;
        var nodes = tree.get_allNodes();
        // Iterate through all nodes in the tree, build a list of checked nodes.
        // (Starting at one so we don't include the root node.)
        for(i=1; i<allNodesLen; i++)
        {
            if (nodes[i].get_checked())
                tagGuids = tagGuids + "," + nodes[i].get_attributes().getAttribute("ObjectKey");
        }
        return tagGuids;
    }
    
    function ReturnSelectedItems()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        var tree = $find("<%=ItemTree.ClientID %>");
        var i;
        var tagGuids = "";
        var tagNames = "";
        // Iterate through all nodes in the tree, build a list of checked nodes.
        // (Starting at one so we don't include the root node.)
        var allNodesLen = tree.get_allNodes().length;
        var nodes = tree.get_allNodes();
        for(i=1; i<allNodesLen; i++)
        {
            if (nodes[i].get_checked())
            {
                tagGuids = tagGuids + "," + nodes[i].get_attributes().getAttribute("ObjectKey");
                tagNames = tagNames + "<li class=\"Tag\">" + nodes[i].get_text() + "</li>";
            }
        }
        oWindow.TagNames = tagNames;
        oWindow.result = tagGuids;
        oWindow.Close();
    }
    
// The following functions would be used to disable descendant nodes when
// dragging a node. The new version of RadTreeView appears to not fire the
// node drop events when dropping on a descendant, so we can't use these because
// we can't re-enable the disabled nodes if the user drops onto a descendant.
// For now, the RadTreeView just ignores the case of a user dropping onto a
// descendant. If this gets fixed, then uncomment these functions, wire the
// drop methods in the RadTreeView markup below, and test.

//    function TreeViewBeforeClick(sender, eventArgs)
//    {
//        var node = eventArgs.get_node();
//        SafelyToggleEnabled(node, true);
//    }
//    
//    function TreeViewDropping(sender, eventArgs)
//    {
//        alert('In TreeViewDropping');
//        var node = eventArgs.get_sourceNode();
//        SafelyToggleEnabled(node, true);
//        debugger;
//        var sourceNode = eventArgs.get_sourceNode();
//        var destNode = eventArgs.get_destNode();
//        if (NodeIsDescendant(destNode, sourceNode))
//        {
//            alert("You cannot drag a node to its descendant.");
//            eventArgs.set_cancel(true);
//        }
//    }
//    
//    function TreeViewDrag(sender, eventArgs)
//    {
//        var node = eventArgs.get_node();
//        SafelyToggleEnabled(node, false);
//    }
//   
//    // Don't allow a node to be dragged to any of it's descendents
//    function SafelyToggleEnabled(parentNode, enable)
//    {
//        if (enable) {
//            // Must restore original status, if it was stored
//            if (parentNode.SafelyToggleEnabled_OriginalStatus == 'Enabled') {
//                parentNode.enable();
//            } else if (parentNode.SafelyToggleEnabled_OriginalStatus == 'Disabled') {
//                parentNode.disable();
//            }
//        } else {
//            parentNode.SafelyToggleEnabled_OriginalStatus = parentNode.get_enabled() ? 'Enabled' : 'Disabled';
//            parentNode.disable();
//        }
//        for (var i = 0; i < parentNode.get_nodes().get_count(); i++)
//        {
//            SafelyToggleEnabled(parentNode.get_nodes().getNode(i), enable);
//        }
//    }
//    
//    // Return true if node1 is a descendant of node2, else return false.
//    function NodeIsDescendant(node1, node2)
//    {
//        debugger;
//        if (node1 == node2)
//            return true;
//        
//        var parent = node1.get_parent();    
//        while (parent != null)
//        {
//            if (parent == node2)
//                return true;
//            parent = parent.get_parent();
//        }
//        return false;
//    }   
</script>

<div id="MenuPaneDiv" runat="server" class="ClearFix">
    <asp:Panel id="MenuPane" runat="server">
        <asp:UpdatePanel ID="MenuUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <radM:RadMenu ID="MainMenu" runat="server" OnClientItemClicking="Menu_Clicked" EnableSelection="false">
                    <Items>
                        <radM:RadMenuItem id="MenuItemNew" runat="server" Text="New" Value="New" />
                        <radM:RadMenuItem id="MenuItemExpandAll" runat="server" Text="ExpandAll" Value="ExpandAll" />
                        <radM:RadMenuItem id="MenuItemCollapseAll" runat="server" Text="CollapseAll" Value="CollapseAll" />
                        <radM:RadMenuItem id="MenuItemDelete" runat="server" Text="Delete" Value="Delete"  />
                        <radM:RadMenuItem id="MenuItemClearAll" runat="server" Text="ClearAll" Value="ClearAll" />
                        <radM:RadMenuItem id="MenuItemReset" runat="server" Text="Reset" Value="Reset" />
                        <radM:RadMenuItem id="MenuItemExport" runat="server" Text="Export" Value="Export" />
                        <radM:RadMenuItem id="MenuItemImport" runat="server" Text="Import" Value="Import" />
                    </Items>
                </radM:RadMenu>
             </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="MainMenu" />
                <asp:AsyncPostBackTrigger ControlID="ItemTree" />
            </Triggers>
       </asp:UpdatePanel>
    </asp:Panel>
</div>
<div id="divTree" runat="server" style="clear:left;float:left;width:25%;height:450px;overflow:auto;">
    <asp:Panel id="TreePane" runat="server">
        <asp:UpdatePanel ID="TreeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <telerik:RadTreeView ID="ItemTree" runat="server" ExpandDelay="0" translate="no"
                 EnableDragAndDropBetweenNodes="false">
                </telerik:RadTreeView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="MainMenu" />
                <asp:AsyncPostBackTrigger ControlID="ItemTree" />
                <asp:AsyncPostBackTrigger ControlID="TreePaneRefreshButton" />
                <asp:AsyncPostBackTrigger ControlID="TreePaneNodeAddedButton" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
</div>
<asp:Button ID="TreePaneRefreshButton" runat="server" style="display: none;" OnClick="TreePane_RefreshClick" />
<asp:Button ID="TreePaneNodeAddedButton" runat="server" style="display: none;" OnClick="TreePane_NodeAddedClick" />
<script type="text/javascript">
    function TagRefresh_Callback(dialogWindow)
    {
        InitiateControlEventWithArgument('<%= TreePaneRefreshButton.ClientID %>', dialogWindow.result);
    }
    function TagNodeAdded_Callback(dialogWindow)
    {
        if (dialogWindow.TagKey != null)
            InitiateControlEventWithArgument('<%= TreePaneNodeAddedButton.ClientID %>', dialogWindow.TagKey);
    }

    // PBI 69048
    var mainMenuElement = jQuery('#' + '<%= MainMenu.ClientID %>');
    if (mainMenuElement !== null && mainMenuElement.attr('tabindex') !== null) {
        mainMenuElement.removeAttr('tabindex');
    }
</script>
