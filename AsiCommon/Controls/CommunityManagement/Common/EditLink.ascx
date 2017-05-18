﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_EditLink" Codebehind="EditLink.ascx.cs" %>

<script type="text/javascript">
    function EditItem_Callback_<%= ClientID %>(dialogWindow)
    {
        // Trigger a postback when a Blog is added.
        if (dialogWindow.IsDirty)
        {
           // remove any anchor references from the current url
           if (window.location.href.indexOf("#")>=0)
                window.location.href = window.location.href.substring(0,window.location.href.indexOf("#"));  
           else
                window.location.href = window.location.href;   
        }
    }
</script>
<asp:LinkButton ID="lnkEdit" runat="server" CssClass="NotPrinted" CausesValidation="false"></asp:LinkButton>