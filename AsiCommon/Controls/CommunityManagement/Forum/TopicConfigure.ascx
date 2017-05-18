<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_TopicConfigure" Codebehind="TopicConfigure.ascx.cs" %>
<%@ Register TagName="AttachmentManager" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentManager.ascx" %>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None">
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Body" ID="BodyControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        <Communities:AttachmentManager runat="server" ID="AttachmentManager1" UseParentAtomObject="true" />
        <asp:Repeater ID="AttachmentsRepeater" runat="server">
            <ItemTemplate>
                <div><asp:Label ID="AttachmentItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label></div>
            </ItemTemplate>
        </asp:Repeater>
</asiweb:PanelTemplateControl2>