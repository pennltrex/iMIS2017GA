<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactProfilePictureDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiwc" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register tagPrefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>

<asp:Panel ID="panContent" runat="server" HorizontalAlign="Center" Visible="false" translate="yes">

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            //<![CDATA[
            // Create the event handlers for PageRequestManager
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(PageRequestManager_initializeRequest);            
            function PageRequestManager_initializeRequest(sender, args) {
                if (sender.get_isInAsyncPostBack()) {
                    args.set_cancel(true);
                }
            }

            function <%#ClientID%>_ReturnFocusToTooltipDialog(e) {                            
                var modalOverlay = jQuery(".TelerikModalOverlay");
                if (modalOverlay.is(':visible')) {                               
                    var fileButton = jQuery('.ruFileInput');
                    // if they haven't selected a picture, put focus on select button
                    if (fileButton.is(':visible')) {
                        fileButton.focus();    
                    } else {
                        // else if a picture has been selected then 
                        // put focus on the submit button
                        var submitButton = jQuery('.PrimaryButton');
                        submitButton.focus();
                    }
                }
            }
     
            function HideTooltip() {        
                <%#ClientID%>_ResetFields();               
                var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
                if (tooltip) {
                    tooltip.hide();
                    jQuery(".rbImageButton").off("focus", <%#ClientID%>_ReturnFocusToTooltipDialog);
                }                  
            }
                    
            // This function is used with Caption control for the MenuClick event - We need to make sure that name is UNIQUE within a page.
            function <%#ClientID%>_OnClientMenuClick(MenuText, MenuValue) {                         
                if(MenuValue != null && MenuValue == 1)
                    var tooltip = $find("<%#toolTip1.ClientID%>");  

                if (tooltip != null) {
                    tooltip.show();
                    jQuery(".rbImageButton").on("focus",<%#ClientID%>_ReturnFocusToTooltipDialog);
                }
                return false;                       
            }
               
            function <%#ClientID%>_ResetFields() { 
                // Remove the error message
                jQuery(".UploadInvalid").hide();
      
                // Reset the remove checkbox
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>"); 
                chkBox.checked = false;
                chkBoxLabel.disabled = false;
            
                // Disable Save & Cancel button
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                // Enable the upload
                var upload = $get("<%#AsyncUpload1.ClientID%>");
                upload.disabled = false;                                
            }        
        
            function <%#ClientID%>_ClientHide() {             
                jQuery(".UploadInvalid").hide();
      
                // Reset the remove checkbox
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>"); 
                chkBox.checked = false;
                chkBoxLabel.checked = false;
            
                // Disable Save & Cancel button
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                // Enable the upload
                var upload = $get("<%#AsyncUpload1.ClientID%>");
                upload.disabled = false;                  
            }    
         
            function <%#ClientID%>_clientFileUploading(sender, args) {
                jQuery(".UploadInvalid").hide();
                      
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = false;
            
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
                setCheckInputDisabled(chkBox, chkBoxLabel);
            }
        
            function <%#ClientID%>_clientValidationFailed(sender, args) {        
                jQuery(".UploadInvalid").show();
            
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>"); 
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
                setCheckInputDisabled(chkBox, chkBoxLabel);
            } 
        
            function <%#ClientID%>_clientClearing(sender, args) {      
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            } 
        
            function <%#ClientID%>_clientFileUploadRemoving(sender, args) {           
                // Clean up the input field so that a blind save does not happen
                jQuery(".UploadInvalid").hide();
          
                // Disable the Save & Close button and checkbox when the field are cleared
                var submit = $get("<%#submit.ClientID%>");         
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
            
                submit.disabled = true;
                                  
                var image = $get("<%#profileImage.ClientID%>");
                if (image != undefined && image.nameProp != undefined) {
                    if (image.nameProp != "default_profile.png") {
                        chkBox.checked = false;
                        chkBox.disabled = false;
                        chkBoxLabel.disabled = false;                 
                    }
                }
            
                var imagePre = $get("<%#profileImagePreview.ClientID%>");
                if (imagePre != undefined && imagePre.nameProp != undefined) {
                    if (imagePre.nameProp != "default_profile.png") {
                        chkBox.checked = false;
                        chkBox.disabled = false;
                        chkBoxLabel.disabled = false;                 
                    }
                }                                  
            } 
        
            function <%#ClientID%>_clientShow(sender, args) {
                // Disable the Save & Close button when the tooltip is shown
                var submit = $get("<%#submit.ClientID%>");
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
                //submit.disabled = true; 
                sender.updateClientState();
            
                var image = $get("<%#profileImage.ClientID%>");
                if (image != null) {
                    if (image.nameProp == "default_profile.png") {
                        setCheckInputDisabled(chkBox, chkBoxLabel);
                    }
                }
            
                var imagePre = $get("<%#profileImagePreview.ClientID%>");
                if (imagePre != null) {
                    if (imagePre.nameProp == "default_profile.png") {
                        setCheckInputDisabled(chkBox, chkBoxLabel);
                    }
                }             
            
                if (chkBox.disabled) {
                    chkBoxLabel.disabled = true;                    
                }                                              
            } 
        
            function <%#ClientID%>_updateSubmitState() {      
                // Enable/Disable the Save & Cancel button and input field 
                // when the "Remove profile picture" checkbox is changed
                var submit = $get("<%#submit.ClientID%>");
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var upload = $get("<%#AsyncUpload1.ClientID%>"); 

                if (chkBox.checked ){
                    submit.disabled = false; 
                    upload.disabled = true;
                }
                else {
                   // don't disable the save button once enabled submit.disabled = true; 
                    upload.disabled = false;
                }                                                
            }

            function CallFacebookLogin(url, title, args) {
                if (typeof (<%#ClientID%>_jsmanager) != 'undefined') {
                    <%#ClientID%>_jsmanager.showLogin(url, title, args);
                } 
            }

            function setUser(user) {
                setTimeout(function() {}, 1000);
                if (user.id != null && user.id != "undefined") {
                    document.getElementById('<%= FacebookIDHiddenField.ClientID %>').value = user.id;
                    document.getElementById('<%= UserHiddenField.ClientID %>').value = JSON.stringify(user);
                    if (document.getElementById('<%= UserHiddenField.ClientID %>').value !== "")
                        document.getElementById('<%= facebookButton.ClientID %>').click();
                } else {
                    alert('User error');
                }
            }

            function RemoveFile() {
                jQuery(".UploadInvalid").hide();
            }

            // small checkbox input helper function to convey
            // unusability of the element to the user
            function setCheckInputDisabled(box, label) {
                box.checked = false;
                box.disabled = true;
                label.disbaled = true;
                jQuery(label).css("opacity", "0.6");
            }
            //]]>   
        </script>    
    </telerik:RadCodeBlock>   

    <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="50" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>
    
    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server"> 
        <AjaxSettings> 
            <telerik:AjaxSetting AjaxControlID="submit"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" />            
                </UpdatedControls> 
            </telerik:AjaxSetting>                                                     
        </AjaxSettings>         
    </telerik:RadAjaxManagerProxy>
    
    <asiweb:BusinessLabel id="designMode" runat="server" Visible="false" CssClass="Information" />
    
    <telerik:RadAjaxPanel id="RadAjaxPanel1" LoadingPanelID="loadingPanel" runat="server">
    
        <asiweb:BusinessLabel id="errorText" runat="server" CssClass="Error" />                                      
        <asp:Image runat="server" id="profileImage" BorderWidth="0" Visible="false"  />
        <asp:HiddenField ID="FacebookIDHiddenField" runat="server" />
        <asp:HiddenField ID="AccessTokenHiddenField" runat="server"/>
        <asp:HiddenField ID="UserHiddenField" runat="server" />
        <telerik:RadBinaryImage runat="server" ResizeMode="Fit" id="profileImagePreview" BorderWidth="0px" ImageAlign="Middle" Visible="false" /> 
                  
    </telerik:RadAjaxPanel> 
                           
    <telerik:RadToolTip runat="server" id="toolTip1" Position="BottomLeft" OffsetX="-13" Modal="true" 
        Animation="None" ShowEvent="FromCode" 
        ShowDelay="0" ShowCallout="false"     
        HideEvent="ManualClose" RelativeTo="Mouse" Visible="false" Enabled="false"> 

        <asp:UpdatePanel ID="panMain" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
        
            <ContentTemplate>
                                                                   
                <div runat="server" ID="facebookButtonDiv" class="PanelField AutoWidth Left FloatNone" >
                        
                    <Button runat="server" ID="facebookButton" data-providername="Facebook"
                        CausesValidation="False" OnServerClick="FacebookButton_OnClick" 
                        class="TextButton SignInButton Facebook"><i></i>Use Facebook profile photo</Button>                                             
                        
                    <div class="Center">
                        <img id="facebookPic" alt="facebook picture" runat="server" Visible="False" />  
                        <asp:panel id="facebookPictureSuccess" runat="server" CssClass="Info" Visible="False" />          						    
                    </div>

                    <div class="LineThruContainer" id="LineThruContainerDiv" runat="server" Visible="True">
                        <div class="LineThruBlock">
                            <strong class="LineThru">or</strong>   
                        </div>
                    </div>

                </div>
                 <div runat="server" ID="linkedInButtonDiv" class="PanelField AutoWidth Left FloatNone" >
                        
                    <Button runat="server" ID="linkedInButton" data-providername="LinkedIn"
                        CausesValidation="False" OnServerClick="LinkedInButton_OnClick" 
                        class="TextButton SignInButton LinkedIn"><i></i>Use LinkedIn profile photo</Button>                                             
                        
                    <div class="Center">
                        <img id="linkedInPic" alt="linkedin picture" runat="server" Visible="False" />  
                        <asp:panel id="linkedInPictureSuccess" runat="server" CssClass="Info" Visible="False" />          						    
                    </div>

                    <div class="LineThruContainer" id="LineThruContainerDiv2" runat="server" Visible="True">
                        <div class="LineThruBlock">
                            <strong class="LineThru">or</strong>   
                        </div>
                    </div>

                </div>
                <div style="clear:both;"></div>

                <div runat="server" id="iMISPicturePanel" >                   
                    <asiweb:BusinessLabel runat="server">Upload picture</asiweb:BusinessLabel>
                    <telerik:RadAsyncUpload runat="server" id="AsyncUpload1" 
                        MaxFileInputsCount="1" 
                        OnFileUploaded="AsyncUpload1_FileUploaded" 
                        ControlObjectsVisibility="none"
                        MultipleFileSelection="Disabled"
                        DisablePlugins="true"
                        OnClientFileUploadRemoved="RemoveFile" /> 
                    <div style="clear:both;"></div>                    
                    <div class="RadAsyncUpload RadUpload UploadInvalid" style="display: none;">
                        <ul class="ruInputs">
                            <li><span class="ruFileWrap ruStyled"><span class="ruUploadProgress ruUploadFailure"><asp:Label runat="server" ID="InvalidSizeTypeLabel"></asp:Label></span></span></li>
                        </ul>
                    </div>                                                               
                    <p><asiweb:BusinessLabel runat="server" id="allowedTypes" /></p>
                    <p><asiweb:BusinessLabel runat="server" id="fileSizeLimit" /></p>                    
                    <div class="Section">
                        <asp:CheckBox runat="server" ID="checkBoxDeleteImage" /> <asp:Label ID="labelDeleteImage" AssociatedControlID="checkBoxDeleteImage" runat="server"></asp:Label>                                                
                    </div>
                </div>

                <div class="FloatRight">
                    <asp:Button id="submit" Text="Save & Close" runat="server" OnClick="SubmitClick" CssClass="TextButton PrimaryButton" />
                    <asp:Button id="cancel" runat="server" Text="Cancel" OnClientClick="HideTooltip(); return false;" CausesValidation="false" CssClass="TextButton" />   
                </div>        
             
                <asiweb:BusinessLabel ID="altText" runat="server" Visible="false" />
                <asiweb:BusinessTextBox ID="altTextDescription" runat="server" TextMode="SingleLine" EnableViewState="true" Enabled="false" Visible="false" />
                                                  
            </ContentTemplate>
        
        </asp:UpdatePanel>
                                                      
    </telerik:RadToolTip>
                                     
</asp:Panel>

<asp:Panel ID="panHider" Visible="false" runat="server">
    <asp:Label ID="label1" runat="server" CssClass="Information">To render please uncheck "Do Not Render In Design Mode" checkbox on the configuration page.</asp:Label>
</asp:Panel>
