<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.FileUpload.FileUpload" CodeBehind="FileUpload.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style>.RadAsyncUpload{width:250px!important;} .PanelField label{width:7em;word-wrap:normal;}</style>
<asiweb:PanelTemplateControl2 ID="ContentPanel" runat="server" Visible="true" ShowHeader="False" Collapsed="false" Collapsible="false" BorderWidth="0" translate="yes">
    <div style="padding-bottom:10px;">
        <div class="PanelField Left">          
            <asp:Label runat="server" ID="SelectFileLabel" CssClass="Required" AssociatedControlID="RadAsyncUpload1" />            
            <div class="PanelFieldValue">
                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1"  
                     OnClientFileSelected="fileSelected" OnClientFileUploadRemoved="clearValidation" OnClientValidationFailed="validationFailed" UploadedFilesRendering="BelowFileInput" EnableInlineProgress="False">
                </telerik:RadAsyncUpload>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div class="PanelField Left" id="DescriptionDiv" runat="server">           
            <asp:Label runat="server" ID="FileDescriptionlabel" Text="Description" AssociatedControlID="FileDescription" />            
            <div class="PanelFieldValue">
                <asp:TextBox runat="server" ID="FileDescription" CssClass="InputLarge" />
            </div>
        </div>
    </div>
    <br />
    <telerik:RadProgressManager runat="server" ID="RadProgressManager1" />
    <telerik:RadProgressArea runat="server" ID="RadProgressArea1" DisplayCancelButton="False" progressindicators="TotalProgress,TotalProgressBar,TotalProgressPercent,TimeElapsed,TimeEstimated,TransferSpeed" />
    <br />
    <div class="NeutralShading">
        <asp:Literal ID="AllowedFileTypesLabel" runat="server"></asp:Literal>
        <br />
        <asp:Literal ID="FileMaxSizeLabel" runat="server"></asp:Literal>
    </div>
</asiweb:PanelTemplateControl2>
<div class="CommandBar">
    <asiweb:StyledButton runat="server" ID="UploadButton" CssClass="PrimaryButton" OnClick="UploadButton_Click" Text="Upload" />
</div>
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        //<![CDATA[
        uploadButtonDisable(true);

        var $ = $telerik.$;
        function validationFailed(radAsyncUpload, args) {
            var $row = $(args.get_row());
            var errorMessage = getErrorMessage(radAsyncUpload, args);
            var span = createError(errorMessage);
            $row.append(span);
            uploadButtonDisable(true);
        }

        function clearValidation() {            
            uploadButtonDisable(true);
        }

        function uploadButtonDisable(disable) {
            var uploadButton = jQuery("#<%=UploadButton.ClientID%>");
            if (disable != null)
                uploadButton.prop("disabled", disable); 
        }

        function fileSelected() {
            uploadButtonDisable(false);
        }

        function getErrorMessage(sender, args) {
            var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
            if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                    return ("This file type is not supported.");
                }
                else {
                    return ("This file exceeds the maximum allowed size of <%= GetMaxFileUploadSize()/1024 %> KB.");
                }
            }
            else {
                return ("Invalid file extension.");
            }
        }

        function createError(errorMessage) {
            var input = '<span class="Error">' + errorMessage + ' </span>';
            return input;
        }

        function UploadComplete(documentStorageKey, fileName, fileDescription, documentServerPath) {
            var dialogMode = <%= DialogMode.ToString().ToLowerInvariant() %>;
            if (dialogMode)
            {
                var oWindow = null;
                if (window.radWindow) {
                    //Will work in Moz in all cases, including clasic dialog
                    oWindow = window.radWindow;
                } 
                else if (window.frameElement && window.frameElement.radWindow) {
                    //IE (and Moz az well)
                    oWindow = window.frameElement.radWindow;
                }

                if (oWindow != null) {
                    oWindow.Filename = fileName;
                    oWindow.DocumentStorageKey = documentStorageKey;
                    oWindow.DocumentServerPath = documentServerPath;
                    oWindow.result = documentStorageKey;
                    oWindow.Close();
                }
            }
        }
        //]]>
    </script>
</telerik:RadScriptBlock>
