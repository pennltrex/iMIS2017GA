<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Wiki_WikiConfigure" Codebehind="WikiConfigure.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None">
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper"/>
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Body" ID="BodyControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" />
    <div class="AutoWidth">
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AllowHtmlInPosts" ID="AllowHtmlInPostsControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AllowAttachments" ID="AllowAttachmentsControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityAreaModerationRequired" ID="ModeratedForumControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" Visible="false" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityWikiAuthorRequired" ID="WikiAuthorRequiredControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />            
    </div>        
</asiweb:PanelTemplateControl2>