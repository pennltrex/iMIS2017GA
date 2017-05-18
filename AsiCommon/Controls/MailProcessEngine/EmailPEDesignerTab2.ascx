<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailPEDesignerTab2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailPEDesignerTab2.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radE" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<script language="javascript">
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserCallback(window)
    {
        if (!window.result)
            return;
		document.getElementById(SelectedKeysID).value = window.result;
        __doPostBack(this.id,'');
		submitForm(document.getElementById(SelectedKeysID));
    }
    
    function ToEmailCallback()
    {
		document.getElementById(RecipientsID).value = "1";
		__doPostBack(this.id,'');
        submitForm(document.getElementById(RecipientsID));
    }

    function locateButton(obj)
    {
        document.getElementById(document.getElementById('BrowseButtonName_ClientID').value).value = obj.id;
    }
	
</script>

<input type="hidden" id="SelectedKeys" runat="server" onserverchange="AddObjects"/>
<input type="hidden" id="Recipients" runat="server" onserverchange="AddRecipients"/>
<input type="hidden" id="BrowseButtonName" runat="server" />

<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblQueryType" runat="server"></asp:label></td>
		<td class="PanelTableValue" colspan="2">
		        <asp:radiobuttonlist RepeatDirection="Horizontal" id="rblQueryType" runat="server" autopostback="True"></asp:radiobuttonlist>
		</td>
	</tr>
	<asp:panel id="QueryPanel" runat="server">
		<tr>
			<td class="PanelTablePrompt" valign="middle">
				<asp:label id="lblQueryExplorer" runat="server"></asp:label></td>
			<td class="PanelTableValue" >
				<asp:linkbutton id="lbtnQueryName" runat="server" cssclass="LinkButton" visible="False"></asp:linkbutton>&nbsp;</td>
			<td class="PanelTableValue">
			    <asiweb:StyledButton id="btnQueryBrowse" Text="..." AutoPostBack="false" OnClientClick="OpenObjectBrowser('AllowMultiSelect=false&iRootFolder=$/Common/Shared Documents&DocumentPath=$/Common/Shared Documents&iTypeFilter=FOL,IQD&ShowAddress=false&ShowRootList=false&ShowSummary=false',BSABrowserCallback);locateButton(this);" runat="server" /> 
				<asiweb:StyledButton id="btnQueryUpload" runat="server" /> 
				<asiweb:StyledButton id="btnClearQuery" Text="X" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="PanelTablePrompt" valign="middle">
				<asp:label id="lblFromEmail" runat="server"></asp:label></td>
			<td class="PanelTableValue">
				<asp:textbox id="txtFromEmail" runat="server"></asp:textbox></td>
			<td class="PanelTableValue" valign="middle" nowrap >
				<asp:checkbox id="chkRuntimeFromEmail" runat="server"></asp:checkbox></td>
		</tr>
		<tr>
			<td class="PanelTablePrompt" valign="middle">
				<asp:label id="lblToEmail" runat="server"></asp:label></td>
			<td class="PanelTableValue">
				<asp:label id="lblToEmailValues" runat="server">[lblToEmailValues]</asp:label></td>
			<td class="PanelTableValue" valign="middle" nowrap>
			    <asiweb:StyledButton id="btnEditToEmail" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="PanelTablePrompt" valign="middle">
				<asp:label id="lblSubject" runat="server"></asp:label></td>
			<td class="PanelTableValue">
				<asp:textbox id="txtSubject" runat="server"></asp:textbox></td>
			<td class="PanelTableValue" valign="middle" nowrap>
				<asp:checkbox id="chkRuntimeSubject" runat="server"></asp:checkbox></td>
		</tr>
		<tr>
		    <td class="PanelTablePrompt" nowrap><asp:label id="lblRadioFormatOptions" text="Email Format Options" runat="server"></asp:label></td>
		    <td class="PanelTableValue" colspan="2">
		            <asp:radiobuttonlist RepeatDirection="Horizontal" id="rblFormatOptions" runat="server" autopostback="True"></asp:radiobuttonlist>
		    </td>
	    </tr>
		<tr>
			<td class="PanelTablePrompt" valign="top">
				<asp:label id="lblTemplateExplorer" runat="server"></asp:label></td>
            <td class="PanelTableValue" colspan="2" valign="top">
                <rade:radeditor id="txtTemplate" ondragstart="startEditorDrag();" ondrop="drop(this)" Width="100%"
                    Height="600px" EnableViewState="false" Runat="server" Overflow="Scroll" NewLineBr="false"
                    Scheme="Custom" EnableTheming="false" DialogsScheme="Default" ToolsOnPage="true" StripAbsoluteAnchorPaths="true"
                    Editable="True" SaveInFile="false" ToolsFile="~\RadControls\Editor\ToolsFileNoImageManager.xml"></rade:radeditor>
            </td>
		</tr>
		<tr>
			<td colspan="2" class="PanelTablePrompt" valign="middle"></td>
			<td class="PanelTableValue">
			    <asiweb:StyledButton id="btnTemplateUpload" runat="server" /> 
				<asiweb:StyledButton id="btnTemplateBrowse" AutoPostBack="false" OnClientClick="OpenObjectBrowser('AllowMultiSelect=false&iRootFolder=$&iTypeFilter=FOL,TXT,RTF&ShowAddress=false&ShowRootList=false&ShowSummary=false',BSABrowserCallback);locateButton(this);" runat="server" />
				<asp:checkbox id="chkRuntimeTemplate" runat="server"></asp:checkbox>
			</td>
		</tr>
		 
		<tr>
		    <td colspan="3" class="PanelTablePrompt" valign="top">
				<asp:textbox id="txtAlternate" runat="server" visible="false" width="82%" height="300px" textmode="MultiLine"></asp:textbox>
			</td>
		</tr>
		
		<tr>
			<td class="PanelTablePrompt" valign="middle">
				<asp:label id="lblAttachmentExplorer" runat="server"></asp:label></td>
			<td class="PanelTableValue" >
				<asp:label id="lbtnAttachmentName" runat="server" visible="False"></asp:label>&nbsp;</td>
			<td class="PanelTableValue" >
			    <asiweb:StyledButton id="btnAttachmentBrowse" Text="..." AutoPostBack="false" OnClientClick="OpenObjectBrowser('AllowMultiSelect=false&iRootFolder=$&iTypeFilter=FOL,TXT,RTF,DOC,PPT,XLS,PDF,HTM&ShowAddress=false&ShowRootList=false&ShowSummary=false',BSABrowserCallback);locateButton(this);" runat="server" /> 
			    <asiweb:StyledButton id="btnAttachmentUpload" runat="server" Visible="false" /> 
			    <asiweb:StyledButton id="btnAttachmentClear" Text="X" runat="server" />
			</td>
		</tr>
		<tr>
			<td colspan="3" align="right"><asp:Label id="lblRequiredField" runat="server"></asp:Label></td>
		</tr>
	</asp:panel>
</table>
