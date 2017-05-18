<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationPreferencesEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.CommunicationPreferencesEditor.CommunicationPreferencesEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl2 runat="server" ID="DisplayPanel" ShowHeader="False" Collapsible="False" ScrollBars="None" BorderStyle="None">
    <asp:Panel runat="server" ID="Panel2" CssClass="CommunicationPreferencesSection Section">
        <asp:Repeater ID="CommunicationTypeRepeater" runat="server" OnItemDataBound="CommunicationTypeRepeater_ItemDataBound">
            <HeaderTemplate>
                <strong><asiweb:BusinessLiteral runat="server" ID="PromptLiteral"></asiweb:BusinessLiteral></strong>
                <div class="CheckBoxList">
            </HeaderTemplate>
            <ItemTemplate>
                <asiweb:BusinessCheckBox runat="server" ID="CommunicationTypeCheckBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" Enabled="True" />
                <asp:HiddenField runat="server" ID="CommunicationTypeKey"/>
            </ItemTemplate>
            <FooterTemplate>
                </div> <%-- End CheckBoxList class --%>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel> 
    <asp:Panel runat="server" ID="UnsubscribeContainer" Visible="False" CssClass="CheckBoxList Section">
        <asiweb:BusinessCheckBox runat="server" ID="UnsubscribeCheckBox" ClientIDMode="Static" Visible="False" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" OnChange="javascript:DeselectCommunicationTypes();"/>
    </asp:Panel>
    <asp:Panel runat="server" translate="yes">
        <asiweb:BusinessLiteral runat="server" ID="AdditionalInfoLiteral"></asiweb:BusinessLiteral>
    </asp:Panel>
    <br/>
    <br/>
    <div id="LocalButtonBar" runat="server">
        <asiweb:StyledButton ID="SaveButton" CssClass="PrimaryButton" OnClick="OnSaveButtonClicked" runat="server"/>
        <asiweb:StyledButton ID="CancelButton" CssClass="TextButton" OnClick="OnCancelButtonClicked" runat="server"/>
    </div>
</asiweb:PanelTemplateControl2>

<script type="text/javascript">
    function DeselectCommunicationTypes() {
        if (jQuery('#UnsubscribeCheckBox').is(':checked')) {
            jQuery('.CommunicationType input:checkbox').each(function() {
                jQuery(this).attr('checked', false);
                jQuery(this).attr('disabled', true);
            });
        } else {
            jQuery('.CommunicationType input:checkbox').each(function() {
                jQuery(this).attr('disabled', false);
            });
        }
    }
</script>

