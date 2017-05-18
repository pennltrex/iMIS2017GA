<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_AttachmentManager" Codebehind="AttachmentManager.ascx.cs" %>

<asp:LinkButton ID="LaunchObjectBrowser" runat="server" CausesValidation="false" CssClass="NotPrinted"></asp:LinkButton>
<asp:Button ID="AttachmentRefreshButton" runat="server" style="display: none;" CausesValidation="false" OnClick="AttachmentRefresh_Click" Text="Refresh Attachments" />
<script type="text/javascript">
    function BSABrowserCallback_<%= ClientID %>(window)
    {
        setTimeout(function() { InitiateControlEventWithArgument('<%= AttachmentRefreshButton.ClientID %>', ""); }, 100);
    }
</script>