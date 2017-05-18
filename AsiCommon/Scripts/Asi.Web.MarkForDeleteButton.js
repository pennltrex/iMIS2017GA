// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebControls.MarkForDeleteButton
// ###########################################################

function MarkForDeleteButtonProperties()
{
    this.OriginalCssClass = new String();
    this.OldMouseOver = new String();
    this.OldMouseOut = new String();
    this.HoverCssName = new RegExp("Hover|Hand");
    this.HoverReplacement = "";
    this.DisabledCssAppend = "Disabled StrikeOut";
}

var markForDeleteButtonProperties = new MarkForDeleteButtonProperties();

function MarkForDeleteButton_MarkForDelete(rowID, hiddenID, deleteImgID, undoIcon)
{
    markforDelete = document.getElementById(hiddenID);

    markforDelete.checked = !markforDelete.checked;
    if (markforDelete.checked)
    {
        DisableRow(rowID, hiddenID, deleteImgID, undoIcon);
    }
    else
    { //checkbox is already checked.
        EnableRow(rowID, hiddenID, deleteImgID, undoIcon);
    }
}
function MarkForDeleteButton_DisableRow(rowID, hiddenID, deleteImgID, undoIcon)
{

    row = document.getElementById(rowID);

    deleteImg = document.getElementById(deleteImgID);
    markForDeleteButtonProperties.OriginalCssClass = row.className;
    // we also want to check for mouseover, mouseout style info
    row.oldmouseover = row.onmouseover;
    row.oldmouseout = row.onmouseout;
    row.onmouseover = "";
    row.onmouseout = "";
    row.className = markForDeleteButtonProperties.OriginalCssClass.replace(markForDeleteButtonProperties.HoverCssName, markForDeleteButtonProperties.HoverReplacement) + markForDeleteButtonProperties.DisabledCssAppend;
    for (i = 0; i < row.childNodes.length; i++)
    {
        td = row.childNodes.item(i);
        for (j = 0; j < td.childNodes.length; j++)
        {
            element = td.childNodes.item(j);
            if (element.tagName && element.id != hiddenID)
            {
                if (element.tagName.toUpperCase() == "INPUT" || element.tagName.toUpperCase() == "SELECT"
					|| element.tagName.toUpperCase() == "TEXTAREA")
                    element.className = element.className + "Disabled";

            }
            else if (element.tagName)
            {
                element.checked = true;
            }
        }
    }
    deleteImg.oldSrc = deleteImg.src;

    deleteImg.src = undoIcon;
    deleteImg.alt = deleteImg.DisabledAltText;
}
function MarkForDeleteButton_EnableRow(rowID, hiddenID, deleteImgID, undoIcon)
{
    row = document.getElementById(rowID);
    deleteImg = document.getElementById(deleteImgID);
    row.className = markForDeleteButtonProperties.OriginalCssClass; //row.className.replace("Disabled","");
    row.onmouseover = row.oldmouseover;
    row.onmouseout = row.oldmouseout;
    for (i = 0; i < row.childNodes.length; i++)
    {
        td = row.childNodes.item(i);
        for (j = 0; j < td.childNodes.length; j++)
        {
            element = td.childNodes.item(j);
            if (element.tagName && element.id != hiddenID)
            {
                if (element.tagName.toUpperCase() == "INPUT" || element.tagName.toUpperCase() == "SELECT"
					|| element.tagName.toUpperCase() == "TEXTAREA")
                    element.className = element.className.replace("Disabled", "");
            }
            else if (element.tagName)
            {
                element.checked = false;
            }
        }
    }
    //deleteImg.src = deleteImg.src.replace("activate.gif","icon_delete.gif");
    deleteImg.src = deleteImg.oldSrc;
    deleteImg.alt = deleteImg.ActiveAltText;
}
