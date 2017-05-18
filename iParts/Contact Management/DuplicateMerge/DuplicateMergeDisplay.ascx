<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DuplicateMergeDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.DuplicateMerge.DuplicateMergeDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:UpdatePanel ID="ContactMergeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" translate="yes">
    <ContentTemplate>
       <asiweb:Lister2 runat="server" ID="ContactMergeGrid" CssClass="FloatLeft" HeaderVisible="False" Wrap="True" AjaxEnabled="True" 
            OnItemDataBound="ContactMergeGridOnItemDataBound" PagingEnabled="true" Width="100%" PageSize="1000" />     
        <input type="hidden" id="SecondContactPartyId" runat="server" value='' />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="SelectDuplicateContactButton" />
        <asp:AsyncPostBackTrigger ControlID="SwitchContactsLink" />
    </Triggers>
</asp:UpdatePanel>
    
<input type="hidden" id="ContactToKeepPartyId" runat="server" value='' />
<input type="hidden" id="FirstContactPartyId" runat="server" value='' />
    
<input type="hidden" id="SelectDuplicateContactButtonId" runat="server" value='' />
<input type="hidden" id="SwitchContactsLinkId" runat="server" value='' />
    
<asp:Button runat="server" ID="SelectDuplicateContactButton" OnClick="SelectDuplicateContactButton_Click" Text="Select Contact" CssClass="hidden" />
<asp:Button runat="server" ID="SwitchContactsLink" OnClick="SwitchContactsLink_Click" Text="Switch Contacts" CssClass="hidden" />

<asp:Button runat="server" ID="HiddenMergeButton" onClick="HiddenMergeButton_Click" CssClass="hidden" />
<asp:Button runat="server" ID="HiddenNotDuplicatesButton" onClick="HiddenNotDuplicatesButton_Click" CssClass="hidden" />

<script type="text/javascript">

    // Create the event handlers for PageRequestManager
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_initializeRequest(PageRequestManager_initializeRequest);
    prm.add_beginRequest(PageRequestManager_beginRequest);
    prm.add_endRequest(PageRequestManager_endRequest);

    var uiId = '';
    function PageRequestManager_initializeRequest(sender, args) {
        if (sender.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function PageRequestManager_beginRequest(sender, args) {
        var postbackElem = args.get_postBackElement();
        uiId = postbackElem.id;
        postbackElem.disabled = true;
    }
    function PageRequestManager_endRequest(sender, args) {
        $get(uiId).disabled = false;
        if (args.get_error() != undefined) {
            var error = args.get_error().name;
            if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                args.set_errorHandled(true);

            document.getElementById(uiId).focus();
        }
    }

</script>