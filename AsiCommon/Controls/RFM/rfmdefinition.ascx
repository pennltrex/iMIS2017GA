<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMDefinition" Codebehind="RFMDefinition.ascx.cs" %>
<script type="text/javascript" language="javascript"><!--
    function PopulationQueryChanged(window)
    {
        if (!window.result)
            return;
        document.getElementById(PopulationKeysID).value = window.result;
		submitForm(document.getElementById(PopulationKeysID));
    }
    function TransactionQueryChanged(window)
    {
        if (!window.result)
            return;
        document.getElementById(TransactionKeysID).value = window.result;
		submitForm(document.getElementById(TransactionKeysID));
    }
     function OpenSaver1(args)
    {
        args = args.substring(0,args.indexOf("&iFilename="));
        args += "&iFileName= " + document.getElementById('<%=txtRFMName.ClientID %>').value;
        //alert(args);
        OpenObjectSaver(args,BSABrowserSaverCallback);
    }
	//-->
</script>
<input type="hidden" id="PopulationKeys" runat="server" onserverchange="SetPopulation"/>
<input type="hidden" id="TransactionKeys" runat="server" onserverchange="SetTransaction"/>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false">

    <asiweb:PanelTemplateColumn runat="server" ID="RFMDefLeftCol" Width="50%">
        <div class="PanelField">
            <div class="PanelFieldLabel">
             <asiweb:StyledLabel ID="lblRFMName" runat="server" AssociatedControlID="txtRFMName" CssClass="Required" />
            </div>
            <div class="PanelFieldValue">
                 <asiweb:BusinessTextBox ID="txtRFMName" runat="server" />
                <asiweb:AsiRequiredFieldValidator ID="rfvRFMName" runat="server" ControlToValidate="txtRFMName" />
            </div>
         </div>
        <asiweb:BusinessTextBox ID="txtDescription" runat="server" RenderPanelField="true" DisplayCaption="true" TextMode="MultiLine" />
	    <div id="PopulationQuery" class="PanelField">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel id="lblPopulationQuery" runat="server" AssociatedControlID="lbtnPopulationQueryName" CssClass="Required"/>
            </div>
            <div class="PanelFieldValue">
                <asp:linkbutton id="lbtnPopulationQueryName" runat="server" enabled="false" visible="false" cssclass="LinkButton" CausesValidation="true"  />
                <asiweb:StyledButton ID="btnGetQueryPopulation" runat="server" AutoPostBack="false" onclientclick="OpenObjectBrowser('AllowMultiSelect=false&DocumentPath=$/RFMAnalysis/DefaultSystem/Process Engines/User Queries&ShowHierarchyTree=false&AllowUpwardNavigation=true&TypeFilter=IQD,FOL&ShowSummary=false',PopulationQueryChanged);" CausesValidation="false" />
		        <asiweb:StyledButton ID="btnCreateQueryPopulation" runat="server" AutoPostBack="false" onclick="btnCreateQueryPopulation_ServerClick"/>
		        <asiweb:StyledButton ID="btnClearQueryPopulation" runat="server" CausesValidation="false" AutoPostBack="true" onclick="btnClearQueryPopulation_ServerClick"/>
            </div>
        </div>
	    <div id="TransactionQuery" class="PanelField">
             <div class="PanelFieldLabel">
                <asiweb:StyledLabel id="lblTransactionQuery" runat="server" AssociatedControlID="lbtnTransactionQueryName" CssClass="Required"/>
             </div>
             <div class="PanelFieldValue">
                <asp:linkbutton id="lbtnTransactionQueryName" runat="server" enabled="false" visible="false" cssclass="LinkButton" CausesValidation="true"/>
                <asiweb:StyledButton ID="btnGetQueryTransaction" runat="server" AutoPostBack="false" onclientclick="OpenObjectBrowser('AllowMultiSelect=false&DocumentPath=$/RFMAnalysis/DefaultSystem/Process Engines/User Queries&ShowHierarchyTree=false&AllowUpwardNavigation=true&TypeFilter=IQD,FOL&ShowSummary=false',TransactionQueryChanged);" CausesValidation="false" />
		        <asiweb:StyledButton ID="btnCreateQueryTransaction" runat="server" AutoPostBack="false" onclick="btnCreateQueryTransaction_ServerClick"/>
		        <asiweb:StyledButton ID="btnClearQueryTransaction" runat="server" CausesValidation="false" AutoPostBack="true" onclick="btnClearQueryTransaction_ServerClick"/>
             </div>
        </div>
	</asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
