// Function to select a treenode.
function atvSelect(item)
{
    var node = getParent(item);
    var span = document.getElementById(node.spanId);
    var treeview = getParent(node);

    if (!node.navigateurl || node.navigateurl.length == 0)
        return;
    // Can't get directly to treeview for some reason. So, find by traversing up the tree
    while (treeview.tagName != 'treeview' && treeview.tagName != 'body')
        treeview = getParent(treeview);

    // Deselect previously selected item.
    if (treeview.selectedIndex >= 0)
    {
        var selectedNode = document.getElementById(treeview.id + "Node" + treeview.selectedIndex);
        selectedNode.selected = "false";
        document.getElementById(selectedNode.spanId).className = document.getElementById(selectedNode.spanId).defaultClass;
        treeview.selectedIndex = "-1";
    }
    // Select the new item.
    treeview.selectedIndex = node.index;
    document.getElementById(node.treeviewId + "SelectedIndex").value = node.index;
    document.getElementById(node.treeviewId + "SelectedKey").value = node.key;
    node.selected = "true";
    if (span.selectedClass != "")
        span.className = span.selectedClass;

    // Redirect
    if (node.target && node.target.length > 0)
        document.frames(node.target).location = node.navigateurl;
    else
        document.location = node.navigateurl;
}

// Function to expand/collapse tree.
function atvOpenClose(item)
{
    var node = getParent(item);
    var openNodes = document.getElementById(node.treeviewId + "OpenNodes");

    if (item.state == "open")
    {
        //Close all the child nodes.
        for (i = 0; i < node.children.length; i++)
        {
            if (node.children[i].tagName == 'treenode')
                node.children[i].style.display = "none";
        }
        item.state = "close";
        item.src = item.src.replace("minus", "plus");

        var nodeArray = openNodes.value.split(',');
        for (i = 0; i < nodeArray.length; i++)
        {
            if (nodeArray[i] == node.index)
            {
                nodeArray.splice(i, 1);
                break;
            }
        }
        openNodes.value = nodeArray.join();
    }
    else if (item.state == "close")
    {
        //Open all the child nodes.
        for (i = 0; i < node.children.length; i++)
        {
            if (node.children[i].tagName == 'treenode')
                node.children[i].style.display = "block";
        }
        item.state = "open";
        item.src = item.src.replace("plus", "minus");

        // update the OpenNodes hidden input field to store thru postback
        if (openNodes.value.length > 0)
            openNodes.value = openNodes.value + ",";
        openNodes.value = openNodes.value + node.index;
    }
}

function atvSetStyle(item, action)
{
    var treeNode = getParent(item);
    var span = document.getElementById(treeNode.spanId);
    var newClass;
    //If it's selected, class doesn't change. 
    if (treeNode.selected == "false")
    {
        if (action == 'HoverOut' && span.defaultClass != "")
            span.className = span.defaultClass;
        else if (action == 'Hover' && span.hoverClass != "")
            span.className = span.hoverClass;
    }
}

