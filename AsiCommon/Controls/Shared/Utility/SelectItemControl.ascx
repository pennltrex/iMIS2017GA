<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.SelectItemControl"  Codebehind="SelectItemControl.ascx.cs" %>
<asp:UpdatePanel ID="up1" runat="server">
<ContentTemplate>
    <asp:Panel ID="panContentItem" CssClass="PanelField" runat="server">
        <asp:Panel ID="panLabel" runat="server" style="Float:left">
            <asiweb:BusinessLabel ID="ContentItemLabel" runat="server" AssociatedControlID="ContentItemControl" style="white-space: normal;" CssClass="Required" ></asiweb:BusinessLabel>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" style="Float:left;Width:auto!Important;" CssClass="PanelFieldValue" >
            <asiweb:BusinessTextBox ID="ContentItemControl" runat="server" AutoPostBack="true" CausesValidation="true" style="min-width:25em;"></asiweb:BusinessTextBox>
            <asp:Panel ID="panErrs" runat="server" style="clear:both; float:none;">
            <asp:CustomValidator  
                ID="ContentItemControlValidator" 
                runat="server"
                ControlToValidate="ContentItemControl"
                Display="Dynamic"
                ValidateEmptyText="true"
                OnServerValidate="ValidateContentItemEntry_Validation">
            </asp:CustomValidator>
            <asp:RequiredFieldValidator ID="ReqValidator" runat="server" ControlToValidate="ContentItemControl"
                Display="Dynamic" ValidateEmptyText="true" text=""></asp:RequiredFieldValidator>
            </asp:Panel>

        </asp:panel>
        
        <asp:Panel ID="Panel2" runat="server" style="Float:Left">
            <div style="float: left; padding-left: 1em;"><asp:LinkButton ID="SelectContentItemLink" runat="server" ></asp:LinkButton></div>
            <div style="float: left; padding-left: 1em;"><asp:LinkButton ID="PreviewContentLink" runat="server" ></asp:LinkButton></div>
        </asp:Panel>
            
        
            <asp:HiddenField ID="ContentKey" runat="server"/>
            <asp:Button ID="HiddenRefresher" runat="server" style="display: none" CausesValidation="true" />
        
        
    </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>    

    <script type="text/javascript" >
    <asp:Literal ID="JSPrefixCDATAOpen" runat="server"></asp:Literal>
    var <asp:Literal ID="JSPrefix1" runat="server"></asp:Literal>_KeyControlClientID = ""; //ID of the hidden field that stores ID
    var <asp:Literal ID="JSPrefix2" runat="server"></asp:Literal>_PanelControlClientlID = ""; // ID if the DIsplay element (textbox) to display selection results
    var <asp:Literal ID="JSPrefix3" runat="server"></asp:Literal>_RefresherID = ""; // Id of the hidden button which will refresh the form

    // Main calling function that will display Object Browser window.
    function <asp:Literal ID="JSPrefix4" runat="server"></asp:Literal>SelectDocumentObject(OpenParams, KeyControlID, PanelControlID, RefreshControlID) {
        // First of all we need to find Proper Client IDs so getElementById in the call back function will work

        <asp:Literal ID="JSPrefix5" runat="server"></asp:Literal>_KeyControlClientID = <asp:Literal ID="JSPrefix6" runat="server"></asp:Literal>FindControlbyID(KeyControlID);
        <asp:Literal ID="JSPrefix7" runat="server"></asp:Literal>_PanelControlClientlID = <asp:Literal ID="JSPrefix8" runat="server"></asp:Literal>FindControlbyID(PanelControlID);
        <asp:Literal ID="JSPrefix9" runat="server"></asp:Literal>_RefresherID = <asp:Literal ID="JSPrefix10" runat="server"></asp:Literal>FindControlbyID(RefreshControlID);

        OpenObjectBrowser(OpenParams, <asp:Literal ID="JSPrefix12" runat="server"></asp:Literal>SetDocumentObject, true);
    }


    // Returns Client iID of the Form Element with ID ending : <ControlID>
    function <asp:Literal ID="JSPrefix13" runat="server"></asp:Literal>FindControlbyID(ControlID) {
        var _controlID = "";
        // So here we need to loop through all controls on the form and find controls that will end with        
        var _tmp = "";
        for (i = 0; i < document.forms[0].elements.length; i++) {
            _tmp = document.forms[0].elements[i].id;
            //            alert("ID: "  + _tmp);
            if (_tmp.length >= ControlID.length && _tmp.substr(_tmp.length - ControlID.length, _tmp.length) == ControlID) {
                _controlID = document.forms[0].elements[i].id;
                break;
            }
        }
        return _controlID;
    }

    /// Returns Client iID of the Form Hyperlink control with ID ending : <ControlID>
    function <asp:Literal ID="JSPrefix14" runat="server"></asp:Literal>FindHyperlinkbyID(ControlID) {
        var _controlID = "";
        // So here we need to loop through all controls on the form and find controls that will end with
        var _tmp = "";
        var links = document.getElementsByTagName("a");

        if (links != null) {
            for (i = 0; i < links.length; i++) {
                _tmp = links[i].id;
                if (_tmp.length >= ControlID.length && _tmp.substr(_tmp.length - ControlID.length, _tmp.length) == ControlID) {
                    _controlID = links[i].id;
                    break;
                }
            }
        }
        return _controlID;
    }

    // Call Back Function
    function <asp:Literal ID="JSPrefix15" runat="server"></asp:Literal>SetDocumentObject(window, documentKey) {

        var helper = document.getElementById(<asp:Literal ID="JSPrefix16" runat="server"></asp:Literal>_KeyControlClientID);
        var helper2 = document.getElementById(<asp:Literal ID="JSPrefix17" runat="server"></asp:Literal>_PanelControlClientlID);

        if (window.result != null && window.result != "") {
            helper.value = window.result;
            helper2.value = window.SelectedDocumentPath;
            // may be we should submit the form so it will be refreshed.
            if (document.getElementById(<asp:Literal ID="JSPrefix18" runat="server"></asp:Literal>_RefresherID) != null) {
                document.getElementById(<asp:Literal ID="JSPrefix19" runat="server"></asp:Literal>_RefresherID).click();
            }

        }
    }





    //Trim function for string.
    String.prototype.trim = function() {
        return this.replace(/^\s*/, "").replace(/\s*$/, "");
    }

<asp:Literal ID="JSPrefixCDATAClose" runat="server"></asp:Literal>
    
</script>
