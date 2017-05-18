<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.CompetitorDefinition" Codebehind="CompetitorDefinition.ascx.cs" %>
<script type="text/javascript">
    function setSelectedCompetitor(radwindow) {
        if (radwindow.result) {
            var sc = document.getElementById('<%# selectedCompetitor.ClientID %>');
            sc.value = radwindow.result;
            document.forms[0].submit();
        }
    }
</script>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<input type="hidden" id="selectedCompetitor" runat="server" />
<asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" Text="Properties" Collapsed="false" FieldSet="true">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server">
        <div class="PanelField">
            <asiweb:BusinessLabel ID="lblCompetitor" runat="server" AssociatedControlID="btnCompetitor" CssClass="Required" />
            <asp:linkbutton id="btnCompetitor" runat="server" cssclass="LinkButton" ></asp:linkbutton>       
            <asiweb:StyledButton id="btnContactLookup" Text="..." runat="server" OnClientClick="OpenPartyFinderAdderWithQueryFilter(setSelectedCompetitor, true, null, '$/Common/Queries/Search/Competitor', null, null, null, null);return false;" />
            <asiweb:StyledButton id="btnContactClear" Text="X" runat="server" OnClick="btnContactClear_ServerClick" />  
        </div>
		<asiweb:SmartControl id="scDemoGivenFlag" runat="server"></asiweb:SmartControl>
		<asiweb:SmartControl id="scWonOpp" runat="server"></asiweb:SmartControl>
		<asiweb:SmartControl id="scNotes" runat="server"></asiweb:SmartControl>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>