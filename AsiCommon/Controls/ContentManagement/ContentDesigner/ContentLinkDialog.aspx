<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentLinkDialog.aspx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.ContentManagement.ContentDesigner.ContentLinkDialog" %>

<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>

<asp:content id="BodyContent" runat="server" contentplaceholderid="TemplateBody">

    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None" TemplateTitle=''>

        <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" /> 
        
        <div id="LinkTypeDiv" class="PanelField Left" runat="server" Visible="False">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LinkTypeLabel" Text="Link type" AssociatedControlID="LinkTypeDropDown" CssClass="Required" />
            </div>
            <div class="PanelFieldValue">
               <asiweb:BusinessDropDownList ID="LinkTypeDropDown" runat="server" ToolTip="The link type needed."/>
           </div>
        </div>
        <div runat="server" id="panelDisplay">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LinkTextLabel" Text="Link text" EnableViewState="true" AssociatedControlID="LinkText" CssClass="Required" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="LinkText" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>
                    <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="LinkText"></asiweb:AsiRequiredFieldValidator>
                </div>
            </div>
        
            <div class="PanelField Left" runat="server" id="DivContentType">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="ContentOrURLLabel" Text="Content or URL" EnableViewState="true" AssociatedControlID="ContentOrURL" CssClass="Required" />
                </div>
                <div class="PanelFieldValue InputXLargeWrapper">
                    <asiweb:BusinessDocumentBrowserControl PositionCaption="Left" AutoPostBack="False" Caption="Content or URL" DisplayCaption="true" ShowAddress="false" ID="ContentOrURL" Required="true" RootFolder="@/" runat="server" />
                    <asiweb:InfoControl runat="server" ID="ContentOrURLInfo" CssClass="Left"/>
                </div>
            </div>

            <div class="PanelField Left" runat="server" id="DivDownloadType">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="DocumentLabel" Text="Document" EnableViewState="true" AssociatedControlID="DownloadFileInfoControl" CssClass="Required" />
                </div>
                <div class="PanelFieldValue InputXLargeWrapper">
                    <asiweb:BusinessDocumentBrowserControl PositionCaption="Left" AutoPostBack="False" Caption="Document" DisplayCaption="true" ShowAddress="false" TextBoxWidth="400"
                         ID="DownloadFileBrowserControl" Required="true" RootFolder="$/Common/Uploaded files" runat="server" />
                    <asiweb:InfoControl runat="server" ID="DownloadFileInfoControl" CssClass="Left"/>
                    <span class="ValidationError" id="<%=DownloadFileBrowserControl.ClientID%>Required" >Required</span>
               </div>
            </div>

            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="CSSClassLabel" Text="CSS class" EnableViewState="true" AssociatedControlID="CSSClass"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="CSSClass" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>
                </div>
            </div>
        
            <div class="PanelField Left" runat="server" id="DivWebsiteList">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCommunicationPreferencesLinkDefaultWebsite" Text="Default website" EnableViewState="true" AssociatedControlID="WebsiteDropDownList"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList AutoPostBack="false" ID="WebsiteDropDownList" runat="server" ToolTip="The website the communication preferences link will use."/>
                   <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="WebsiteDropDownList" ID="WebsiteValidator" Enabled="False"></asiweb:AsiRequiredFieldValidator>
                </div>
            </div>
        
            <div class="PanelField Left" runat="server" id="DivSourceCode">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="SourceCodeLabel" Text="Source code" EnableViewState="true" AssociatedControlID="SourceCode"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessComboBox ID="SourceCode" runat="server" TranslateOnlyCaptionAndToolTip="true" RenderPanelField="True" AllowCustomText="false" DisplayCaption="False" PositionCaption="Left"
                        EnableLoadOnDemand="True" Filter="Contains" ShowNullItem="true" ClientIDMode="Static" />     
                </div>
            </div>
        
            <div class="PanelField Left" runat="server" id="DivParams">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="UrlParameterLabel" Text="Additional URL parameters" EnableViewState="true" AssociatedControlID="UrlParametersTextBox"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="UrlParametersTextBox" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>            
                </div>
            </div>

            <div style="clear:both;">
                <asp:Button runat="server" ID="ValidationErrorButton" OnClick="ValidationErrorButton_OnClick"/>
            </div>
        </div>
    </asiweb:PanelTemplateControl>
</asp:content>
