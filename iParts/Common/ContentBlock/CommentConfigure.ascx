<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentConfigure.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.CommentConfigure" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>
<style>
.reInsertImageWrapper, .reInsertLinkWrapper, .reInsertTableLightWrapper {
    height:275px!important;
}
</style>
<script type="text/javascript">
    //<![CDATA[
    SetFormPostAnchor();
    function SetFormPostAnchor() {
        // Add a anchor target to allow the page to scroll to the post.
        var theForm = jQuery('#aspnetForm');
        if (theForm != null) {
            var actionValue = theForm.attr('action');
            if (actionValue != null) theForm.attr('action', actionValue + '#Posted');
        }
    }
    //]]>
</script>
<a id="postedAnchor" name="Posted" runat="server" />
<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" FieldSet="true" CssClass="CommentConfigure" BorderStyle="None">
    <div class="CommentConfigure">
        <asiweb:SmartControl runat="server" AtomComponentName="PostDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper"/>
        <asiweb:SmartControl runat="server" AtomComponentName="PostDocument" BoundPropertyName="Body" ID="BodyControl" 
            DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" ValidationGroup='<%# ClientID %>' InputFieldCssClass="InputLargeWrapper" />
        <PostManagement:AttachmentManager runat="server" ID="AttachmentManager1" UseParentAtomObject="true" />
        <asp:Repeater ID="AttachmentsRepeater" runat="server">
            <ItemTemplate>
                <div><asp:Label ID="AttachmentItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label></div>
            </ItemTemplate>
        </asp:Repeater>     
    </div>
</asiweb:PanelTemplateControl2>

