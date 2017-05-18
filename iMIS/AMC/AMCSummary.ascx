<%@ Control Language="c#"  AutoEventWireup="false" Inherits="Asi.WebRoot.AMC.AMCSummary" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.UI" %>
<asiweb:PanelTemplateControl2 ID="SystemSummary" runat="server" Text="System summary" Collapsible="false" FieldSet="true">
    
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" translate="yes">
 
        <div class="PanelField">
            <asp:label id="lblImisVersion" runat="server" CssClass="Label"/>
            <asp:label id="lblImisVersionValue" runat="server"/>
        </div>
        <div class="PanelField">
            <asp:label id="lblSystemName" runat="server" CssClass="Label"/>
            <asiweb:BusinessLabel id="SystemNameValueLabel" runat="server"/>
        </div>
        <div class="PanelField">
            <asp:label id="lblDateInstalled" runat="server" CssClass="Label"/>
            <asiweb:BusinessLabel id="DateInstalledValueLabel" runat="server"/>
        </div>
        <div class="PanelField Section">
            <asp:label id="lblVersion" runat="server" CssClass="Label"/>
            <asiweb:BusinessLabel id="VersionValueLabel" runat="server"/>
        </div>        
        
        <div class="PanelField">
            <asp:label id="lblDatabaseVersion" runat="server" CssClass="Label"/>
            <asp:label id="lblDatabaseVersionValue" runat="server"/>
        </div>
        <div class="PanelField">
            <asp:label id="lblDbServer" runat="server" CssClass="Label"/>
            <asp:label id="lblDbServerValue" runat="server"/>
        </div>
        <div class="PanelField Section">
            <asp:label id="lblDatabase" runat="server" CssClass="Label"/>
            <asp:label id="lblDatabaseValue" runat="server"/>
        </div>

        <div class="PanelField">
            <asp:label id="lblActiveUser" runat="server" CssClass="Label"/>
            <asp:label id="lblActiveUserValue" runat="server"/>
        </div>
        <div class="PanelField Section">
            <asp:label id="lblLoginTimeout" runat="server" CssClass="Label"/>
            <asp:label id="lblLoginTimeoutValue" runat="server"/>
        </div>

        <div class="PanelField" style="display:none;">
            <asp:label id="lblWorkflowService" runat="server" CssClass="Label"/>
            <asp:label id="lblWorkflowServiceValue" runat="server"/>
        </div>
         
    </asiweb:PanelTemplateColumn>

    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" translate="yes" Width="33%">
                    
        <div class="PanelField">
            <asp:label id="CacheServerVersionLabel" runat="server" CssClass="Label">Cache server version</asp:label>
            <asiweb:BusinessLabel id="CacheServerVersionValue" runat="server"/>
        </div>                   
        <div class="PanelField Section">
            <asp:label id="CacheCountLabel" runat="server" CssClass="Label">Cached keys</asp:label>
            <asiweb:BusinessLabel id="CacheCountValue" runat="server"/>
        </div> 
            
        <asiweb:StyledButton runat="server" id="PurgeAllCacheButton" Text="Purge System Cache" OnClick="OnResetCacheButtonClick"/>                      
          
    </asiweb:PanelTemplateColumn>
    
    <div class="PanelField">
        <asp:label id="lblNetFrameworkVersion" runat="server" CssClass="Label"/>
        <asp:label id="lblNetFrameworkVersionValue" runat="server"/>
    </div>   
    <div class="PanelField">
        <asp:label id="lblWebServerPath" runat="server" CssClass="Label"/>
        <asp:label id="lblWebServerPathValue" runat="server"/>
    </div>
    <div class="PanelField">
        <asp:label id="lblURL" runat="server" CssClass="Label" AssociatedControlID ="URLValue"></asp:label>
        <asiweb:StyledHyperlink id="URLValue" runat="server"/>
    </div>
    <div class="PanelField">
        <asp:label id="lblSMTPServer" runat="server" CssClass="Label"/>
        <asp:label id="lblSMTPServerValue" runat="server"/>
    </div>
    <div class="PanelField" style="display:none;">
        <asp:label id="lblCrystalVersion" runat="server" CssClass="Label"/>
        <asp:label id="lblCrystalVersionValue" runat="server"/>
    </div>
    <div class="PanelField Section">
        <asp:label id="lblWebServerCrystalPath" runat="server" CssClass="Label"/>
        <asp:label id="lblWebServerCrystalPathValue" runat="server"/>
    </div>

    <div class="PanelField" style="display:none;">
        <asp:label id="lblImisNetPrinter" runat="server" CssClass="Label"/>
        <asp:label id="lblImisNetPrinterValue" runat="server"/>
    </div>
    
    <div class="ShowFieldset" translate="yes" style="width: 66%;">
        <fieldset>
            <legend>
                <span class="SectionLabel"><asiweb:StyledLabel runat="server" ID="LicenceControlLabel" CssClass="label"/></span> 
            </legend>
            <div ID="UserMessagesWarning" Class="AsiWarning" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiWarning" CssClass="iMISUserMessageIcon" ImageUrl="images/AsiWarning.png" AlternateText="Warning icon"></asp:Image>
                <asiweb:BusinessLabel ID="IISResetWarning" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div ID="UserMessageCanceled" Class="AsiInformation" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiInformation" CssClass="iMISUserMessageIcon" ImageUrl="images/AsiInformation.png" AlternateText="Information icon"></asp:Image>
                <asiweb:BusinessLabel ID="CancelMessage" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div ID="UserMessagesError" Class="AsiError" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiError" ImageUrl="images/AsiError.png" CssClass="iMISUserMessageIcon" AlternateText="Error icon"></asp:Image>
                <asiweb:BusinessLabel ID="ErrorMessage" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div ID="ChecksumErrorDiv" Class="AsiError" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiError" ImageUrl="images/AsiError.png" CssClass="iMISUserMessageIcon" AlternateText="Error icon"></asp:Image>
                <asiweb:BusinessLabel ID="ChecksumError" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div ID="DateErrorDiv" Class="AsiError" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiError" ImageUrl="images/AsiError.png" CssClass="iMISUserMessageIcon" AlternateText="Error icon"></asp:Image>
                <asiweb:BusinessLabel ID="DateError" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div ID="UserMessagesSuccess" Class="AsiSuccess" runat="server" Visible="False">
                <asp:Image runat="server" SkinID="AsiSuccess" ImageUrl="images/AsiSuccess.png" CssClass="iMISUserMessageIcon" AlternateText="Success icon"></asp:Image>
                <asiweb:BusinessLabel ID="SuccessMessage" runat="server" CssClass="AsiMessageText"></asiweb:BusinessLabel>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="SerialNoTextBox" RenderPanelField="True" DisplayCaption="True" runat="server"/>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="LicensedToTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputXLarge"/>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="LicensedProductsTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputXXLarge" Rows="5" TextMode="MultiLine"/>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="UsersLicensedTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputSmall"/>
            </div>
            <div class="PanelField">
                <asp:label id="lblFullCount" runat="server" CssClass="Label"></asp:label>
                <asp:label id="lblFullCountValue" runat="server">&nbsp;</asp:label>
            </div>
            <div class="PanelField">
                <asp:label id="lblCasualCount" runat="server" CssClass="Label"></asp:label>
                <asp:label id="lblCasualCountValue" runat="server">&nbsp;</asp:label>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="MaximumRecordsTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputSmall"/>
            </div>
            <div class="PanelField">
                <asiweb:BusinessTextBox id="ExpirationDateTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputSmall"/>
            </div>
            <div class="PanelField" Id="ChecksumDiv" runat="server">
                <asiweb:BusinessTextBox id="ChecksumTextBox" RenderPanelField="True" DisplayCaption="True" runat="server"/>
            </div>
            <div id="LocalButtonBar" runat="server" class="FloatRight">
                <asiweb:StyledButton ID="SaveButton" Text="Save" CssClass="PrimaryButton" OnClick="OnSaveButtonClicked" runat="server" />
                <asiweb:StyledButton ID="CancelButton" Text="Cancel" CssClass="TextButton" OnClick="OnCancelButtonClicked" CausesValidation="False" runat="server"/>
            </div>
            <asiweb:StyledButton ID="EditButton" runat="server" Text="Update License Information" CssClass="PrimaryButton FloatRight" OnClick="OnEditButtonClick"/>
        </fieldset>
    </div> 
    
</asiweb:PanelTemplateControl2>