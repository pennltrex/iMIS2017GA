<%@ Reference Control="~/asicommon/controls/shared/documentloadutility/documentloaderportfolio.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.DocumentLoadUtility.DocumentLoader" AutoEventWireup="true" Codebehind="DocumentLoader.ascx.cs" %>
<style type="text/css">
    .RadUpload, .ProgressArea {
        width: 150px !important;
    }	
    .RadUpload .ruFakeInput{
    	width: 150px !important;
        background-color: #f0f0f0 !important; 
    }
</style> 
<asp:UpdatePanel ID="ForceFormPostbackUpdatePanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"/>
        <asiweb:PanelTemplateControl2 ID="UploadPanel" runat="server" Text="New Document" ShowHeader="true" FieldSet="true" BorderStyle="None" Collapsible="false">
            
            <div id="DocTypeContainer" runat="server" visible="false">
                <asp:label id="lblDocType" runat="server" Visible="false" AssociatedControlID="ddDocType"/>
                <asp:dropdownlist id="ddDocType" runat="server" cssclass="SelectStandard" Visible="false"/>
            </div>

            <div class="PanelField Left" style="white-space: nowrap">  
                    
                <asp:label id="lblSelectFile" runat="server" AssociatedControlID="FileUpload" />
                    
                <div class="PanelFieldValue AutoWidth"> 
                                                    
                    <telerik:radupload id="FileUpload" runat="server" enablefileinputskinning="true"  
                        MaxFileInputsCount="1" InitialFileInputsCount="1"
                        OverwriteExistingFiles="true" 
                        ReadOnlyFileInputs="false"  
                        ControlObjectsVisibility="ClearButtons"  
                        OnClientFileSelected="FileSelected" 
                        OnClientClearing="ResetButton"
                        localization-clear="Remove"
                        />                     
 
                    <asp:Label id="lblMaxFileSize" runat="server" />
                </div>
            </div>
            <div class="PanelField">
                <asp:label id="lblDescription" runat="server" AssociatedControlID="txtDescription"/>
                <input id="txtDescription" type="text" name="txtDescription" runat="server" class="InputStandard" />
            </div>    
        </asiweb:PanelTemplateControl2>
        
        <div class="CommandBar">
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_ServerClick" />
        </div>
        
        <script type="text/javascript">
            //<![CDATA[
            var uploadButton = document.getElementById('<%= btnUpload.ClientID %>');
            if (uploadButton != undefined) {
                uploadButton.disabled = true;
            }            
            function FileSelected(radUpload, eventArgs) {
                var input = eventArgs.get_fileInputField().value;
                if (input != null) {
                    uploadButton.disabled = false;
                } else {
                    uploadButton.disabled = true;
                }
            }
            function ResetButton() {
                uploadButton.disabled = true;
            }
            //]]>
        </script> 
        
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnUpload" />
    </Triggers>

</asp:UpdatePanel>
