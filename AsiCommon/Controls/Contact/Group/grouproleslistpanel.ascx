<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asi" TagName="BusinessObjectList" Src="~/AsiCommon/Controls/Shared/Utility/BusinessObjectList.ascx" %>
<%@ Control language="c#" Inherits="Asi.Web.UI.Common.Contact.Group.GroupRolesListPanel" Codebehind="GroupRolesListPanel.ascx.cs" %>
<table>
<tr>
	<td>
	<table>
	<tr>
		<td class="PanelTablePrompt"><asi:SmartControl runat="server" BoundPropertyName="IsSingleRole" DisplayType="Caption" /></td>
		<td class="PanelTableValue"><asi:SmartControl id="IsSingleRole_Value" runat="server" BoundPropertyName="IsSingleRole" /></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asi:SmartControl runat="server" BoundPropertyName="InheritRoles" DisplayType="Caption" /></td>
		<td class="PanelTableValue"><asi:SmartControl id="InheritRoles_Value" runat="server" BoundPropertyName="InheritRoles" AutoPostBack="True" /></td>
	</tr>
	</table>
	</td>
</tr>
<tr>
<td>
<asi:BusinessObjectList id="InstanceRolesList" runat="server" 
	AtomComponentName="GroupInstanceRole" PanelTemplateVisible="False" 
	OrderedPropertyNameList="GroupRoleKey,SortRank,IsDefault,IsRequired,IsUnique,DefaultMemberStatusCode"
	LinkBehavior="NewWindowAllShare" TargetContentCode="GroupInstanceRole.Edit" UseUniformKey="False"
	DeleteImmediately="False">
</asi:BusinessObjectList>
<asi:BusinessObjectList id="TypeRolesList" runat="server" 
	AtomComponentName="GroupTypeRole" PanelTemplateVisible="False" 
	OrderedPropertyNameList="GroupRoleKey,SortRank,IsDefault,IsRequired,IsUnique,DefaultMemberStatusCode"
	ShowDelete="False" ShowEdit="False">
</asi:BusinessObjectList>	
</td>
</tr>
</table>