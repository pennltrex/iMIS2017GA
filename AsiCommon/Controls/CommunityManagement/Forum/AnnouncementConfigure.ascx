<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_AnnouncementConfigure" Codebehind="AnnouncementConfigure.ascx.cs" %>
<asiweb:PanelTemplateControl2 ID="AnnouncementConfigurePanel" runat="server" TemplateTitle="Configure announcements" Collapsible="false" FieldSet="true" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="AllowNewPostsControl" runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AnnouncementForumAllowNewPosts" UseParentControlBusinessItem="false" OnNeedBoundAtom="SmartControl_NeedBoundAtom" DisplayCaption="true" PositionCaption="Right" />
        <asiweb:SmartControl ID="AllowCommentsControl" runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AnnouncementForumAllowComments" UseParentControlBusinessItem="false" OnNeedBoundAtom="SmartControl_NeedBoundAtom" DisplayCaption="true" PositionCaption="Right" />
    </div>
</asiweb:PanelTemplateControl2>