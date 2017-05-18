<%@ Control Language="c#" AutoEventWireup="true"  Inherits="Asi.Web.iParts.Website.AsiControls.ContactProxyPanel" Codebehind="ContactProxyPanel.ascx.cs" %>

<script type="text/javascript">
//<![CDATA[
    // JavaScript to Display Finder interface
    function TargetFinderCallBackFunction(radwindow) {
        var contactKey;
        if (radwindow.newContactKey != null) 
            contactKey = radwindow.newContactKey; // We are creating a new contact via the "Add a contact" window 
        else { // We are using a preexisting contact
            var result = radwindow.result;
            if (result != null)
                contactKey = result[0];
        }           
        if (contactKey) {            
            var contactSelectedKey = window.$get('<%= ContactSelectedKey.ClientID %>');
            contactSelectedKey.value = contactKey;
            var elm = window.$get('<%= setProxyButton.ClientID %>');
            if (elm != null)
                elm.click();    
        }
    }
    function TargetSelectOpenFinderAdder() {         
        // Add security check to Prevent Dialog            
        OpenPartyFinderAdderWithQueryFilter(TargetFinderCallBackFunction, true, null, '$/ContactManagement/DefaultSystem/Queries/Contacts', null, null, null, null, null, null, "True", '1'); 
    } 
//]]>
</script>

<%--So here we have few cases:
1. User not logged in, or non-staff logged in
2. Staff logged in, no proxy set
3. Staff logged in, has proxy set
--%>   
<asp:Panel ID="panLoggedIn" runat="server">
    <asp:Panel runat="server" ID="OBOHeader" CssClass="obo-label">
        <asp:Label runat="server" ID="OBOHeaderLabel" Text="On Behalf Of" />
    </asp:Panel>
    <asp:Panel runat="server" ID="OBONotSetPanel" CssClass="obo-actions">
        <asp:LinkButton runat="server" ID="SelectContactButton" Text="(select)" CausesValidation="False" OnClientClick="TargetSelectOpenFinderAdder(); return false;"/>
    </asp:Panel>
    <ul runat="server" ID="OBOSetPanel" Visible="False" class="obo-actions">
        <li><asp:HyperLink runat="server" ID="TargetNameLink" /></li>
        <li><asp:LinkButton runat="server" ID="ChangeContactButton" Text="Change" ToolTip="Change on behalf of contact" OnClientClick="TargetSelectOpenFinderAdder(); return false;" CssClass="obo-action obo-change-contact" /></li>
        <li><asp:linkButton runat="server" ID="ClearContactButton" Text="Clear" ToolTip="Clear on behalf of" OnClick="ResetProxyButton_Click" CausesValidation="false" CssClass="obo-action obo-clear" /></li>
    </ul>
</asp:Panel>
<asp:Panel ID="hidden" runat="server" style="display: none" aria-hidden="true">
    <input type="hidden" id="ContactSelectedKey" runat="server" />
    <asp:Button ID="setProxyButton" runat="server" OnClick="SelectProxyButton_Click" CausesValidation="false" aria-hidden="true" Text="Set Proxy" />
</asp:Panel>