<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.DocumentLoadUtility.DocumentLoaderPortfolio" Codebehind="DocumentLoaderPortfolio.ascx.cs" %>

<script language="javascript"><!--
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserSaverCallback(BSABrowserWindow)
    {
        if (!BSABrowserWindow.result)
            return;
		$get(FolderHierarchyKeyID).value = BSABrowserWindow.result;
		$get(SaveAsFilenameID).value = BSABrowserWindow.Filename;
		submitForm($get(FolderHierarchyKeyID));
        var oWindow = GetRadWindow();       
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null)        
            oWindow.add_close(function(){oWindow.BrowserWindow.objectBrowserClass.RefreshNode();});     
    }

	//-->
</script>
<input type="hidden" id="FolderHierarchyKey" runat="server" onserverchange="SaveAs" name="FolderHierarchyKey" />
<input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" />
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table id="Table1" cellspacing="0" cellpadding="3" border="0" width="100%">
	<tbody>
		<tr>
			<td>
				<table class="CommandBar" cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td valign="middle" align="left" class="mdTitle">
						    <asp:label id="lblDocumentUtility" runat="server"></asp:label>
						</td>
						<td>
							<asiweb:StyledButton runat="server" id="btnSaveAs" />
							<asiweb:StyledButton runat="server" id="btnSave" OnClick="btnSave_ServerClick" CommandButtonType="Save" />
							<asiweb:StyledButton runat="server" id="btnClose" OnClick="btnClose_ServerClick" CommandButtonType="Cancel" />
						</td>
					</tr>
				</table>
				<table class="HTabTable" cellspacing="0" cellpadding="0" border="0">
					<tr class="HTabTR">
						<td class="HTabTD">
						    <iewc:tabstrip SkinID="HorizontalTabStrip" id="HTabStrip1" runat="server" autopostback="True" onselectedindexchange="HTabStrip1_SelectedIndexChange" />
						</td>
					</tr>
					<tr>
						<td class="HTabBody" valign="top"><asp:placeholder id="SubSectionPlaceHolder" runat="server"></asp:placeholder></td>
					</tr>
				</table>
			</td>
		</tr>
    </tbody>
</table>
