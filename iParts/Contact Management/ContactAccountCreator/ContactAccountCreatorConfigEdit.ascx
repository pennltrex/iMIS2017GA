<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAccountCreatorConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.ContactManagement.ContactAccountCreator.ContactAccountCreatorConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate>            
        <asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false" borderstyle="None">
            <div class="AutoWidth">       
                <asiweb:SmartControl
                    ID="HideForAuthenticatedUsers" runat="server" 
                    BoundPropertyName="HideForAuthenticatedUsers" DisplayCaption="true" 
                    PositionCaption="Right" DataSaveUponStateChange="false" />
                <asiweb:SmartControl 
                    ID="CommitSequenceControl" runat="server"
                    BoundPropertyName="CommitSequence" DisplayCaption="true"
                    PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />
            </div>
            <div style="clear: both;"/>
            <div class="AutoWidth">
                <asp:ValidationSummary runat="server" CssClass="Important" />
                <div class="ShowFieldset">
                    <fieldset>
                        <legend><%# GetTranslatedPhrase("Account") %></legend> 
                        <asiweb:SmartControl 
                            ID="AccountTypeAllowed" runat="server" EnableAjaxPostback="True"
                            BoundPropertyName="AccountTypeAllowed" DisplayCaption="True" OnDataChange="AccountTypeAllowedChange"
                            PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" translate="yes" /> 
                        <div id="AssignCompanyAdministratorDiv" runat="server">
                            <asiweb:SmartControl ID="AssignCompanyAdministrator" runat="server" 
                                BoundPropertyName="AssignCompanyAdministrator" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" /> 
                        </div>  
                        <div id="PrimaryOrganizationSelectionControls" runat="server">
                            <asiweb:SmartControl runat="server" EnableAjaxPostback="True" ID="IncludePrimaryOrganizationSelectionControl"
                                    BoundPropertyName="IncludePrimaryOrganizationSelection" DisplayCaption="True"
                                    OnDataChange="IncludePrimaryOrganizationSelectionChanged" AutoPostBack="True"
                                    PositionCaption="Right" DataSaveUponStateChange="False" />
                            <div class="SubItems">     
                                <asiweb:SmartControl runat="server" id="RequirePrimaryOrganizationSelectionControl"
                                    BoundPropertyName="RequirePrimaryOrganizationSelection" DisplayCaption="True" 
                                    PositionCaption="Right" DataSaveUponStateChange="False" />
                                <asiweb:SmartControl
                                    ID="OrganizationListQueryPathControl" runat="server" 
                                    BoundPropertyName="OrganizationListQueryPath" DisplayCaption="True" InputFieldCssClass="InputXLargeWrapper"
                                    DataSaveUponStateChange="False" DocumentTypesAllowed="IQD" HIControlType="DocumentPathSelector" />
                            </div>
                        </div>                                                                                                             
                        <asiweb:SmartControl 
                            ID="IncludeSocialMediaSignupOption" runat="server" 
                            BoundPropertyName="IncludeSocialMediaSignupOption" DisplayCaption="true" 
                            PositionCaption="Right" DataSaveUponStateChange="false" />
                        <div id="IndividualRelatedFieldsDiv" runat="server">
                            <asiweb:SmartControl 
                                ID="IncludePrefix" runat="server" 
                                BoundPropertyName="IncludePrefix" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />
                            <asiweb:SmartControl 
                                ID="IncludeMiddleName" runat="server" 
                                BoundPropertyName="IncludeMiddleName" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />
                            <asiweb:SmartControl 
                                ID="IncludeSuffix" runat="server" 
                                BoundPropertyName="IncludeSuffix" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />
                            <asiweb:SmartControl 
                                ID="IncludeDesignation" runat="server" 
                                BoundPropertyName="IncludeDesignation" DisplayCaption="true"
                                PositionCaption="Right" DataSaveUponStateChange="false"/>
                            <asiweb:SmartControl  
                                ID="IncludeInformalName" runat="server"  
                                BoundPropertyName="IncludeInformalName" DisplayCaption="true"
                                PositionCaption ="Right" DataSaveUponStateChange="false"/>
                            <asiweb:SmartControl
                                ID="IncludeTitle" runat="server"
                                BoundPropertyName="IncludeTitle" DisplayCaption="true"
                                PositionCaption="Right" DataSaveUponStateChange="false"/>
                        </div>                                                                                                                  
                        <asiweb:SmartControl 
                            ID="IncludePhone" runat="server" RenderPanelField="True"
                            BoundPropertyName="IncludePhone" DisplayCaption="true" 
                            PositionCaption="Right" DataSaveUponStateChange="false" /> 
                        <asiweb:SmartControl 
                            ID="IncludeMobilePhone" runat="server" RenderPanelField="True"
                            BoundPropertyName="IncludeMobilePhone" DisplayCaption="true" 
                            PositionCaption="Right" DataSaveUponStateChange="false" /> 
                        <div id="IncludeEmailForIndividualDiv" runat="server">
                            <asiweb:BusinessCheckBox ID="IncludeEmailForIndividual" runat="server" AutoPostBack="True" RenderPanelField="True"
                                BoundPropertyName="IncludeEmailForIndividual" DisplayCaption="True" PositionCaption="Right" />
                            <div class="SubItems">
                                <asiweb:BusinessCheckBox ID="RequireEmailForIndividual" runat="server"
                                    BoundPropertyName="RequireEmailForIndividual" DisplayCaption="true" RenderPanelField="true" PositionCaption="right" />                                                                           
                            </div>
                        </div>
                        <div id="IncludeEmailForOrganizationDiv" runat="server">
                            <asiweb:BusinessCheckBox ID="IncludeEmailForOrganization" runat="server" AutoPostBack="True" RenderPanelField="True"
                                BoundPropertyName="IncludeEmail" DisplayCaption="True" PositionCaption="Right" />
                            <div class="SubItems"> 
                                <div class="PanelField Right" runat="server" id="RequireEmailForOrganizationDiv">                                
                                    <asiweb:BusinessCheckBox ID="RequireEmailForOrganization" runat="server" RenderPanelField="true"
                                        BoundPropertyName="RequireEmailForOrganization" DisplayCaption="True" PositionCaption="Right" />                                                 
                                </div>
                            </div>
                        </div>
                        <asiweb:BusinessCheckBox ID="IncludeAddress" runat="server" 
                            BoundPropertyName="IncludeAddress" DisplayCaption="true" RenderPanelField="true"
                            PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" />
                        <div id="IncludeAddressSubitemsDiv" runat="server" class="SubItems">      
                            <asiweb:BusinessCheckBox ID="RequireAddress" runat="server" AutoPostBack="true" RenderPanelField="True"
                                BoundPropertyName="RequireAddress2" DisplayCaption="True" PositionCaption="Right" />             
                            <asiweb:SmartControl 
                                ID="MultipleAddressLines" runat="server" 
                                BoundPropertyName="MultipleAddressLines" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />                     
                            <asiweb:SmartControl 
                                ID="CreateAddressPurpose" runat="server" 
                                BoundPropertyName="CreateAddressPurpose" DisplayCaption="true" 
                                PositionCaption="Left" DataSaveUponStateChange="false" />
                        </div>
                    </fieldset>
                </div>
             </div>
            <div style="clear: both;"/>
            <div class="AutoWidth">
                <div class="ShowFieldset">
                    <fieldset>
                        <legend><%# GetTranslatedPhrase("Sign in") %></legend> 
                        <asiweb:SmartControl 
                            ID="IncludeLogOnLink" runat="server" 
                            BoundPropertyName="IncludeLogOnLink" DisplayCaption="true" 
                            PositionCaption="Right" DataSaveUponStateChange="false" />        
                        <asiweb:SmartControl 
                            ID="IncludeOptionToCreateLogon" runat="server" EnableAjaxPostback="True"
                            BoundPropertyName="IncludeOptionToCreateLogon" DisplayCaption="true" 
                            PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" />
                        <div class="SubItems" id="IncludeOptionToCreateLogOnDiv" runat="server">
                            <asiweb:SmartControl 
                                ID="RequireUserToCreateLogon" runat="server" 
                                BoundPropertyName="RequireUserToCreateLogon" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />
                            <asiweb:SmartControl 
                                ID="UseEmailAsLogon" runat="server" 
                                BoundPropertyName="UseEmailAsLogon" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false"  />
                        </div>
                    </fieldset>
                </div>                        
            </div>
            <div style="clear: both;"/>
            <div class="AutoWidth">
                <div class="ShowFieldset">
                    <fieldset>
                        <legend><%# GetTranslatedPhrase("Redirects") %></legend> 
                        <asiweb:SmartControl 
                            ID="RedirectLocation" runat="server" 
                            BoundPropertyName="RedirectLocation" DisplayCaption="true" EnableAjaxPostback="True"
                            PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" translate="yes"  />
                        <div id="RedirectLocationDiv" runat="server">
                            <asiweb:SmartControl 
                                ID="UrlRedirect" runat="server" 
                                BoundPropertyName="UrlRedirect" DisplayCaption="true" InputFieldCssClass="InputLargeWrapper"
                                PositionCaption="Left" DataSaveUponStateChange="false" />                                                    
                            <asiweb:SmartControl 
                                ID="IncludeIdAsQuerystringParameter" runat="server" 
                                BoundPropertyName="IncludeIdAsQuerystringParameter" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />                                                  
                        </div>
                    </fieldset>
                </div>         
            </div>
        </asiweb:paneltemplatecontrol>
    </ContentTemplate>
 </asp:UpdatePanel>
