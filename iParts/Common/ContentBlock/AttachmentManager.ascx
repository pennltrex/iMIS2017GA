<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentManager.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.AttachmentManager" %>

<asp:LinkButton ID="LaunchObjectBrowser" runat="server" CausesValidation="false" CssClass="NotPrinted"></asp:LinkButton>
<asp:Button ID="AttachmentRefreshButton" runat="server" style="display: none;" CausesValidation="false" OnClick="AttachmentRefresh_Click" />
<script type="text/javascript">
        //<![CDATA[

    function BSABrowserCallback_<%= ClientID %>(window)
    {
        setTimeout(function () { InitiateControlEventWithArgument('<%= AttachmentRefreshButton.ClientID %>', ""); }, 100);
    }
            //]]>
</script>