<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_BlogConfigure" Codebehind="BlogConfigure.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None">
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Description" ID="DescriptionControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper"/>
        <div class="AutoWidth">
            <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AllowHtmlInPosts" ID="AllowHtmlInPostsControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
            <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="AllowAttachments" ID="AllowAttachmentsControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
        </div>
</asiweb:PanelTemplateControl2>