<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control language="c#" EnableViewState="false" Inherits="Asi.Web.UI.Common.BSA.DocumentVersions" Codebehind="DocumentVersions.ascx.cs" %>
<telerik:RadWindowManager runat="server" ID="documentVersionWindowManager" Skin="MetroTouch" Width="400" Height="350"></telerik:RadWindowManager>
<script language="JavaScript"><!--
<asp:placeholder id="JavascriptPlaceholder" runat="server"></asp:placeholder>

var selectedRow = null;
    
//var gridRowCssClass = '<asp:Literal id="GridRowCssClass" runat="server" Text="<%# VersionsList.ItemStyle.CssClass %>" />';
function SelectVersion(row, key, documentTypeCode, isSystem, isPublished)
{
	if (selectedRow != null)
	{
	    var cells = selectedRow.getElementsByTagName("td");
	    for (var i = 0; i < cells.length; ++i)
	    {
	        cells[i].style.color = "";
	        cells[i].style.backgroundColor = "";
	    }
	}
	selectedRow = row;
	if (selectedRow != null)
	{
	    var cells = selectedRow.getElementsByTagName("td");
	    for (var i = 0; i < cells.length; ++i)
	    {
	        cells[i].style.color = "white";
	        cells[i].style.backgroundColor = "#316ac5";
	    }
	        
        if (isSystem) 
	    {
            // IsSystem docs that are published can only export.
            // IsSystem docs that aren't published can export as well as purge.
            if (isPublished)
	            SetButtonsEnabled(false, false, true, false);
            else
                SetButtonsEnabled(false, false, true, true);
        }
        else
	    {
            // Copy not enabled for websites, for now
	        SetButtonsEnabled(true, !(documentTypeCode == 'WEB'), true, true);
	    }
	}
	else
	{
	    SetAllButtonsEnabled(false);
	}
	document.getElementById(SelectedDocumentKeyID).value = key;
	document.getElementById(CommentFrameID).src = '<%= CurrentContext.TemplatePath %>?ContentCode=BSA.DocumentVersions.Comments&TemplateType=E&DocumentKey=' + key;
}
	
function SetAllButtonsEnabled(enable)
{
	$get('<%= Revert.ClientID %>').disabled = !enable;
	$get('<%= Copy.ClientID %>').disabled = !enable;
	$get('<%= ExportButton.ClientID %>').disabled = !enable;
	$get('<%= PurgeButton.ClientID %>').disabled = !enable;
}

function SetButtonsEnabled(enableRevert, enableCopy, enableExport, enablePurge)
{
	$get('<%= Revert.ClientID %>').disabled = !enableRevert;
	$get('<%= Copy.ClientID %>').disabled = !enableCopy;
	$get('<%= ExportButton.ClientID %>').disabled = !enableExport;
	$get('<%= PurgeButton.ClientID %>').disabled = !enablePurge;
}
	
function CheckAndSubmit()
{
	var ret = CheckSelection();
	alert(ret);
	if (ret == true) 
		document.forms[0].submit();
}
	
function CheckSelection()
{
	if (document.getElementById(SelectedDocumentKeyID).value.length > 0)
	    return true;
	alert("Please select a version before clicking");
	return cancelEvent();
}
	
function CopyVersion(buttonClicked, promptText) {
    if (buttonClicked == null) return false;
    if (promptText == null) return false;

    this.Prompt_CallBack = function (newName) {
        if (newName != null && trim(newName).length > 0)
        {
            document.getElementById(CopyNewNameID).value = trim(newName);
            __doPostBack(buttonClicked, "");
        }
    }
    if (CheckSelection())
	{
        var newName = radprompt(promptText, this.Prompt_CallBack);
	}
    return false;
}

function confirmAction(buttonClicked, windowTitle, confirmText) 
{
    if (buttonClicked==null) return false;
    if (confirmText==null) return false;

    this.FirePostBack_CallBack = function(result) {
        if(result)
            __doPostBack(buttonClicked, "");
    }

    if (CheckSelection()) {
        radconfirm(confirmText, this.FirePostBack_CallBack, 350, 300, null, windowTitle);  
    }
    return false;
}
   
function ShowBranchMessageMore()
{
    var moreMessage = document.getElementById('BranchMessageMore');
    var moreMessageLink = document.getElementById('BranchMessageMoreLink');
        
    if (moreMessage.style.display == 'none')
    {
        moreMessage.style.display = 'inline';
        moreMessageLink.innerText = 'less';
    }
    else
    {
        moreMessage.style.display = 'none';
        moreMessageLink.innerText = 'more';
    }
}
//-->
</script>

