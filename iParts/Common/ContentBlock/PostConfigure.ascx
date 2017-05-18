<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostConfigure.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostConfigure" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>
<style>
.reInsertImageWrapper, .reInsertLinkWrapper, .reInsertTableLightWrapper {
    height:275px!important;
}
</style>
<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" ShowHeader="false" FieldSet="true" BorderStyle="None">
    <asiweb:SmartControl runat="server" AtomComponentName="PostDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl runat="server" AtomComponentName="PostDocument" BoundPropertyName="Body" ID="BodyControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" />
    <PostManagement:AttachmentManager runat="server" ID="AttachmentManager1" UseParentAtomObject="true" />
    <asp:Repeater ID="AttachmentsRepeater" runat="server">
        <ItemTemplate>
            <div><asp:Label ID="AttachmentItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label></div>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>