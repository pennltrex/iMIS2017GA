<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Comment_CommentConfigure" Codebehind="CommentConfigure.ascx.cs" %>
<%@ Register TagName="AttachmentManager" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentManager.ascx" %>

<script type="text/javascript">
    SetFormPostAnchor();
    function SetFormPostAnchor()
    {
        // Add a anchor target to allow the page to scroll to the post.
        if (document != null && document.aspnetForm != null)
            document.aspnetForm.action = document.aspnetForm.action + "#Posted";
    }        
</script>

<a id="Posted" tabindex="-1"></a>
<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" FieldSet="true" CssClass="CommentConfigure" ShowBorder="False" translate="yes">
    <div class="CommentConfigure">
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        <asp:Label ID="BodyControlLabel" runat="server" CssClass="Label" Text="Body" Visible="False" />
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Body" ID="BodyControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        <div style="clear:both;"></div>
        <Communities:AttachmentManager runat="server" ID="AttachmentManager1" UseParentAtomObject="true" />
        <asp:Label ID="AttachmentError" runat="server" Visible="False" CssClass="Error">Error attaching file. Please try again.</asp:Label>
        <asp:Repeater ID="AttachmentsRepeater" runat="server">
            <ItemTemplate>
                <div><asp:Label ID="AttachmentItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label></div>
            </ItemTemplate>
        </asp:Repeater>       
    </div>
</asiweb:PanelTemplateControl2>