<input type="hidden" id="SelectedDocumentKey" runat="server"/>
<input type="hidden" id="CopyNewName" runat="server"/>

<asp:Label ID="UnsupportedDocTypeLabel" runat="server" CssClass="Error" Visible="false">The selected document type does not support versioning at this time.</asp:Label>

<asp:Panel ID="BranchMessagePanel" runat="server">
    <asp:Label ID="BranchMessage" runat="server" style="font-weight:bolder;"/>
    <span id="BranchMessageMore" style="display:none;">All properties of a child branch are defined in the root business object. The list below shows all versions of the root business object. To view the properties of a specific version, select the version and click Revert to create a new working version of the object. You can then view or revise the new working version's properties in the appropriate object editor, and then publish the new version if you want to implement the changes.</span>
    <a id="BranchMessageMoreLink" href="javascript:ShowBranchMessageMore();">more</a>
</asp:Panel>

<asp:Panel ID="ContentPanel" runat="server" translate="yes">
    
    <asiweb:PanelTemplateControl ID="RevertConflictPanel" runat="server" Text="Document Conflict" Collapsible="false" Visible="false" BorderStyle="none">
        <asp:Label ID="ConflictInfoLabel" runat="server">There is another document with the same name as the one you are reverting.</asp:Label>  
        <div style="margin-top: 10px; margin-bottom: 10px;">
            <asiweb:StyledButton ID="ConflictReplace" runat="server" OnClick="ConflictReplace_Click" Text="Replace" /><br />Replace the current version with the one you are reverting.
        </div>
        <div style="margin-bottom: 10px;">
            <asiweb:StyledButton ID="ConflictCancel" runat="server" OnClick="ConflictCancel_Click" Text="Cancel" /><br />Don't revert. No changes will be made.
        </div>
        <div style="margin-bottom: 10px;">
            <asiweb:StyledButton ID="ConflictCopy" runat="server" OnClick="ConflictCopy_Click" Text="Create New Copy" /><br />Rename the reverted document to no longer conflict with the existing document.
        </div>
    </asiweb:PanelTemplateControl>

    <asiweb:PanelTemplateControl ID="VersionsPanel" runat="server" Text="Document Versions" Collapsible="false" BorderStyle="none">
               
        <asp:label id="HeadingLabel" Runat="server">All existing versions of </asp:label><asp:label id="DocumentName" Runat="server"/>
        
        <asp:label id="MessageLabel" Runat="server" Visible="false"/>

        <asiweb:BusinessDataGrid id="VersionsList" AllowPaging="true" OnPageIndexChanged="ChangePage" AllowSorting="true"
	        PageSize="5" AutoGenerateColumns="false" runat="server" ShowHeader="True" GridLines="Both"
	        OnItemDataBound="VersionsListItemDataBound" CellPadding="3" Width="98%">
	        <PagerStyle Mode="NumericPages" NextPageText="Next >" PrevPageText="< Previous" PageButtonCount="10" />
	        <Columns>
	            <asp:BoundColumn DataField="DocumentStatusName" DataFormatString="{0:c}" HeaderText="Status" SortExpression="DocumentStatus"/>
	            <asp:BoundColumn DataField="UpdatedByUserName" DataFormatString="{0:c}" HeaderText="Created By" SortExpression="UpdatedByUserName"/>
	            <asp:BoundColumn DataField="UpdatedOn" DataFormatString="{0:g}" HeaderText="Updated On" SortExpression="UpdatedOn"/>
	            <asp:BoundColumn DataField="Name" DataFormatString="{0:c}" HeaderText="Name" SortExpression="Name"/>
	        </Columns>
        </asiweb:BusinessDataGrid>

        <div style="padding-bottom:3px; width:100%;">
            <div class="CommandBar">
                <asiweb:StyledButton ID="Revert" runat="server" Text="Revert" disabled="true" />
                <asiweb:StyledButton ID="Copy" runat="server" Text="Copy" disabled="true" />
                <asiweb:StyledButton ID="ExportButton" runat="server" OnClientClick="if (!CheckSelection()) return false;" Text="Export" disabled="true" />
                <asiweb:StyledButton ID="PurgeButton" runat="server" Text="Purge" disabled="true" />
            </div>
        </div>

    </asiweb:PanelTemplateControl>

    <iframe id="CommentFrame" runat="server" allowtransparency="true" style="border: solid 1 black;" width="560" height="200" frameborder="0"/>

</asp:Panel>
