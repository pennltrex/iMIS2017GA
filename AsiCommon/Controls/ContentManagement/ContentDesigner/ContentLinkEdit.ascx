<%@ Control Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentLinkEdit" Language="C#" Codebehind="ContentLinkEdit.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/Utility/SelectItemControl.ascx" TagPrefix="asi" TagName="SelectItem" %>

<asp:UpdatePanel runat="server" ID="up1">
    <ContentTemplate>
<asiweb:PanelTemplateControl ID="LinkFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="isInternal" runat="server" BoundPropertyName="IsInternal" DisplayCaption="true" PositionCaption="Right" OnDataChange="IsInternal_Change" AutoPostBack="true"></asiweb:SmartControl>
    </div>
   
    <asp:Panel ID="panLink" runat="server">
        <asiweb:SmartControl ID="LinkURL" runat="server" BoundPropertyName="LinkUrl" DisplayCaption="true" PositionCaption="Left" OnClientChange="updateHyperlinkUrl(this.value);">
            <asiweb:StyledHyperlink ID="VerifyLink" runat="server" IconStyle="verify_Link" Target="_blank" />
        </asiweb:SmartControl>
    </asp:Panel>

    <asp:Panel ID="panContentItem" CssClass="PanelField" runat="server">
        <asi:SelectItem ID="selectItemControl" runat="server"/>
    </asp:Panel>
    <asiweb:SmartControl id="urlParameters" runat="server" BoundPropertyName="UrlParameters" DisplayCaption="true" PositionCaption="Left"></asiweb:SmartControl>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="OpenLinkInNewWindow" runat="server" BoundPropertyName="OpenInNewWindowFlag" DisplayCaption="true" PositionCaption="Right"></asiweb:SmartControl>
    </div>
</asiweb:PanelTemplateControl>
    </ContentTemplate>
</asp:UpdatePanel>

<script language="javascript">

    function updateHyperlinkUrl(url) {
        var anchor = $('<%# VerifyLink.ClientID %>');
        if (IsUrl(url, true)) {
            // Set hyperlink's href as url
            anchor.href = fixUrl(url);
        } else {
            // Disable Hyperlink
            anchor.removeAttribute('href');
        }
    }

    function fixUrl(url) {
        var regexp = new RegExp('^[a-z]+://', 'i');
        if (!regexp.test(url)) {
            url = 'http://' + url;
        }

        return url;
    }

</script>
