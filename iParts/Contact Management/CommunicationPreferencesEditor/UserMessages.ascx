<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserMessages.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.CommunicationPreferencesEditor.UserMessages" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None" >
    
    <asp:Label runat="server" id="UserMessagesLabel" Text='<%# ResourceManager.GetPhrase("UserMessages","User messages") %>' CssClass="SectionTitle"/> 
    <asp:HiddenField runat="server" ID="PromptHidden"/>
    <asp:HiddenField runat="server" ID="AdditionalInfoHidden"/>
    <div class="row">
        <div class="col-sm-5">
            <div class="PanelField Top Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel ID="PromptLabel" runat="server" AssociatedControlID="PromptTextbox" Text='<%# ResourceManager.GetPhrase("UserMessages.PromptToChooseCommunicationTypes","Prompt to choose communication types") %>' translate="yes"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="PromptTextBox" runat="server" TextMode="MultiLine" Required="False" Rows="5" CssClass="InputXXLarge" /> 
                </div>
            </div>
            <div class="PanelField Top Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel ID="AdditionalInformation" runat="server" AssociatedControlID="AdditionalInformationTextBox" Text='<%# ResourceManager.GetPhrase("UserMessages.AdditionalInformation","Additional Information") %>' translate="yes"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="AdditionalInformationTextBox" runat="server" TextMode="MultiLine" Required="False" Rows="5" CssClass="InputXXLarge" />
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <asiweb:PanelTemplateControl2 runat="server" ID="DisplayPanel" TemplateTitle='<%# ResourceManager.GetPhrase("CommunicationPreferences", "Preview of communication preferences") %>' ShowHeader="True" Collapsible="False" ScrollBars="None" ShowBorder="True" translate="yes">
                <asp:Panel runat="server" ID="Panel2" CssClass="CommunicationPreferencesSection Section">
                    <strong translate="yes"><asiweb:BusinessLiteral runat="server" ID="PromptLiteral" ></asiweb:BusinessLiteral></strong>
                    <asp:Repeater ID="CommunicationTypeRepeater" runat="server" OnItemDataBound="CommunicationTypeRepeater_ItemDataBound">
                        <HeaderTemplate>
                            <div class="CheckBoxList">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asiweb:BusinessCheckBox runat="server" ID="CommunicationTypeCheckBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" Enabled="False"  />
                            <asp:HiddenField runat="server" ID="CommunicationTypeKey"/>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div> <%-- End CheckBoxList class --%>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel> 
                <asp:Panel runat="server" ID="UnsubscribeContainer" Visible="False" CssClass="CheckBoxList Section">
                    <asiweb:BusinessCheckBox runat="server" ID="UnsubscribeCheckBox" ClientIDMode="Static" Visible="False" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" Enabled="false" />
                </asp:Panel>
                <asiweb:BusinessLiteral runat="server" ID="AdditionalInfoLiteral"></asiweb:BusinessLiteral>
            </asiweb:PanelTemplateControl2>
            <div class="PanelField Left">
                <asiweb:StyledButton runat="server" ID="PreviewButton" Text='<%# ResourceManager.GetPhrase("RefreshPreview", "Refresh Preview") %>' AutoPostBack="True" OnClick="PreviewButton_OnClick" />
            </div>
        </div>
    </div>
</asiweb:PanelTemplateControl2>


 