<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.JobDefinition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="JobDefinition.ascx.cs" %>
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


<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false">

    <asiweb:PanelTemplateColumn runat="server" ID="SegJobLeftCol">
        <div class="PanelField">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel ID="lblJobName" runat="server" AssociatedControlID="txtJobName" CssClass="Required" />
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox ID="txtJobName" runat="server" />                
            </div>
        </div>
		<asiweb:BusinessTextBox ID="Description" runat="server" RenderPanelField="true" BoundPropertyName="Description" DisplayCaption="true" TextMode="MultiLine" />
        <asiweb:BusinessDropDownList ID="objectTypeList" runat="server" BoundPropertyName="objectTypeList" RenderPanelField="true" DisplayCaption="true" IncludeNullItem="false"/>
        <div class="PanelField">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel id="lblQueryName" runat="server" AssociatedControlID="lbtnQueryName" />
            </div>
            <div class="PanelFieldValue">
                <asp:linkbutton id="lbtnQueryName" runat="server" enabled="false" visible="false" cssclass="LinkButton" translate="no"/>
                <asiweb:StyledButton ID="btnGetQuery" runat="server" AutoPostBack="false" OnClientClick="OpenObjectBrowser('DocumentPath=$/Common/Shared Documents&iShowFolderTree=0&iAllowUpwardNavigation=1&iTypeFilter=IQD,FOL',BSABrowserCallback);" />
		        <asiweb:StyledButton ID="btnCreateQuery" runat="server" AutoPostBack="false" />
		        <asiweb:StyledButton ID="btnClearQuery" runat="server" CausesValidation="false" AutoPostBack="true" />
             </div>
        </div>
        <asiweb:BusinessDropDownList ID="drpStatus" runat="server" RenderPanelField="true" BoundPropertyName="drpStatus" DisplayCaption="true"/>
        <asiweb:BusinessCalendar2 ID="bcInactiveDate" runat="server" RenderPanelField="true" BoundPropertyName="InactiveDate"  DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>