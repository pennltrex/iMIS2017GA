<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationCreatorComposer.ascx.cs" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationCreatorComposer" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
    <ajaxsettings>
        <telerik:AjaxSetting AjaxControlID="ButtonSend">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="ContentHtmlEditor" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        
        <telerik:AjaxSetting AjaxControlID="TxtCc">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="TxtCc" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="TxtBcc">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="TxtBcc" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </ajaxsettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default" />
<h2><%=PageTitle%></h2>
<div runat="server" id="iPartContainer" translate="Yes">
    <fieldset>
        <div class="FloatRight AlignRight">
            <asiweb:StyledButton runat="server" ID="ButtonLoad" CausesValidation="False" />
            <asiweb:StyledButton runat="server" ID="ButtonSaveAs" CausesValidation="False" />
            <asiweb:StyledButton runat="server" ID="ButtonSave" CssClass="PrimaryButton" CausesValidation="False" />
            <br />
            <br />
            <asiweb:BusinessCheckBox runat="server" ID="AdvancedEmailCheckBox" Text="Advanced email" AutoPostBack="true" CssClass="PlusFeature" />
            <div style="display: none;">
                <asp:Button runat="server" ID="HiddenButtonSave" OnClick="HiddenButtonSave_OnClick" CausesValidation="False" Text=" "/>
                <asp:Button runat="server" ID="HiddenButtonSaveAs" OnClick="HiddenButtonSaveAs_OnClick" CausesValidation="False" Text=" "/>
                <asp:Button runat="server" ID="HiddenButtonLoad" OnClick="HiddenButtonLoad_OnClick" CausesValidation="False" Text=" "/>
                <asp:HiddenField runat="server" ID="HiddenDocumentPath" />
                <asp:HiddenField runat="server" ID="HiddenDocumentFile" />
                <asp:HiddenField runat="server" ID="HiddenDocumentId" />
                <asp:HiddenField runat="server" ID="HiddenCommunicationIdForTask" />
            </div>
        </div>
        <div runat="server" id="DivEmailHeader" class="PanelBlock">
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel ID="LabelFrom" runat="server" AssociatedControlID="TxtFrom" Text="From"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server"  onkeydown="disableEnterKey(this,event)" ID="TxtFrom" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" ValidateRequestMode="Disabled" />
                    <asiweb:AsiRequiredFieldValidator ID="RequiredValidatorFrom" runat="server" ControlToValidate="TxtFrom" ValidationGroup="PreviewSend" />
                    <asp:CustomValidator runat="server" ID="FromNameTooLong" Display="Dynamic" ClientValidationFunction="ValidateFromNameLength" ControlToValidate="TxtFrom" ErrorMessage="From name must be 50 characters or less in length." ValidationGroup="PreviewSend" />
                    <asp:CustomValidator runat="server" ID="FromEmailTooLong" Display="Dynamic" ClientValidationFunction="ValidateFromEmailLength" ControlToValidate="TxtFrom" ErrorMessage="From email address must be 64 characters or less in length." ValidationGroup="PreviewSend" />
                </div>
            </div>
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" AssociatedControlID="TxtTo" Text="To"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" onkeydown="disableEnterKey(this,event)" ID="TxtTo" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" ValidateRequestMode="Disabled" />
                    <asiweb:AsiRequiredFieldValidator ID="RequiredValidatorTo" runat="server" ControlToValidate="TxtTo" ValidationGroup="PreviewSend" />
                </div>
            </div>
            <div runat="server" id="CcInputDiv" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" AssociatedControlID="TxtCc" Text="Cc"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="TxtCc" onkeydown="disableEnterKey(this,event)" AutoPostBack="True" OnTextChanged="TxtCC_OnTextChanged" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" ValidateRequestMode="Disabled" />
                </div>
            </div>
            <div runat="server" id="BccInputDiv" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" AssociatedControlID="TxtBcc" Text="Bcc"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="TxtBcc" onkeydown="disableEnterKey(this,event)" AutoPostBack="True" OnTextChanged="TxtBcc_OnTextChanged" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" ValidateRequestMode="Disabled" />
                </div>
            </div>
            <div runat="server" id="CcAndBccLinkLine" class="PanelField Left">
                <div class="PanelFieldLabel"></div>
                <div class="PanelFieldValue">
                    <asp:HyperLink runat="server" ID="CcLink" NavigateUrl="javascript:ShowCcInput();" Text="Cc" Style="padding-right: 1.5em"></asp:HyperLink>
                    <asp:HyperLink runat="server" ID="BccLink" NavigateUrl="javascript:ShowBccInput();" Text="Bcc"></asp:HyperLink>
                </div>
            </div>
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel ID="LabelSubject" runat="server" AssociatedControlID="TxtSubject"
                        Text="Subject">
                    </asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="TxtSubject"  onkeydown="disableEnterKey(this,event)" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                    <asp:RegularExpressionValidator runat="server" ID="SubjectRegularExpressionValidator" ControlToValidate="TxtSubject"
                        Display="Dynamic" ErrorMessage="May not contain the characters '[()]'" ValidationExpression="[^\[\(\)\]]*"
                        ValidationGroup="PreviewSend" />
                </div>
            </div>
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel ID="LabelType" runat="server" AssociatedControlID="CommunicationTypeList" Text="Type"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" ID="CommunicationTypeList" RenderPanelField="False" DisplayCaption="False" />
                </div>
            </div>

            <div class="PanelField Left">
                <div class="PanelFieldLabel"></div>
                <div class="PanelFieldValue">
                    <asp:LinkButton runat="server" ID="ButtonModeSwitchLink" OnClick="ButtonModeSwitchOnClick" Text="" CausesValidation="False" Style="padding-right: 1.5em" />
                    <asp:LinkButton runat="server" ID="ButtonModeSwitchAdditionalLink" OnClick="ButtonModeSwitchOnClick" Text="" CausesValidation="False" />
                </div>
            </div>
        </div>
        <div style="clear: both;">
        </div>
    </fieldset>

    <asiweb:BusinessHtmlEditor ID="ContentHtmlEditor" runat="server"
        CssClass="ContentHtmlEditor" Width="100%" />

    <div id="AttachmentBlock" style="width: 100%; margin-left: auto; margin-right: auto">
        <div style="margin: 9px 0;">
            <asp:LinkButton runat="server" ID="AddAttachmentsButton" CausesValidation="True" />
        </div>

        <input type="hidden" id="SelectedSourceKey" runat="server" name="SelectedSourceKey" />
        <input type="hidden" id="SelectedSourcePath" runat="server" name="SelectedSourcePath" />
        <input type="hidden" id="SelectedSourceName" runat="server" name="SelectedSourceName" />
        <input type="hidden" id="SelectedFileType" runat="server" name="SelectedFileType" />
        <input type="hidden" id="SelectedRunOnce" runat="server" name="SelectedRunOnce" />

        <table runat="server" id="AttachmentList" class="SimpleTable AutoWidth">
            <tr runat="server" id="AttachmentListHeader" style="display: none;">
                <th id="AttachmentsHeader">Attachments</th>
            </tr>
            <tbody>
            </tbody>
        </table>

    </div>
    <br />
    <div style="float: right;">
        <asiweb:StyledButton runat="server" ID="ButtonPreview" OnClick="ButtonPreview_OnClick" ValidationGroup="PreviewSend" />
        <asiweb:StyledButton runat="server" CssClass="PrimaryButton" ID="ButtonSend" OnClick="ButtonSend_OnClick" ValidationGroup="PreviewSend" />
        <br />
        <asp:Label runat="server" ID="SendingMessageLabel" Style="display: none">This could take a minute or so...</asp:Label>
    </div>
    <div style="clear: both;">
    </div>
