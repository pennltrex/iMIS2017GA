<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SegmentDefinition.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<script language="javascript"><!--
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserCallback(window)
    {
        if (!window.result)
            return;
		document.getElementById(SelectedKeyID).value = window.result;
		submitForm(document.getElementById(SelectedKeyID));
    }
    
    function QueryBuilderCallback(window) 
    {
	    document.getElementById(SelectedTypeID).value = 'IQD';  
 	    submitForm(document.getElementById(SelectedKeyID)); 	             	        
    }       
	//-->
</script>

<input type="hidden" id="SelectedKey" runat="server" onserverchange="SelectedKeyChanged" name="SelectedKey" />
<input type="hidden" id="SelectedType" runat="server" name="SelectedType" />

<div class="PanelField">
    <div class="PanelFieldLabel">
        <asiweb:StyledLabel ID="lblSegmentName" runat="server" AssociatedControlID="txtSegmentName" CssClass="Required" />
    </div>
    <div class="PanelFieldValue">
        <asiweb:BusinessTextBox ID="txtSegmentName" runat="server" />
        <asiweb:AsiRequiredFieldValidator ID="rfvSegmentName" runat="server" ControlToValidate="txtSegmentName" />
    </div>
</div>
<asiweb:BusinessTextBox ID="SegmentDescription" runat="server" RenderPanelField="true" DisplayCaption="true" Rows="5" TextMode="MultiLine" />
<div class="PanelField">
    <div class="PanelFieldLabel">
        <asiweb:StyledLabel ID="lblQueryName" runat="server" AssociatedControlID="lbtnQueryName" />
    </div>
    <div class="PanelFieldValue">
        <asp:linkbutton id="lbtnQueryName" runat="server" cssclass="LinkButton" Visible="False" Enabled="False" translate="no"></asp:linkbutton>&nbsp;
		<asiweb:StyledButton ID="btnGetQuery" runat="server" CausesValidation="false" AutoPostBack="false" OnClientClick="OpenObjectBrowser('DocumentPath=$/Common/Shared Documents&ShowHierarchyTree=false&ShowContainers=true&ShowSummary=false&AllowMultiSelect=false&iTypeFilter=IQD,FOL',BSABrowserCallback);" />
		<asiweb:StyledButton ID="btnCreateQuery" CausesValidation="false" runat="server" AutoPostBack="false"  />
		<asiweb:StyledButton ID="btnClearQuery" CausesValidation="false" runat="server" />
    </div>
</div>
<div ID="pnlRandomRecords" runat="server" class="PanelField FloatNone">
    <asp:checkbox id="chkRandom" runat="server" Text="Retrieve"></asp:checkbox> 
    <asp:textbox id="txtReturned" runat="server"></asp:textbox>
    <asp:label id="lblRandomRecords" runat="server" AssociatedControlID="txtReturned"></asp:label>
    <asp:RangeValidator ID="txtReturnedValidator" type="Integer" runat="server" ControlToValidate="txtReturned" CssClass="Important" MinimumValue="1" 
        MaximumValue="100000"  ErrorMessage="The number of random records to retrieve must be greater than or equal to 0" />
</div>
<asiweb:BusinessTextBox ID="Priority" runat="server" RenderPanelField="true" DisplayCaption="true" />
<div style="clear:both"></div>