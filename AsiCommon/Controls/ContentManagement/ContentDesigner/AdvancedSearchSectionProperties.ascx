<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_AdvancedSearchSectionProperties" Codebehind="AdvancedSearchSectionProperties.ascx.cs" %>
<%@ Register TagPrefix="asiweb" TagName="TagSelector" Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" %>
<script type="text/javascript">
    var tagGroupId;
    var tagButtonId;
    function EditTagGroup(groupId, buttonId)
    {
        tagGroupId = groupId;
        tagButtonId = buttonId;
        var tagGroup = document.getElementById(groupId).value;
        ShowDialog(gWebRoot + '/iMIS/ContentManagement/TagGroupProperties.aspx', tagGroup, 500, 500, 'Edit Tag Group', null, 'E', EditTagGroup_Callback, null, false, true);
    }
    function EditTagGroup_Callback(dialogWindow)
    {
        if (!dialogWindow.result)
            return;
        InitiateControlEventWithArgument(tagButtonId, dialogWindow.result);
        tagGroupId = null;
        tagButtonId = null;
    }
</script>
<asiweb:PanelTemplateControl ID="SectionProperties" runat="server" RoundedCorners="false" Collapsed="false" FieldSet="true">
    <asiweb:SmartControl ID="AddSectionDivider" runat="server" BoundPropertyName="AddSectionDivider" DisplayCaption="true" Visible="false" />
    <asiweb:SmartControl ID="Title" runat="server" BoundPropertyName="SearchSectionTitle" DisplayCaption="true" />
    <asiweb:SmartControl ID="Introduction" runat="server" BoundPropertyName="Introduction" DisplayCaption="true" />
    <div style="clear: both; margin-bottom: 20px;">
        <asp:Label ID="TagsLabel" runat="server" Text="Tags to Display" />
        <asiweb:TagSelector ID="SearchTags" runat="server" />
        <asiweb:SmartControl ID="IncludeRelatedTagsControl" runat="server" BoundPropertyName="IncludeRelatedTags" DisplayCaption="true" PositionCaption="Right"></asiweb:SmartControl>
    </div>
    <br />
    <asp:Repeater ID="TagGroups" runat="server" OnItemCommand="TagGroups_ItemCommand" OnItemCreated="TagGroups_ItemCreated" OnItemDataBound="TagGroups_ItemDataBound">
        <HeaderTemplate>
            <div style="float:left"><asp:Label ID="TagGroupHeaderLabel" runat="server" Text="Tag Groups"></asp:Label></div>
            <div style="float:right"><asp:LinkButton ID="AddButton" Runat="server" CommandName="add">add</asp:LinkButton></div>
            <div style="clear:both"></div>
        </HeaderTemplate>
        <ItemTemplate>
            <div style="float:left">
                <asp:LinkButton ID="EditButton" runat="server" Text="edit" CommandName="edit"></asp:LinkButton>
                <asiweb:SmartControl ID="TagGroupName" runat="server" DisplayType="ReadOnlyField" BoundPropertyName="TagGroupName" UseParentControlBusinessItem="false" AtomComponentName="TagGroup" />
                <asp:HiddenField ID="SerializedTagGroup" runat="server" />
                <asp:LinkButton ID="TagGroupChanged" runat="server" style="display: none" CommandName="update" CommandArgument="foo"></asp:LinkButton>
            </div>
            <div style="float:right"><asp:LinkButton ID="DeleteButton" runat="server" CommandName="delete">delete</asp:LinkButton></div>
            <div style="clear:both"></div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Label ID="NoTagGroupsMessage" runat="server" Text="Click 'add' to add a new Tag Group." Visible="false"></asp:Label>
</asiweb:PanelTemplateControl>
