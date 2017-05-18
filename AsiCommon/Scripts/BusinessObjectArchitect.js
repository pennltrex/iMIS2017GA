// ###########################################################
// JavaScript functions necessary for use with
// the AccessSettings panel (~/AsiCommon/Controls/BOA/BOAObjectConstraints.ascx).
// ###########################################################



function BSAShowSelectedSubPanel(panel)
{
	// find the ddlb that holds the list of panels
	var ddlbList = panel.getElementsByTagName('SELECT');
	var i;
	for (i=0;i<ddlbList.length;i++)
	{
		if (ddlbList[i].name.substr(ddlbList[i].name.length - 9,9) == "PanelList")
		{
			// get the key of the selected item
			var ddlb = ddlbList[i];
			if (ddlb.selectedIndex == -1)
    			return;
			var key = ddlb.options[ddlb.selectedIndex].value;

			// and hide all others but show the one that matches the key
			panelList = panel.getElementsByTagName('DIV');
			for (j = 0; j < panelList.length; j++) 
            {
			    var panelname = panelList[j].getAttribute("name");
			    var panelkey = panelList[j].getAttribute("key");
			    if (panelname == "SinglePanel" && panelkey != key)
			        panelList[j].style.display = "none";
			    else if (panelname == "SinglePanel" && panelkey == key)
			        panelList[j].style.display = "block";
			}
		}
	}	
}

function BSAPanelSelectChanged(select)
{
	var panel = findAncestor(select,"DIV");
	BSAShowSelectedSubPanel(panel);
}
