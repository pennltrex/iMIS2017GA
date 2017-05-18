<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_DocumentLoadUtility_DocumentEditor" Codebehind="DocumentEditor.ascx.cs" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>
<style type="text/css">
    .RadUpload, .ProgressArea {
        width: 150px !important;
    }
    .RadUpload .ruFakeInput{
        width: 150px !important;
        background-color: #f0f0f0 !important; 
    }
</style>

<asiweb:PanelTemplateControl2 ID="DocumentEditPanel" runat="server" TemplateTitle="Document Utility" Collapsible="false" FieldSet="true" BorderStyle="none">
    
    <asiweb:SmartControl ID="DocumentName" runat="server" AtomComponentName="Document" BoundPropertyName="Name" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl ID="DocumentDescription" runat="server" AtomComponentName="Document" BoundPropertyName="Description" DisplayCaption="true" PositionCaption="Left" />
    
    <div class="PanelField Left" style="white-space: nowrap">
        <asp:label id="lblSelectFile" runat="server" AssociatedControlID="FileUpload" />
        <div class="PanelFieldValue AutoWidth" style="white-space: nowrap">           
            <telerik:radupload id="FileUpload" runat="server" enablefileinputskinning="true"  
                MaxFileInputsCount="1" InitialFileInputsCount="1"
                OverwriteExistingFiles="true" 
                ReadOnlyFileInputs="false"  
                ControlObjectsVisibility="ClearButtons"  
                localization-clear="Remove"
                />              

            <asp:Label id="lblMaxFileSize" runat="server" />
        </div>
    </div>
    
</asiweb:PanelTemplateControl2>

<asi:AccessSettings ID="AccessSettingsControl" runat="server" />