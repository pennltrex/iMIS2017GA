<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAction.aspx.cs" Inherits="Asi.Web.iParts.Common.Tasks.AddAction" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content id="ContentPanel" runat="server" ContentPlaceHolderID="TemplateBody"> 
    <asiweb:PanelTemplateControl2 ID="ActionTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="false">
        <asp:UpdatePanel ID="ActionPanel" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <div class="PanelField Left">
                    <div style="display:inline;">
                        <asiweb:StyledLabel AssociatedControlID="ActionTypeSelect" ID="ActionTypeLabel" runat="server" />
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList ID="ActionTypeSelect" runat="server" OnSelectedIndexChanged="UpdateActionControls" AutoPostBack="True" />                        
                    </div>
                </div>
                <div runat="server" ID="CommunicationActionDiv">
                    <div class="PanelField Left" runat="server" ID="RecipientDatasourceDiv">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="RecipientDatasourceSelect" ID="RecipientDatasourceLabel" runat="server" />
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList ID="RecipientDatasourceSelect" runat="server" OnDataChanged="RecipientsChanged" AutoPostBack="True"/> 
                            <div style="display:inline;">
                                 <asp:LinkButton runat="server" ID="AddNewDataSource" translate="yes" Text="Add new data source" OnClick="AddNewDataSource_Click" />	    
                            </div>
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="CommunicationOpenLink" CssClass="Required" ID="CommunicationLabel" runat="server" />
                        </div>
                        <div class="PanelFieldValue">
                            <b><asiweb:Hyperlink runat="server" ID="CommunicationOpenLink"></asiweb:Hyperlink></b>&nbsp;
                            <asp:LinkButton runat="server" ID="CommunicationSelectLink" OnClick="OpenCommunicationBrowser" Text="Select"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="CommunicationRemoveLink" OnClick="RemoveCommunication" Text="Remove" Visible="False"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="CommunicationNewLink" OnClick="CreateNewCommunication" Text="New"></asp:LinkButton>
                        </div>
                        <asp:HiddenField runat="server" ID="SelectedCommunicationProperties"/>
                        <asp:Button ID="HiddenButton" runat="server" OnClick="HiddenButton_OnClick" CausesValidation="false" Style="display: none" />
                    </div>  
                    <div class="PanelField Left" runat="server" ID="ContentWorkflowActionDiv">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="ContentCommunicationOpenLink" CssClass="Required" ID="ContentCommunicationLabel" runat="server" />
                        </div>
                        <div class="PanelFieldValue">
                            <b><asiweb:Hyperlink runat="server" ID="ContentCommunicationOpenLink"></asiweb:Hyperlink></b>&nbsp;
                            <asp:LinkButton runat="server" ID="ContentCommunicationSelectLink" OnClick="OpenContentCommunicationBrowser" Text="Select"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="ContentCommunicationRemoveLink" OnClick="RemoveContentCommunication" Text="Remove" Visible="False"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="ContentCommunicationNewLink" OnClick="CreateNewContentCommunication" Text="New"></asp:LinkButton>
                        </div>
                        <asp:HiddenField runat="server" ID="SelectedContentCommunicationProperties"/>
                        <asp:Button ID="HiddenContentCommunicationButton" runat="server" OnClick="HiddenContentCommunicationButton_OnClick" CausesValidation="false" Style="display: none" /> 
                    </div>               
                    <div class="PanelField Left" runat="server" ID="CreateAggregateReceiptsDiv">
                        <div class="PanelFieldValue AutoWidth FloatNone">
                            <asp:CheckBox ID="CreateAggregateReceiptsCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" translate="yes" />
                        </div>
                    </div>  
                </div>
                <div runat="server" ID="RunReportActionDiv">
                    <div class="PanelField Left">
                        <div style="display:inline;">
                            <asiweb:StyledLabel AssociatedControlID="ReportTextBox" CssClass="Required" ID="ReportLabel" runat="server" />
                        </div>
                        <div class="PanelFieldValue InputXLargeWrapper">
                            <asiweb:BusinessDocumentBrowserControl ID="ReportTextBox" runat="server" DocumentHierarchyPath="$" 
                                RootFolder="$" AllowUpwardNavigation="False" ShowAddress="False" DocumentTypesAllowed="RDL" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="EmailSenderLabel" runat="server" AssociatedControlID="EmailSenderTextBox" CssClass="Required"/>                          
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="EmailSenderTextBox" Required="True" RenderPanelField="False" DisplayCaption="False" CssClass="InputLarge" />
                            <asiweb:AsiRequiredFieldValidator ControlToValidate="EmailSenderTextBox" Display="Dynamic" ID="EmailSenderTextBoxRfv" runat="server" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="EmailRecipientsLabel" runat="server" AssociatedControlID="EmailRecipientsTextBox" CssClass="Required" />                          
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessHtmlEditor runat="server" ID="EmailRecipientsTextBox" ValidateRequestMode="Disabled" CssClass="ContentHtmlEditor" EnableCombinedHandler="False" Required="True" EnableTextareaMode="True" EditModes="Html" Height="120" Width="338" style="display: inline;" />
                            <asp:LinkButton runat="server" ID="SelectContactLink" Text="select contact" CausesValidation="False" OnClientClick="TargetSelectOpenFinderAdder(); return false;"/>
                            <asiweb:AsiRequiredFieldValidator ControlToValidate="EmailRecipientsTextBox" Display="Dynamic" ID="EmailRecipientsTextBoxRfv" runat="server" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel ID="EmailSubjectLabel" runat="server" AssociatedControlID="EmailSubjectTextBox" />                          
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="EmailSubjectTextBox" RenderPanelField="False" DisplayCaption="False" CssClass="InputXLarge" />
                            <asp:RegularExpressionValidator runat="server" ID="SubjectRegularExpressionValidator" ControlToValidate="EmailSubjectTextBox" 
                                Display="Dynamic" ErrorMessage="May not contain the characters '[()]'" ValidationExpression="[^\[\(\)\]]*" />
                        </div>
                    </div>
                    <asp:Panel ID="hidden" runat="server" style="display: none" aria-hidden="true">
                        <input type="hidden" id="ContactSelectedKey" runat="server" />
                        <asp:Button ID="addContactButton" runat="server" OnClick="AddContactButton_Click" CausesValidation="false" aria-hidden="true" Text="" />
                    </asp:Panel>
                </div>
                <div runat="server" ID="StoredProcedureActionDiv" class="PanelField Left">
                    <div style="display:inline;">
                        <asiweb:StyledLabel AssociatedControlID="StoredProcedureNameTextBox" ID="StoredProcedureNameLabel" runat="server" CssClass="Required" />
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputLarge" ID="StoredProcedureNameTextBox" Required="true" runat="server" translate="yes"/>
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="StoredProcedureNameTextBox" Display="Dynamic" ID="StoredProcedureNameTextBoxRfv" runat="server" />
                    </div>
                
                    <div runat="server" ID="StoredProcedureActionTriggerIdDiv" class="PanelField">
                        <div style="display:inline;">
                            <div class="PanelFieldValue AutoWidth FloatNone">
                                <asiweb:BusinessCheckBox ID="EnableTriggerCheckBox" translate="yes" TextAlign="Right" runat="server" OnCheckedChanged="DisplayTriggerIdDiv" CssClass="PanelFieldLabel" AutoPostBack="True"/>
                            </div>
                            <div class="PanelFieldValue" id="TriggerIdDiv" runat="server">
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel ID="TriggerIdLabel" translate="no" runat="server" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:InfoControl ID="TriggerIdHelp" runat="server" translate="no" Visible="False"/>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <div runat="server" ID="RunAutoPayProcessingDiv">
                    <div class="PanelField Left">
                        <div class="PanelFieldValue AutoWidth FloatNone">
                            <asp:CheckBox ID="GenerateInvoiceCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" translate="yes" />
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldValue AutoWidth FloatNone">
                            <asp:CheckBox ID="SendInvoicePaymentsCheckBox" runat="server" TextAlign="Right" OnCheckedChanged="DisplayInvoiceQueryDiv" CssClass="PanelFieldLabel" translate="yes" AutoPostBack="True" />
                        </div>
                        <div class="PanelField SubItems" runat="server" ID="InvoiceQueryDiv">
                            <asiweb:StyledLabel AssociatedControlID="InvoiceQuerySelector" CssClass="Required" ID="InvoiceQuerySelectorLabel" runat="server" />
                            <div class="PanelFieldValue InputXLargeWrapper">
                                <asiweb:BusinessDocumentBrowserControl ID="InvoiceQuerySelector" runat="server" DocumentHierarchyPath="$" 
                                RootFolder="$" AllowUpwardNavigation="False" ShowAddress="False" DocumentTypesAllowed="IQD" />
                             </div>
                        </div>                        
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldValue AutoWidth FloatNone">
                            <asp:CheckBox ID="RetrieveProcessedPaymentsCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" translate="yes" />
                        </div>
                    </div>
                </div>
                <div style="clear: both;"></div>    
            </ContentTemplate>                  
        </asp:UpdatePanel>          
    </asiweb:PanelTemplateControl2 >  
    <script type="text/javascript">
        function ReturnNewTaskId(taskId, selectedIndex) {
            var oWindow = GetRadWindow();
            if (oWindow != null && oWindow.BrowserWindow != null) {
                var url = GetRadWindow().BrowserWindow.location.href;
                if (url.indexOf('TaskDefinitionId') < 0) url = url + '&TaskDefinitionId=' + taskId;
                if (url.indexOf('SelectedIndex') < 0) url = url + '&SelectedIndex=' + selectedIndex;
                else {
                    var re = /SelectedIndex=(\d*)/g;
                    url = url.replace(re, 'SelectedIndex=' + selectedIndex);
                }
                oWindow.IsDirty = true;
                GetRadWindow().BrowserWindow.location.href = url;
            }
        }

        function CommunicationSelectCallback(window) {
            if (!window.result)
                return;

            var key = window.result;
            var name = window.SelectedDocumentName;

            var hiddenField = document.getElementById('<%= SelectedCommunicationProperties.ClientID %>');
            if (hiddenField != null)
                hiddenField.value = key + ";" + name;

            // clear variables - otherwise cancel has the same values passed through
            window.result = null;
            window.SelectedDocumentPath = null;
            window.SelectedDocumentName = null;
            $('<%= HiddenButton.ClientID %>').click();
        }

        function CommunicationCreateCallback(window) {
            var iframe = window.get_contentFrame();
            if (iframe == null)
                return;

            var doc = iframe.contentWindow.document;
            if (doc.querySelector('[id$="HiddenCommunicationIdForTask"]') != null) {
                var hiddenCommunicationKey = doc.getElementById(doc.querySelector('[id$="HiddenCommunicationIdForTask"]').id);
                if (hiddenCommunicationKey != null) {
                    var key = hiddenCommunicationKey.value;

                    var hiddenField = document.getElementById('<%= SelectedCommunicationProperties.ClientID %>');
                    if (hiddenField != null)
                        hiddenField.value = key;
                }
            }
            $('<%= HiddenButton.ClientID %>').click();
        }

        function ContentCommunicationSelectCallback(window) {
            if (!window.result)
                return;

            var key = window.result;
            var name = window.SelectedDocumentName;

            var hiddenField = document.getElementById('<%= SelectedContentCommunicationProperties.ClientID %>');
            if (hiddenField != null)
                hiddenField.value = key + ";" + name;

            // clear variables - otherwise cancel has the same values passed through
            window.result = null;
            window.SelectedDocumentPath = null;
            window.SelectedDocumentName = null;
            $('<%= HiddenContentCommunicationButton.ClientID %>').click();
        }

        function ContentCommunicationCreateCallback(window) {
            var iframe = window.get_contentFrame();
            if (iframe == null)
                return;

            var doc = iframe.contentWindow.document;
            if (doc.querySelector('[id$="HiddenCommunicationIdForTask"]') != null) {
                var hiddenCommunicationKey = doc.getElementById(doc.querySelector('[id$="HiddenCommunicationIdForTask"]').id);
                if (hiddenCommunicationKey != null) {
                    var key = hiddenCommunicationKey.value;

                    var hiddenField = document.getElementById('<%= SelectedContentCommunicationProperties.ClientID %>');
                    if (hiddenField != null)
                        hiddenField.value = key;
                }
            }
            $('<%= HiddenContentCommunicationButton.ClientID %>').click();
        }

        function TargetFinderCallBackFunction(radwindow) {
            var contactKey;
            
            if (radwindow.newContactKey != null)
                contactKey = radwindow.newContactKey; // We are creating a new contact via the "Add a contact" window 
            else { // We are using a preexisting contact
                var result = radwindow.result;
                if (result != null)
                    contactKey = result[0];
            }
            //Make sure to clear out any values!!
            radwindow.newContactKey = null;
            radwindow.result = null;

            if (contactKey) {
                var contactSelectedKey = window.$get('<%= ContactSelectedKey.ClientID %>');
                contactSelectedKey.value = contactKey;
                var elm = window.$get('<%= addContactButton.ClientID %>');
                if (elm != null)
                    elm.click();
            }
        }

        function TargetSelectOpenFinderAdder() {
            // Add security check to Prevent Dialog            
            OpenPartyFinderAdderWithQueryFilter(TargetFinderCallBackFunction, true, null, '$/ContactManagement/DefaultSystem/Queries/Contacts', null, null, null, null, null, null, "False", '1');
        }
    </script>
</asp:Content> 