</div>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">

        //<![CDATA[
        // Create instance of Asi_Web_iParts_Communications_CommunicationCreator_Composer for this control
        if(typeof(<%#JavaScriptManagerVar%>)=='undefined') {
            <%#JavaScriptManagerVar%> = new Asi_Web_iParts_Communications_CommunicationCreator_Composer('<%# iPartContainer.ClientID%>','<%#AppRelativeTemplateSourceDirectory%>','<%# ButtonSend.ClientID %>','<%# HiddenButtonSave.ClientID %>','<%# HiddenButtonSaveAs.ClientID %>','<%# HiddenButtonLoad.ClientID %>', '<%# HiddenDocumentPath.ClientID %>', '<%# HiddenDocumentFile.ClientID %>', '<%# HiddenDocumentId.ClientID %>', '<%# SelectedSourceKey.ClientID%>', '<%# SelectedSourcePath.ClientID%>', '<%#SelectedFileType.ClientID%>', '<%#SelectedRunOnce.ClientID%>', '<%#AttachmentList.ClientID%>', '<%#ClientID%>', '<%#SelectedSourceName.ClientID%>');
    }
   
    function <%#ClientID%>_OnRadEditorLoad(editor) {

            <%#JavaScriptManagerVar%>.ContentHtmlEditor = editor;
        
        editor.get_filtersManager().add(new <%#ClientID%>_LinkFilter());
        // Add a custom filter to change the encoded brackets ("%5B" and "%5D") back into brackets ("[" and "]").
        // This is needed so that the 'iMIS variables' (e.g. "[Website]") get resolved (e.g. to "http://localhost/imis/MBR").
        // It is specific to IE (no idea why IE encodes those).
        editor.get_filtersManager().add(new <%#ClientID%>_HtmlSanitizerFilter());
    }
      
    function <%#ClientID%>_OnRadEditorModeChange(editor, args) {
            // enable the insertfield dropdown when in html mode
            if (editor.get_mode() == 2) {
                setTimeout(function () {
                    var insertFieldDropDown = editor.getToolByName("<%#ClientID%>_InsertField");
                if (insertFieldDropDown!=null) insertFieldDropDown.set_enabled(true);
                var insertCommunicationPreferencesDropDown = editor.getToolByName("<%#ClientID%>_InsertLink");
                if (insertCommunicationPreferencesDropDown!=null) insertCommunicationPreferencesDropDown.set_enabled(true);
            }, 0);
        }
    }

    <%#ClientID%>_HtmlSanitizerFilter = function () {
        <%#ClientID%>_HtmlSanitizerFilter.initializeBase(this);
        this.set_isDom(false); // Specify that the content parameter of the getHtmlContent and getDesignContent functions will return a String.
        this.set_enabled(true);
        this.set_name("Content Html filter");
        this.set_description("Converts encoded brackets back into brackets");
    };

    <%#ClientID%>_LinkFilter = function () {
        <%#ClientID%>_LinkFilter.initializeBase(this);
        this.set_isDom(false); // Specify that the content parameter of the getHtmlContent and getDesignContent functions will return a String.
        this.set_enabled(true);
        this.set_name("Link filter");
        this.set_description("Converts links");
    };

        // Generic filter for sanitizing the HTML
        <%#ClientID%>_HtmlSanitizerFilter.prototype = {
        // Called when the editor is moving from some other mode to HTML mode.
        getHtmlContent: function (content) {
            content = <%#JavaScriptManagerVar%>.HtmlSanitizer.unescapeSquareBrackets(content);
            content = <%#JavaScriptManagerVar%>.HtmlSanitizer.removeContentEditableFromBodyTag(content);
            return content;
        },
        // Called when the editor is moving from some other mode to DESIGN mode.
        getDesignContent: function (content) {
            content = <%#JavaScriptManagerVar%>.HtmlSanitizer.unescapeSquareBrackets(content);
            content = <%#JavaScriptManagerVar%>.HtmlSanitizer.removeContentEditableFromBodyTag(content);
            return content;
        }
    };

        <%#ClientID%>_LinkFilter.prototype = {
        //function executed when going into HTML mode and upon submit
        getHtmlContent: function(content)
        {
            //regual expression that will match opening A tag
            var regExp = new RegExp("<a[^>]*href=['\"][^>\"']*['\"][^>]*>", "gi");
            //current page domain name - to be excluded from the URL
            var domain = "http://" + window.location.host;
            //sub-folders path
            var path = window.location.pathname;
            path = path.substr(0, path.lastIndexOf("/") + 1);
 
            var newContent = content.replace(regExp, function(match, offset, fullText)
            {
                return match.replace(domain + path, "");
            });
            var decodedContent = newContent;
            // If any new variable is used, it should be added as a replace string below. NOTE: declare as a global variable for correct scope.
            decodedContent = decodedContent.replace("[~]", gWebRoot);
            decodedContent = decodedContent.replace("[Root]", gWebRoot);
            decodedContent = decodedContent.replace("[iMIS]", gWebRoot + "/iMIS");
            decodedContent = decodedContent.replace("[Common]", gWebRoot + "/AsiCommon");
            decodedContent = decodedContent.replace("[Theme]", gWebRoot + "/App_Themes/" + gPageTheme);
            decodedContent = decodedContent.replace("[Website]", gWebSiteRoot);
            return decodedContent;
        },
        // Called when the editor is moving from some other mode to DESIGN mode.
        getDesignContent: function (content) {
            var decodedContent = content;
            // If any new variable is used, it should be added as a replace string below. NOTE: declare as a global variable for correct scope.
            decodedContent = decodedContent.replace("[~]", gWebRoot);
            decodedContent = decodedContent.replace("[Root]", gWebRoot);
            decodedContent = decodedContent.replace("[iMIS]", gWebRoot + "/iMIS");
            decodedContent = decodedContent.replace("[Common]", gWebRoot + "/AsiCommon");
            decodedContent = decodedContent.replace("[Theme]", gWebRoot + "/App_Themes/" + gPageTheme);
            decodedContent = decodedContent.replace("[Website]", gWebSiteRoot);
            return decodedContent;
        }
    }
    
        function <%#ClientID%>_DeleteAttachment(id) {
            if (!confirm("Remove Attachment " + id + " from the list?")) {
                alert("Attachment not removed");
                return;
            }
            // delete row and rebuild table
            <%#JavaScriptManagerVar%>.DeleteAttachmentAndRebuildTable(id);     
    }

    <%#ClientID%>_LinkFilter.registerClass('<%#ClientID%>_LinkFilter', Telerik.Web.UI.Editor.Filter);
        <%#ClientID%>_HtmlSanitizerFilter.registerClass('<%#ClientID%>_HtmlSanitizerFilter', Telerik.Web.UI.Editor.Filter);
    

        Telerik.Web.UI.Editor.CommandList["<%#ClientID%>_InsertField"] = <%#JavaScriptManagerVar%>.InsertPlaceHolder;
        Telerik.Web.UI.Editor.CommandList["<%#ClientID%>_InsertLink"] = <%#JavaScriptManagerVar%>.InsertLinksDropDown;
         
        function ShowCcInput() {
            jQuery("#<%=CcInputDiv.ClientID%>").show();
        jQuery("#<%=TxtCc.ClientID%>").focus();
        jQuery("#<%=CcLink.ClientID%>").hide();
        // If the Bcc link is invisible, hide the entire line that the links are on
        if (!jQuery("#<%=BccLink.ClientID%>").is(":visible")) {
            jQuery("#<%=CcAndBccLinkLine.ClientID%>").hide();
        }
    }
         
    function ShowBccInput() {
        jQuery("#<%=BccInputDiv.ClientID%>").show();
        jQuery("#<%=TxtBcc.ClientID%>").focus();
        jQuery("#<%=BccLink.ClientID%>").hide();
        // If the Cc link is invisible, hide the entire line that the links are on
        if (!jQuery("#<%=CcLink.ClientID%>").is(":visible")) {
            jQuery("#<%=CcAndBccLinkLine.ClientID%>").hide();
        }
    }

    function ValidateFromNameLength(oSrc, args) {
        var fromName = args.Value;
        var beginIndex = fromName.indexOf("<");
        if (beginIndex > -1) {
            fromName = fromName.substring(0, beginIndex);
        } else {
            fromName = "";
        }
        fromName = fromName.trim();
        args.IsValid = fromName.length <= 50;
    }

    function ValidateFromEmailLength(oSrc, args) {
        var fromAddress = args.Value;
        fromAddress = fromAddress.replace(/;\s*$/, "");
        var beginIndex = fromAddress.indexOf("<");
        if (beginIndex > -1) {
            var endIndex = fromAddress.indexOf(">");
            if (endIndex > -1) {
                fromAddress = fromAddress.substring(beginIndex + 1, endIndex);
            }
        }
        fromAddress = fromAddress.trim();
        args.IsValid = fromAddress.length <= 64;
    }

    var currentLoadingPanel = null;
    var currentUpdatedControl = null;
    var buttonModeSwitchLinkHref = null;
    var buttonModeSwitchAdditionalLinkHref = null;

    function <%#ClientID%>_RequestStart() {
        //Show the loading panel over the html editor control
        currentLoadingPanel = $find("<%= RadAjaxLoadingPanel1.ClientID %>");
        currentUpdatedControl = "<%= ContentHtmlEditor.ClientID %>";        
        currentLoadingPanel.show(currentUpdatedControl);
        //Change the "Send Now" button to read "Sending..."
        document.getElementById("<%#ButtonSend.ClientID%>").value = 'Sending...';
        //Disable clickable input controls
        wait();
        //Show the sending message label
        document.getElementById("<%#SendingMessageLabel.ClientID%>").style.display = 'block';
        //Disable the "Choose Recipients" and "Additional Data Sources" links, store the old hrefs
        var buttomModeSwitchLink = document.getElementById("<%#ButtonModeSwitchLink.ClientID%>");
        buttonModeSwitchLinkHref = buttomModeSwitchLink.href;
        buttomModeSwitchLink.href = "javascript: void(0)";
        var buttonModeSwitchAdditionalLink = document.getElementById("<%#ButtonModeSwitchAdditionalLink.ClientID%>");
        buttonModeSwitchAdditionalLinkHref = buttonModeSwitchAdditionalLink.href;
        buttonModeSwitchAdditionalLink.href = "javascript: void(0)";
    }
    function <%#ClientID%>_ResponseEnd() {
            //hide the loading panel and clean up the global variables
            if (currentLoadingPanel != null)
                currentLoadingPanel.hide(currentUpdatedControl);          
            currentUpdatedControl = null;
            currentLoadingPanel = null;
            //Change the "Send Now" button back to its default text
            document.getElementById("<%#ButtonSend.ClientID%>").value = 'Send Now';
        //Re-enable clickable input controls
        waitStop();
        //Hide the sending message label
        document.getElementById("<%#SendingMessageLabel.ClientID%>").style.display = 'none';
        //Reset the "Choose Recipients" and "Additional Data Sources" links to their original hrefs
        var buttomModeSwitchLink = document.getElementById("<%#ButtonModeSwitchLink.ClientID%>");
        buttomModeSwitchLink.href = buttonModeSwitchLinkHref;
        var buttonModeSwitchAdditionalLink = document.getElementById("<%#ButtonModeSwitchAdditionalLink.ClientID%>");
        buttonModeSwitchAdditionalLink.href = buttonModeSwitchAdditionalLinkHref;
    }
    //]]>
    </script>
</telerik:RadCodeBlock>