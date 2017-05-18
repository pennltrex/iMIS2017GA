<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.ProviderEdit" Codebehind="ProviderEdit.ascx.cs" %>

<script type="text/javascript">
    function setSelectedCompetitor(radwindow) {
        if (radwindow.result) {
            var sc = document.getElementById('<%# selectedContact.ClientID %>');
            sc.value = radwindow.result;
            document.forms[0].submit();
        }
    }
</script>
<asiweb:PanelTemplateControl ID="MainPanel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None"
    TemplateTitle="Enter Provider">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="14em">
        <input type="hidden" id="selectedContact" runat="server" />
        <div class="PanelField">
            <asiweb:BusinessLabel ID="lblProvider" runat="server" AssociatedControlID="ProviderName" CssClass="Required" />
            <asiweb:BusinessTextBox ID="ProviderName" runat="server" ReadOnly="True" /> 
            <asiweb:AsiRequiredFieldValidator ID="ProviderRequired" runat="server" InitialValue="" ControlToValidate="ProviderName"
                 CssClass="Error" ErrorMessage="Required"></asiweb:AsiRequiredFieldValidator>      
            <asiweb:StyledButton id="btnContactLookup" Text="Select" runat="server" 
                OnClientClick="OpenPartyFinderAdderWithQueryFilter(setSelectedCompetitor, true, null, '$/ContactManagement/DefaultSystem/Queries/Contacts', null, null, null, null);return false;" />            
        </div>
        <asiweb:SmartControl runat="server" BoundPropertyName="LocationName" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="LocationStatusCode" DisplayCaption="true"/>        
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>