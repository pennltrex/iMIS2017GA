<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_Announcement" Codebehind="Announcement.ascx.cs" %>
<%@ Register TagName="TopicList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Forum/TopicList.ascx" %>

<script type="text/javascript">
    function Configure_Callback(dialogWindow)
    {
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= configureTrigger.ClientID %>', "");       
    }
</script>
<Communities:TopicList runat="server" ID="TopicList1" UseParentAtomObject="false" UseKeyFromURL="false" 
    TopicListTitle="Announcements" AddTopicText="Add an announcement" AddTopicToolTip="Add a new announcement"
    AddTopicDialogPanelTemplateTitle="Edit announcement"  EditTopicDialogPanelTemplateTitle="Edit announcement" />
<asp:Button runat="server" id="configureTrigger" style="display:none" Text="Hidden Button"></asp:Button>