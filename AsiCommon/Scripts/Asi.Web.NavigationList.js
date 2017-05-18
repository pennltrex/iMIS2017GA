// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.NavigationList
//
// ###########################################################

addLoadEvent(NavigationList_Init);
var NavigationList_LinkIndex = 0;
var NavigationList_SelectedNode = null;
var NavigationList_NavControlId = null;
var NavigationList_NavControl = null;

function NavigationList_Init()
{
    NavigationList_NavControl = document.getElementById(NavigationList_NavControlId);
    if (NavigationList_NavControl != null)
    {
        var allAnchors = NavigationList_NavControl.getElementsByTagName('a');
        for (var i = 0; i < allAnchors.length; i++)
        {
            // disable the bullet link, it just messes things up for us and provides little benefit
            // NOTE: this is specific to the TreeView and shouldn't affect top nav Menu control
            if (allAnchors[i].id.substr(allAnchors[i].id.length - 1, 1) == 'i')
            {
                allAnchors[i].removeAttribute('href');
                allAnchors[i].removeAttribute('onclick');
            }
            else
            {
                NavigationList_ConfigureAnchor(allAnchors[i]);
            }
        }
    }
}
var NavigationList_FirstTime = true;
var NavigationList_NodeClientClick = null;
var NavigationList_NodeClientMouseOver = null;
var NavigationList_NodeClientMouseOut = null;
function NavigationList_ConfigureAnchor(anchorElement)
{
    // don't add the clientclick function to the expand links
    // NOTE: this is specific to the TreeView and shouldn't affect top nav Menu control
    if (anchorElement.id.substr(NavigationList_NavControlId.length, 1) == 'n')
        return;

    if (NavigationList_FirstTime)
    {
        NavigationList_SelectedNode = getParent(getParent(getParent(getParent(anchorElement))));
        NavigationList_FirstTime = false;
    }
    if (NavigationList_NodeClientClick != null || NavigationList_NodeClientClick != '')
        anchorElement.onclick = NavigationList_NodeClientClick;
    if (NavigationList_NodeClientMouseOver != null || NavigationList_NodeClientMouseOver != '')
        anchorElement.onmouseover = NavigationList_NodeClientMouseOver;
    if (NavigationList_NodeClientMouseOut != null || NavigationList_NodeClientMouseOut != '')
        anchorElement.onmouseout = NavigationList_NodeClientMouseOut;
    anchorElement.linkindex = NavigationList_LinkIndex;
    NavigationList_LinkIndex++;
}