<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileImporterForWebServicesDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="FileUpload" Src="../../../AsiCommon/Controls/Shared/Utility/businessfileupload.ascx" %>


<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="yes" >
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />


  <asiweb:StyledLabel ID="InfoLabel" runat="server" CssClass="Info"></asiweb:StyledLabel>
  
  <asiweb:PanelTemplateControl ID="MainPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false"  BorderStyle="None">
    
    <asiweb:BusinessComboBox ID="FileTypesDropDown" runat="server" RenderPanelField="true" DisplayCaption="true" Required="true" >
    </asiweb:BusinessComboBox>
      
    <asiweb:BusinessComboBox ID="BuildersDropDown" runat="server" RenderPanelField="true" DisplayCaption="true" Required="true" ShowNullItem="False">
    </asiweb:BusinessComboBox>
    <div class="PanelField">
        <div class="Label">
            
        </div>
        <div class="PanelFieldValue">
            <uc1:FileUpload id="FileUpload1"  runat="server" DialogMode="true" UploadDirectory="~\UploadedFiles"  OnFileUploaded="FileUpload1_FileUploaded"
      CreateUploadDirectory="true"   />
        </div>
    </div>
      <asp:TextBox runat="server" ID="fileFakeInput" Visible="false" Enabled="false" /> <asp:Button runat="server" ID="fileFakeButton1" Visible="false" Enabled="false" text="Browse..."/> <asp:Button runat="server" ID="fileFakeButton2" Visible="false" Enabled="false" text="Upload"/>
      <asiweb:StyledButton runat="server" id="DownloadErrorButton" Text='<%#Asi.ResourceManager.GetPhrase("DownloadErrorsToFile", "Download errors") %>' 
          ToolTip='<%#Asi.ResourceManager.GetPhrase("DownloadErrorsToFileTooltip", "Download the lines in the import file that were found to contain errors.") %>'
          OnClick="DownloadErrorRecords" Visible="False"/>
  
  
  </asiweb:PanelTemplateControl>
</asp:Panel>       

