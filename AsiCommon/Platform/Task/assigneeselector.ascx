<%@ Control Language="c#" Inherits="Asi.Web.UI.Task.AssigneeSelector" Codebehind="AssigneeSelector.ascx.cs" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<span id="AssigneeTypeSelectRadioButtons"><input runat="server" id="AssigneeTypeSelect0" type="radio" name="AssigneeTypeSelect"
		value="User" onclick="ChangeAssigneeType()"><label runat="server" id="AssigneeTypeSelect0Label">User</label>
	<input runat="server" id="AssigneeTypeSelect1" type="radio" name="AssigneeTypeSelect"
		value="Group" onclick="ChangeAssigneeType()"><label runat="server" id="AssigneeTypeSelect1Label">Group</label>
</span><span id="UserSpan">
	<asi:SmartControl id="AssigneeUserInput" runat="server" BoundPropertyName="AssigneeUserKey" RefBusinessObjectType="User"></asi:SmartControl></span>
<span id="GroupSpan">
	<asi:SmartControl id="AssigneeGroupInput" runat="server" BoundPropertyName="AssigneeGroupKey" RefBusinessObjectType="Group"></asi:SmartControl></span>
<script language="javascript">
function ChangeAssigneeType()
{
	var userSelected = document.getElementById(document.getElementById('AssigneeTypeSelect0_ClientID').value).checked == true;
	var groupSelected = document.getElementById(document.getElementById('AssigneeTypeSelect1_ClientID').value).checked == true;
	
	var userSpan = document.getElementById('UserSpan');
	var groupSpan = document.getElementById('GroupSpan');
	
	userSpan.style["display"] = userSelected ? "block" : "none";
	groupSpan.style["display"] = groupSelected ? "block" : "none";
}
ChangeAssigneeType();
</script>
