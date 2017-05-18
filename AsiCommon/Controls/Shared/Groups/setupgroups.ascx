<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Utility.SetupGroups" Codebehind="SetupGroups.ascx.cs" %>
<%@ Reference Control="~/asicommon/controls/shared/listbuilder/listbuilder.ascx" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Text="Group Properties" Collapsible="true" BorderStyle="none">
    <asiweb:SmartPanel runat="server" ID="SmartPanel" UseParentAtomObject="True" EnableTheming="false" ShowHeader="false" ShowTitle="false"  
        PropertiesToShow="Name,Description" Collapsible="false" />
</asiweb:PanelTemplateControl2>

<asiweb:PanelTemplateControl2 ID="CurrentMembersListerPanel" runat="server" Text="Current Group Members" Collapsible="true" BorderStyle="none">
    <asiweb:Lister2 runat="server" ID="CurrentMembersLister"
        DeleteColumnLocation="Beginning" DeleteColumnText="remove"
        DeleteConfirmText="Are you sure you want to remove this member from the Group?"
        Title="" ExportButtonLocation="None" 
        DataKeyNames="key_contactKey" DisplayPropertiesList="Full Name,Company,Contact Id"
        OnNeedDataSource="CurrentMembersLister_NeedDataSource"
        OnItemDeleted="CurrentMembersLister_ItemDeleted"
        AjaxEnabled="false"
        EnableClientSideDelete="false"
        /> 
</asiweb:PanelTemplateControl2>

<asiweb:PanelTemplateControl2 ID="AvailableMembersListerPanel" runat="server" Text="Select New Members" Collapsible="true" BorderStyle="none">
    <asiweb:Lister2 runat="server" AjaxEnabled="false"
        ID="AvailableMembersLister" Title=""
        LinkTargetBehavior="RaiseEvent" SelectMode="true" SelectColumnText="Add"
        UseUniformKey="True" ExportButtonLocation="None" DataKeyNames="key_UniformKey"
        OnNeedDataSource="AvailableMembersLister_NeedDataSource"
        OnPreEvaluateQuery="AvailableMembersLister_PreEvaluateQuery"
        OnItemSelected="AvailableMembersLister_ItemSelected"
        EnableClientSideDelete="false" CollapsiblePanelTemplate="false" />
</asiweb:PanelTemplateControl2>
