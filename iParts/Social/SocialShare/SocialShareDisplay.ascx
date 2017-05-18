<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialShareDisplay.ascx.cs" Inherits="Asi.Web.iParts.Social.SocialShare.SocialShareDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<div runat="server" ID="LabelHeader" class="PanelFieldLabel SocialShare" Visible="False">
    <asiweb:StyledLabel runat="server" ID="LegendLabel" Visible="False" translate="yes" />
</div>
<%-- IMPORTANT: It is essential to exclude the SocialNetType="SendEmail" from either the MainButtons or CompactButtons --%>
<%-- Inclusion of this type results in the Page validation failing --%>
<telerik:RadSocialShare runat="server" ID="RadSocialShare1" translate="yes" DialogWidth="600px" DialogHeight="400px">
    <MainButtons>
        <telerik:RadSocialButton SocialNetType="ShareOnFacebook" LabelText="Share on Facebook" />
        <telerik:RadSocialButton SocialNetType="ShareOnTwitter" LabelText="Share on Twitter" />
        <telerik:RadSocialButton SocialNetType="LinkedIn" LabelText="Share on LinkedIn" />
        <telerik:RadSocialButton SocialNetType="MailTo" LabelText="Email" />
        <telerik:RadSocialButton SocialNetType="CompactButton" LabelText="More options" />
    </MainButtons>
    <CompactButtons>
        <telerik:RadSocialButton SocialNetType="GoogleBookmarks" LabelText="Bookmarks" />       
        <telerik:RadSocialButton SocialNetType="ShareOnGooglePlus" LabelText="Google+" />       
        <telerik:RadSocialButton SocialNetType="MySpace" />
        <telerik:RadSocialButton SocialNetType="Reddit" />
        <telerik:RadSocialButton SocialNetType="StumbleUpon" />        
        <telerik:RadSocialButton SocialNetType="Tumblr" />
        <telerik:RadSocialButton SocialNetType="ShareOnYammer" LabelText="Yammer" />
    </CompactButtons>
</telerik:RadSocialShare>