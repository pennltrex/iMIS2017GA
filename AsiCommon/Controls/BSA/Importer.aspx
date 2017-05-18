<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.BSA.Importer" MasterPageFile="~/Templates/MasterPages/Empty.master" Codebehind="~/AsiCommon/Controls/BSA/Importer.aspx.cs" %>
<%@ Import Namespace="Asi.Web" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <%--Need for this control to prevent button from wrapping in the file selector--%>
    <style type="text/css">
        .RadUpload .ruFakeInput{
            width: 270px !important;
        	background-color: #f0f0f0 !important; 
        }
    </style>  
	<script type="text/javascript">
	    var ImportFileContentsPanelID = '<%= ImportFileContentsPanel.ClientID %>';

	    function SelectAll(select)
	    {
	        var checkboxes = document.getElementById(ImportFileContentsPanelID).getElementsByTagName("INPUT");
	        for (i=0;i<checkboxes.length;i++)
	            checkboxes[i].checked = select;
	    }
	    function ShowHideOverride()
	    {
	        var panels = document.getElementById(ImportFileContentsPanelID).getElementsByTagName("DIV");
	        for (i=0;i<panels.length;i++)
	        {
	            if (panels[i].style.display == 'block')
	                panels[i].style.display = 'none';
	            else
	                panels[i].style.display = 'block';
	        }
	    }
        // This function is called by clicking the OK button.
        // it calls the appropriate function based on what stage we're in.
	    function OK_Click()
	    {
	        var step = <%= CurrentStep %>;
	        switch (step)
	        {
	        case 1:
                // Stage 1 - upload a file
	            document.getElementById('<%= UploadButton.ClientID %>').click();
	            break;
	        case 2:
                // Stage 2 - import the uploaded file
	            document.getElementById('<%= ImportButton.ClientID %>').click();
	            break;
	        case 3:
                // stage 3 - after viewing
	            document.getElementById('<%= CleanupButton.ClientID %>').click();
	            break;
	        default:
	            ReturnAndClose();
	            break;
	        }
	    }
	    function ReturnAndClose()
	    {
	        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
	        oWindow.Close();
	    }    
	</script>
    <asiweb:PanelTemplateControl ID="ImporterControlPanel" runat="server" FieldSet="true" Collapsible="false" TemplateTitle="Import" ShowHeader="true" BorderStyle="none">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>   
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <div class="PanelField Left">         
                        <asp:label id="FileToImportLabel" runat="server" Text="Import File" AssociatedControlID="FileUpload" />                   
                        <div class="PanelFieldValue AutoWidth">                                       
                            <telerik:radupload id="FileUpload" runat="server" enablefileinputskinning="true"  
                                MaxFileInputsCount="1" InitialFileInputsCount="1"
                                AllowedFileExtensions=".xml" 
                                OverwriteExistingFiles="true" 
                                ReadOnlyFileInputs="false"  
                                ControlObjectsVisibility="ClearButtons"  
                                OnClientFileSelected="FileSelected" 
                                OnClientClearing="ResetButton"
                                localization-clear="Remove"
                                />                                       
                            <asiweb:StyledButton ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" />                                
                            &nbsp;<asp:CustomValidator
                                      ID="CustomValidator" runat="server"
                                      Display="Dynamic" ClientValidationFunction="ValidateFileUpload" />                    
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="ImportPanel" runat="server" Visible="false" Width="100%">
                    <div class="PanelField AutoWidth FloatNone">
                        <asp:CheckBox id="OverrideFolder" onclick="ShowHideOverride();" checked="false" runat="server" Text="Override destination with"/>
                    </div>
                    <div class="PanelField AutoWidth FloatNone">
                        <asp:CheckBox id="Overwrite" checked="false" runat="server" Text="Overwrite existing objects"/>
                    </div>
                    <div class="PanelField">
    
                        <asp:Label id="ImportFileContentsLabel" runat="server" Text="Import File Contents" AssociatedControlID="ImportFileContentsPanel" />
                        <div style="text-align:right;">
                            <a href="javascript:SelectAll(true);">Select All</a>
                            <a href="javascript:SelectAll(false);" style="margin-left:5px;">Deselect All</a>
                        </div>
                        <asp:Panel id="ImportFileContentsPanel" BackColor="white" runat="server" BorderWidth="1" style="overflow: auto;margin-left: 16px;margin-bottom: 5px; padding: 5px;" 
                            Height="200px" Width="98%">
	                        <asp:Repeater id="ImportFileContentsRepeater" runat="server">
		                        <ItemTemplate>
			                        <input type="checkbox" id="DocumentKey" name="DocumentKey" runat="server" />
		                            <asp:image id="DocumentIconURL" runat="server"/> 
		                            <asp:label id="DocumentName" runat="server"/>
			                        <br />
			                        <asp:label id="Folder" style="padding: 0px 0px 0px 50px; display:block;" runat="server"/>
		                        </ItemTemplate>
	                        </asp:Repeater>
                        </asp:Panel>
                        <asiweb:StyledButton ID="ImportButton" runat="server" Text="Import" OnClick="ImportButton_Click" Style="margin-left: 16px;" />                                     
                    </div>
                    <div class="PanelField">  
                        <asp:label id="MessagesLabel" runat="server" Text="Messages" AssociatedControlID="MessagesPanel" />
                        <asp:Panel id="MessagesPanel" BackColor="white" runat="server" BorderWidth="1" style="overflow: auto; margin-left: 16px; padding: 5px;" 
                            Height="200px" Width="98%">
                            <asp:Repeater id="MessagesRepeater" runat="server">
	                            <ItemTemplate>
	                                <asp:label id="Message1" Width="100%" runat="server" CssClass="GridRow" /><br />
	                            </ItemTemplate>
	                            <AlternatingItemTemplate>
	                                <asp:label id="Message2" Width="100%" runat="server" CssClass="GridAlternateRow"/><br />
	                            </AlternatingItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </div>
                </asp:Panel>
                <asp:Button ID="CleanupButton" runat="server" OnClick="CleanupButton_Click" style="display:none;" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="UploadButton" />
                <asp:PostBackTrigger ControlID="ImportButton" />
                <asp:PostBackTrigger ControlID="CleanupButton" />
            </Triggers>
        </asp:UpdatePanel>
    </asiweb:PanelTemplateControl>
      
    <script type="text/javascript">
        var uploadButton = document.getElementById('<%= UploadButton.ClientID %>');
        var customValidator = document.getElementById('<%= CustomValidator.ClientID %>');
        
        if (uploadButton != undefined) {
            uploadButton.disabled = true;
        }

        function FileSelected(radUpload, eventArgs) {           
            var input = eventArgs.get_fileInputField().value;
            if (input != null) {
                uploadButton.disabled = false;
                customValidator = document.getElementById('<%= CustomValidator.ClientID %>');
                customValidator.style.visibility = 'hidden';                
            } else {
                uploadButton.disabled = true;
            }

           
                var maxFileSize = <%= Utilities.GetMaxRequestLength() %>;
                var rows = radUpload.getFileInputs();
                if (rows.length >= 1) {
                var recentlyAddedFile = rows[rows.length - 1].files[0];
                    if (recentlyAddedFile.size > maxFileSize *1024) {
                        var mesg = "File size cannot be greater than " + maxFileSize + " KB.";
                        alert(mesg);
                        radUpload.clearFileInputAt(rows.length - 1);
                    }
                }
            }
        

        function ResetButton(){
            uploadButton.disabled = true;
            ClearValidationMessage();
        }
        function ValidateFileUpload(source, arguments) {
            arguments.IsValid = $find('<%= FileUpload.ClientID %>').validateExtensions();    
            if (!arguments.IsValid) {
                uploadButton.disabled = true;
                customValidator.style.visibility = 'visible';
            } else
                ClearValidationMessage();
        }
        function ClearValidationMessage() {
            customValidator.style.visibility = 'hidden';
        }       
    </script>   

</asp:Content>
