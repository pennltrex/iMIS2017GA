<%@ Control Language="c#" Inherits="AsiCommon_Controls_ContentManagement_AuthorityGroupSetup" Codebehind="AuthorityGroupSetup.ascx.cs" %>
<%@ Reference Control="~/asicommon/controls/shared/listbuilder/listbuilder.ascx" %>
     
<asiweb:PanelTemplateControl2 ID="GroupSettings" runat="server" TemplateTitle="Group details" FieldSet="true" Collapsible="false">
    <asiweb:SmartControl ID="GroupName" runat="server" BoundPropertyName="Name" DisplayCaption="true" />
    <asiweb:SmartControl ID="GroupDescription" runat="server" BoundPropertyName="Description" DisplayCaption="true" />
    <asiweb:SmartControl ID="IsMasterAdmin" runat="server" BoundPropertyName="IsMasterAdmin" DisplayCaption="true" 
        UseParentControlBusinessItem="false" OnDataChange="IsMasterAdmin_Changed" PositionCaption="Right" />
</asiweb:PanelTemplateControl2>

<asiweb:PanelTemplateControl2 ID="MembershipPanel" runat="server" TemplateTitle="Group membership" Collapsible="True">
    <h3><asiweb:StyledLabel runat="server" ID="CurrentMemberLabel" Text="Current group members" translate="yes"/></h3>
    <asiweb:Lister2 runat="server" ID="CurrentMembersLister" 
        PageSize="10" 
        SortingEnabled="True" 
        ExportButtonLocation="None" 
        EditColumnLocation="End" 
        EditColumnText="Edit permissions"
        EditColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
        EditColumnButtonType="Image"
        UseEditForms="true" 
        EditFormUserControlPath="~/AsiCommon/Controls/ContentManagement/AuthorityGroupRoles.ascx" 
        DeleteColumnLocation="End" 
        DeleteColumnText="Remove" 
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        DeleteColumnButtonType="Image" 
        GridIconColumnCssClass="grid-icon-column"
        DataKeyNames="GroupMemberKey" 
        DisplayPropertiesList="Full Name,ID,CurrentPermissionsString" 
        DisplayPropertiesTitleOverride="Name,ID,Current Permissions" 
        DataSourceIsRealDataSource="True"
        OnNeedDataSource="CurrentMembersLister_NeedDataSource" 
        OnItemDeleted="CurrentMembersLister_ItemDeleted"
        OnItemDataBound="CurrentMembersLister_ItemDataBound" 
        EnableShowAllButton="False" 
        PagerMode="NextPrevAndNumeric" />
    <br />
    <h3><asiweb:StyledLabel runat="server" ID="NewMembersLabel" Text="Select new group members" translate="yes"/></h3>
    <asiweb:Lister2 runat="server" AjaxEnabled="false"
        ID="AvailableMembersLister" 
        LinkTargetBehavior="RaiseEvent" 
        PageSize="10"
        SelectMode="true" 
        SelectColumnText="Add"
        UseUniformKey="True" 
        ExportButtonLocation="None"
        DataSourceDocumentPath="$/Common/Queries/Search/User" 
        DataKeyNames="key_UniformKey"
        CollapsiblePanelTemplate="False" 
        PagerMode="NextPrevAndNumeric"
        />
</asiweb:PanelTemplateControl2>
