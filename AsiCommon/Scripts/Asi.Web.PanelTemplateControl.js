// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.PanelTemplateControl
// ###########################################################

addLoadEvent(PanelTemplateControl_Init);
addLoadEvent(FixCollapsedExtender);

var PanelTemplateControls = new Array();
function FixCollapsedExtender() {

    if (PanelTemplateControls && PanelTemplateControls != null && PanelTemplateControls.length > 0) {

        for (var i = 0; i < PanelTemplateControls.length; i++) {

            if (PanelTemplateControls[i] != null) {
                var elm = $find(PanelTemplateControls[i].id + '_CollapsiblePanelExtender');
                if (elm != null && !elm.get_Collapsed()) {
                    try {
                        elm._doOpen();
                    }
                    catch (exc) { }
                }
            }
        }
    }
} 

function PanelTemplateControl_Init()
{
    if (PanelTemplateControls && PanelTemplateControls != null && PanelTemplateControls.length > 0)
    {
        for (var i=0; i<PanelTemplateControls.length; i++)
        {
            if(PanelTemplateControls[i] != null)
            {
                var oldonfocus = PanelTemplateControls[i].onfocus;
                if (oldonfocus != null)
                {
                    PanelTemplateControls[i].onfocus = function(e){
                        oldonfocus(e);
                        PanelTemplateControl_Focus(e);
                    }
                }
                else
                {
                    PanelTemplateControls[i].onfocus = PanelTemplateControl_Focus;
                }
            }
        }
        
        setTimeout("PanelTemplateControl_FixInitialHeight()", 500);
    }
}
// 
// EventHandler for focus event on PanelTemplateControl
//
function PanelTemplateControl_Focus(e)
{
    var ptc = eventSource(e);
    PanelTemplateControl_Focus2(ptc);
}
//
// Direct call to the focus action for PanelTemplateControl
// so that we can call it on non-Explorer browsers.  In IE
// you can just call fireEvent('onfocus').
// 
function PanelTemplateControl_Focus2(ptc)
{
    var collapsibleExtender = $find(ptc.id + '_CollapsiblePanelExtender');
    if (collapsibleExtender != null && collapsibleExtender.get_Collapsed())
    {
        collapsibleExtender._doOpen();
    }
}
//
// HACK: This function needs to be executed at startup to fix some bug in PanelTemplateControl's
// CollapsiblePanelExtender where the initial height is set incorrectly.
//
function PanelTemplateControl_FixInitialHeight()
{
    try
    {
        if (PanelTemplateControls != null)
        {
            for (var i = 0; i < PanelTemplateControls.length; i++)
            {
                var div = null;
                if (PanelTemplateControls[i].firstChild != null && PanelTemplateControls[i].firstChild.tagName != null)
                {
                    if (PanelTemplateControls[i].firstChild.tagName.toUpperCase() == "FIELDSET")
                        div = PanelTemplateControls[i].firstChild.childNodes[2];
                    else
                        div = PanelTemplateControls[i].childNodes[1];
                
                }
                
                if (div != null)
                {
                    //_DebugTrace('div height: ' + div.offsetHeight);
                    if (div.style.height != '1px' && div.style.height != '0')
                        div.style.height = 'auto';
                }
                else
                {
                    //_DebugTrace('div is null.  div: ' + div);
                }
            }
        }
    }
    catch (exc){}
    finally {
        // Define function window.PanelTemplateControl_AfterFixInitalHeight if you wish to perform some tasks
        // after Fixing initial height of PanelTemplateColumns
        if (window.PanelTemplateControl_AfterFixInitalHeight)
            setTimeout("window.PanelTemplateControl_AfterFixInitalHeight();", 500);
    }
}

// This is needed so that script is properly registered on an async postback
if(typeof(Sys) !== "undefined")Sys.Application.notifyScriptLoaded();
