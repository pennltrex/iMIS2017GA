<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommunicationLinkEdit.aspx.cs" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationLinkEdit" %>

<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>

<asp:content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">

<script type="text/javascript" >
    // Whenever the choice of WebsiteDropDownList changes, run the function "OnWebsiteDropDownListChange"
    jQuery(function () { jQuery("#<%=WebsiteDropDownList.ClientID%>").change(OnWebsiteDropdownListChange); });

    function OnWebsiteDropdownListChange() {
        // Update the preview href link and visible link
        jQuery("#PreviewPreferencesLink").prop("href", ConstructPreferencesLink()); // Where the link takes you
        var preferencesLinkText = jQuery("#<%=CommunicationPreferencesLinkTextBox.ClientID%>").val();
        var preferencesLinkTextSanitized = SanitizeText(preferencesLinkText);
        jQuery("#PreviewPreferencesLink").text(preferencesLinkTextSanitized); // The link you see on-screen
        jQuery("#PreviewPreferencesUrl").text(ConstructPreferencesLink());
    }

    // Make sure we don't allow any html/javascript into the visible text
    function SanitizeText(textVariable) {
        var tempDivElement = document.createElement("div");
        tempDivElement.innerHTML = textVariable;
        return tempDivElement.textContent || tempDivElement.innerText;
    }

    // close the dialog and insert link
    function ConstructPreferencesLinkHtml() {

        if (!Page_ClientValidate()) return false;

        var preferencesLinkText = jQuery("#<%=CommunicationPreferencesLinkTextBox.ClientID%>").val();
        var preferencesLinkTextSanitized = SanitizeText(preferencesLinkText);
        var preferencesLinkHtml = "<a href='" + ConstructPreferencesLinkWithToken() + "'>" + preferencesLinkTextSanitized + "</a>";

        var w = GetRadWindow();
        if (w == null) return;
        var r = ConstructResultsObject();
        r.CommunicationPreferencesLink = preferencesLinkHtml;
        w.AsiResults = r;
        w.Close();
    }

    // construct the return object where we store the "CommunicationPreferencesLink" value and hand it back to the WYSIWYG editor in the CommunicationCreator
    function ConstructResultsObject() {
        return {
            CommunicationPreferencesLink: ""
        };
    }

    function CloseWindowCancel() {
        var w = GetRadWindow();
        if (w == null) return;
        w.Close();
    }

    // Create a simple link to the communication preferences page (without the <a href> nor the "CPToken" variable)
    function ConstructPreferencesLink() {
        var url = jQuery("#<%=WebsiteDropDownList.ClientID%>").val();
        if (url != '') return url + "communicationpreferences";
        return '';
    }

    // Create the full link to the communication preferences page, including the CPToken string which will be replaced downstream
    function ConstructPreferencesLinkWithToken() {
        return ConstructPreferencesLink() + "?CPToken={communicationpreferencestoken party.PartyId}";
    }

</script>

    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None" TemplateTitle=''>
        
        <asp:Label id="LabelCommunicationPreferencesInstructions" runat="server" Text="" visible="true"></asp:Label><br />&nbsp;<br />

        <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" /> 

        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelCommunicationPreferencesLinkTextBoxName" Text='<%# ResourceManager.GetPhrase("Link text", "Link text")%>' EnableViewState="true" AssociatedControlID="CommunicationPreferencesLinkTextBox"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="CommunicationPreferencesLinkTextBox" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>
                <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="CommunicationPreferencesLinkTextBox"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>

        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelCommunicationPreferencesLinkDefaultWebsite" Text='<%# ResourceManager.GetPhrase("Default website", "Default website")%>' EnableViewState="true" AssociatedControlID="WebsiteDropDownList"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList AutoPostBack="false" ID="WebsiteDropDownList" runat="server" ToolTip="The website the communication preferences link will use."/>
                <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="WebsiteDropDownList"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>
        <div style="clear:both"></div>
        <asp:Panel runat="server" ID="PreviewPreferencesLinkBlock" CssClass="NeutralShading ClearFix">
            <div class="PanelField Left">
                <span class="Label">Link preview</span> <div class="PanelFieldValue"><a id="PreviewPreferencesLink" href="#" target="_blank"></a></div>
            </div>
            <div class="PanelField Left">
                <span class="Label">URL</span>          <div class="PanelFieldValue"><asiweb:StyledLabel runat="server" id="PreviewPreferencesUrl"  ></asiweb:StyledLabel></div>
            </div>
        </asp:Panel>
                               
        <div style="clear:both;"></div>  
        <div style="float: right">                          
            <asiweb:StyledButton runat="server" CssClass="PrimaryButton" ID="OkButtonSend" OnClientClick="javascript:ConstructPreferencesLinkHtml();" Text="OK" />
            <asiweb:StyledButton runat="server" CssClass="TextButton" ID="CancelButtonSend" OnClientClick="javascript:CloseWindowCancel();" Text="Cancel" />
        </div>

     
    </asiweb:PanelTemplateControl>
</asp:content>
