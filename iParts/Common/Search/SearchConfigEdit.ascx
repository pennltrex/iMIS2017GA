<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="SearchConfigEdit.ascx.cs"  Inherits="Asi.Web.iParts.Common.Search.SearchConfigEdit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="Asi" %>
<%@ Register namespace="Asi.Web.UI.WebControls" tagPrefix="asiweb" Assembly="Asi.Web" %>
<%@ Register namespace="Telerik.Web.UI" tagPrefix="telerik" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" TagName="TagSelector" Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" %>

<%--
This is your iPart Configuration Page
Place any controls and JS that you want to use in the iPart Configuration Page
--%>
<script id="SelectDocument" type="text/javascript">
	function SelectDocumentObject(WindowTitle)
	{
		OpenObjectBrowser('TypeFilter=CON&DocumentPath=@', SetDocumentObject, true, null, null, WindowTitle);
	}
	function SetDocumentObject(window) 
	{
		if (!window.result)
			return;
		var documentKey = window.result;
		if (documentKey != null && documentKey != "")
		{
			document.getElementById(HiddenDocumentKey_ClientID).value = documentKey;
			document.getElementById(ResetButton_ClientID).style.display = "inline";
		}

		var documentName = window.SelectedDocumentName;
		if (documentName != null && documentName != "")
			document.getElementById(DocumentNameLabel_ClientID).firstChild.nodeValue = documentName;
	}
	function ResetDocumentObject()
	{
		document.getElementById(HiddenDocumentKey_ClientID).value = "";
		document.getElementById(ResetButton_ClientID).style.display = "none";
		document.getElementById(DocumentNameLabel_ClientID).firstChild.nodeValue = NotSelectedText;
    }
	
     function EnableDisableSearchBox() {
         var searchCheckBox = $get("<%#ShowBox.ClientID%>_CheckBoxSet");
         var searchLabelControl = $get("<%#stSearchLabel.ClientID%>");
         var searchLabelTextBox = $get("<%#stSearchLabel.ClientID%>_TextField");
         var searchLabelLabel = $get("<%#stSearchLabel.ClientID%>_Caption");
         var showListControl = $get("<%#ShowList.ClientID%>");
         var showListCheckBox = $get("<%#ShowList.ClientID%>_CheckBoxSet");
         var showListLabel = $get("<%#ShowList.ClientID%>_Caption");

         if (searchCheckBox != null && searchCheckBox.checked) {
             searchLabelTextBox.disabled = false;
             searchLabelLabel.disabled = false;
             searchLabelControl.disabled = false;
             searchLabelControl.removeAttribute("disabled", 0);
             showListCheckBox.disabled = false;
             showListLabel.disabled = false;
             showListControl.disabled = false;
             showListControl.removeAttribute("disabled", 0);
         }
         else {
             searchLabelLabel.disabled = true;
             searchLabelTextBox.disabled = true;
             searchLabelControl.setAttribute("disabled", true);
             showListLabel.disabled = true;
             showListCheckBox.checked = false;
             showListCheckBox.disabled = true;
             showListControl.setAttribute("disabled", true);

         }
         EnableDisableShowList();
     }

     function EnableDisableShowList() {
         var showListCheckBox = $get("<%#ShowList.ClientID%>_CheckBoxSet");
         var searchAreasControl = $get("<%#chkSearchAreas.ClientID%>");
         var searchAreasCheckBox = $get("<%#chkSearchAreas.ClientID%>_CheckBoxSet");
         var searchAreasLabel = $get("<%#chkSearchAreas.ClientID%>_Caption");
         var documentNameCaption = $get("<%#DocumentNameCaption.ClientID%>");
         var documentNameLabel = $get("<%#DocumentNameLabel.ClientID%>");
         var browseButton = $get("<%#BrowseButton.ClientID%>");
         var resetButton = $get("<%#ResetButton.ClientID%>");
         var panAddLink_edit = $get("<%#panAddLink_edit.ClientID %>");

         if (showListCheckBox != null && showListCheckBox.checked) {
             searchAreasCheckBox.disabled = false;
             searchAreasLabel.disabled = false;
             searchAreasControl.disabled = false;
             searchAreasControl.removeAttribute("disabled", 0);
             searchAreasControl.style.display = 'block';
             documentNameCaption.disabled = true;
             documentNameCaption.setAttribute("disabled", true);
             documentNameLabel.disabled = true;
             documentNameLabel.setAttribute("disabled", true);
             browseButton.disabled = true;
             resetButton.disabled = true;
             panAddLink_edit.disabled = true;
             panAddLink_edit.setAttribute("disabled", true);
         }
         else {
             searchAreasLabel.disabled = true;
             searchAreasCheckBox.disabled = true;
             searchAreasControl.setAttribute("disabled", true);
             searchAreasControl.style.display = 'none';
             documentNameCaption.disabled = false;
             documentNameLabel.disabled = false;
             browseButton.disabled = false;
             resetButton.disabled = false;
             panAddLink_edit.disabled = false;
             panAddLink_edit.removeAttribute("disabled", 0);
         }
     }

