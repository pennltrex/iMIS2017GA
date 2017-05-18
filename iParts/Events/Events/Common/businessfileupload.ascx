<%@ Control Language="c#" Inherits="Asi.Web.iParts.Events.BusinessFileUpload" Codebehind="BusinessFileUpload.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
    <asp:Panel runat="server">
    <script>
    //<![CDATA[
        ///Function to toggle submit button status. This JS is fired by Fileupload when file is selected or on page load    	
	    function ToggleUploadButton(radUpload, eventargs)
	    {
            var uploadButton = document.getElementById("<%#UploadButton.ClientID%>");
    	    if(uploadButton!=null)
                 uploadButton.disabled = true;
        
            if (eventargs!=null && uploadButton!=null)
            {
                uploadButton.disabled = false;
                uploadButton.focus();
            }
	    }
	    
        // This Event fired by Telerik when File Upload added to the Telerik control (this event is always fired)
        function OnClientAdded(radUpload, eventargs)
        {
            setTimeout("ToggleUploadButton(null,null)",250);
        }

	    function UploadFileButton_ClientClick() {
	        var button = document.getElementById('<%= UploadButton.ClientID %>');
	        button.value = "Uploading...";
	        button.enabled = false;
	        var progManager = getRadProgressManager();
	        if (progManager != null) {	            
	            progManager.startProgressPolling();
	        }
	        return true;
	    }
	        
        function RadAsyncUploadValidationFailed(radAsyncUpload, args) {
            var $row = $telerik.$(args.get_row());
            var erorMessage = getErrorMessage(radAsyncUpload, args);
            var span = createError(erorMessage);
            $row.addClass("Error");
            $row.append(span);
            document.getElementById("<%#UploadButton.ClientID%>").disabled = true;
        }
 
        function getErrorMessage(sender, args) {
                var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
                if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                    if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                        return ("This file type is not supported.");
                    }
                    else {
                        return ("This file exceeds the maximum allowed size of 500 KB.");
                    }
                }
                else {
                    return ("Invalid file extension.");
                }
         }
 
         function createError(erorMessage) {
             var input = '<span class="ruFileWrap ruStyled" style="padding-left:2px">' + erorMessage + ' </span>';
             return input;
         }

         Telerik.Web.UI.RadAsyncUpload.Modules.Silverlight.isAvailable = function () { return false; };
    //]]>
    </script>
    <telerik:RadAjaxPanel ID="UploadPanel" runat="server" LoadingPanelID="loadingPanel" EnableAJAX="False">
            <telerik:RadProgressManager id="ProgressControl" runat="server" RegisterForSubmit="False" />
            <telerik:RadProgressArea id="ProgressArea" runat="server" DisplayCancelButton="true" ProgressIndicators="TotalProgressBar,CurrentFileName,TimeElapsed,TimeEstimated"/>
    
            <telerik:RadAsyncUpload
                ID="UploadControl" runat="server" AccessKey="P" 
                MaxFileInputsCount="1" EnableInlineProgress="false" MultipleFileSelection="Disabled"
                OverwriteExistingFiles="false" OnClientFileSelected = "ToggleUploadButton"
                OnClientAdded="OnClientAdded" OnClientValidationFailed="RadAsyncUploadValidationFailed"
                style="width:auto; float:left; "
                EnableFileInputSkinning="True" ReadOnlyFileInputs="true" />
            <asi:StyledButton ID="UploadButton" Runat="Server" Text="<%#ButtonText%>" CssClass="ruButton ruBrowse ruFileInput" 
                OnClientClick="UploadFileButton_ClientClick()" OnClick="UploadButtonClick" />
    </telerik:RadAjaxPanel>
    </asp:Panel>       
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="UploadButton" />
    </Triggers>
</asp:UpdatePanel>