</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
	<ContentTemplate>
	
		<asiweb:PanelTemplateControl id="panProperties" runat="server" TemplateTitle="" FieldSet="true"  Collapsible="false" ShowHeader="false" BorderWidth="0px" >
			<%--General Search Settings --%>
            <asiweb:PanelTemplateControl ID="panSearchArea" runat="server" Collapsed="false">
                <asiweb:smartcontrol ID="SearchOperator" runat="server" BoundPropertyName="InitialLogic" DisplayCaption="true" PositionCaption="Top"/>
                <div class="AutoWidth"> 
				    <asiweb:smartcontrol ID="ShowBox" runat="server" BoundPropertyName="DisplayTextBox" DisplayCaption="true" PositionCaption="Right" OnClientClick="EnableDisableSearchBox()"/>
                </div>
                <div class="SubItems"> 
                    <asiweb:smartcontrol ID="stSearchLabel" runat="server" BoundPropertyName="SearchLabel" DisplayCaption="true"  /> 
				    <div class="AutoWidth">
                        <asiweb:smartcontrol ID="ShowList" runat="server" BoundPropertyName="DisplayAreaOptions" DisplayCaption="true" PositionCaption="Right" OnClientClick="EnableDisableShowList()" />
				        <div class="SubItems">
				            <asiweb:smartcontrol ID="chkSearchAreas" runat="server" BoundPropertyName="Options" DisplayCaption="true" PositionCaption="Top" />
				        </div>
                    </div>
                </div>  
                <div class="AutoWidth"> 
				    <asiweb:smartcontrol ID="SmartControlInactiveResults" runat="server" BoundPropertyName="DisplayInactiveResultsCheckBox" DisplayCaption="true" PositionCaption="Right" />
                </div>

                 
			</asiweb:PanelTemplateControl>

			<%--Search Criteria Parameters--%> 
			<asiweb:PanelTemplateControl ID="panSearchTerms" runat="server" Collapsed="false">
                <div class="AutoWidth">
				<asiweb:smartcontrol ID="AutoRun" runat="server" BoundPropertyName="InitialDisplay" DisplayCaption="true" PositionCaption="Right"/>
				</div>
                <asiweb:smartcontrol ID="lstSearchArea" runat="server" BoundPropertyName="InitialArea" DisplayCaption="true" ShowNullItem="True" NullValue="" />                
				<asiweb:smartcontrol ID="SearchValue" runat="server" BoundPropertyName="InitialText" DisplayCaption="true" />
			</asiweb:PanelTemplateControl>
			
			<%--'Add' Link Pramaters--%>
			<asiweb:PanelTemplateControl ID="panAddLink" runat="server" Collapsed="false">
				<asp:panel ID="panAddLink_edit"  runat="server" CssClass="PanelField">              
					<asp:label id="DocumentNameCaption" runat="server" Text="" AssociatedControlID="BrowseButton" />					
                    <div class="PanelFieldValue FloatNone">
						<asp:label id="DocumentNameLabel" runat="server" />                        
						<asiweb:StyledButton id="BrowseButton" runat="server" AutoPostBack="false" />
						<asiweb:StyledButton id="ResetButton" runat="server" AutoPostBack="false" onclientclick="ResetDocumentObject()" />
						<input id="HiddenDocumentKey" type="hidden" runat="server" enableviewstate="true" />
				   </div>
				</asp:panel>        
			</asiweb:PanelTemplateControl>

			
			<%--Search Results Parameters--%>
			<asiweb:PanelTemplateControl ID="panSearchResults" runat="server" Collapsed="false">
				<asiweb:smartcontrol ID="NoRecordsMSG" runat="server" BoundPropertyName="NoResultMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="SearchError" runat="server" BoundPropertyName="ErrorMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="PageSize" runat="server" BoundPropertyName="PageSize" DisplayCaption="true" /> 
                <asiweb:SmartControl ID="PagerMode" runat="server" BoundPropertyName="PagerMode" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
                <div style="clear: both;"/><div class="AutoWidth" >   
                <asiweb:SmartControl ID="PagerDisplay" runat="server" BoundPropertyName="PagerDisplay" DisplayCaption="true" PositionCaption="Top" />            
				</div><div style="clear: both;"/>
                <asiweb:smartcontrol ID="MaxRecords" runat="server" BoundPropertyName="MaxResults" DisplayCaption="true" />
				<asiweb:smartcontrol ID="MaxRecordsMSG" runat="server" BoundPropertyName="ExceedResultsMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="sort" runat="server" BoundPropertyName="Sort" DisplayCaption="true" />
			<%--Tag Selector--%> <div class="PanelField Top">
					<label id="lblTag" runat="server"></label>
					<div class="PanelFieldValue">
						<asi:TagSelector ID="ctrlTagSelector" runat="server" />
					</div>
				</div>

			</asiweb:PanelTemplateControl>
			<asp:Label ID="debug" runat="server"></asp:Label>
			</asiweb:PanelTemplateControl>
			
	</ContentTemplate>
</asp:UpdatePanel>