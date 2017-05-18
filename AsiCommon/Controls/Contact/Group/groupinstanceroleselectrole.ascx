<%@ Control Language="c#" AutoEventWireup="false" ClassName="GroupInstanceRoleSelectRole" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
override public string AtomComponentName
{
	get{ return "GroupInstanceRole"; }
}
private Asi.Business.Common.GroupInstanceRole CurrentRole
{
	get
	{
		try
		{
			EnsureAtomObject();
		}
		catch (System.Reflection.TargetInvocationException tie)
		{
			AddUserMessage(new Asi.Web.UI.UserControlMessage(this.GetType().FullName, Asi.Web.UI.UserControlMessageTypes.Error, tie.InnerException.Message));
		}
		catch (Exception exception)
		{
			AddUserMessage(new Asi.Web.UI.UserControlMessage(this.GetType().FullName, Asi.Web.UI.UserControlMessageTypes.Error, exception.Message));
		}
		
		if (Asi.Utilities.Validation.IsEmpty(AtomObject))
			return null;
		return (Asi.Business.Common.GroupInstanceRole)AtomObject[0];
	}
}
private Asi.Business.Common.Group CurrentGroup
{
	get
	{
		if (CurrentRole != null)
			return CurrentRole.Group;
		
		return Asi.Business.Common.GroupController.Group(CurrentContext.SubjectUniformKey, StatefulBusinessContainer);
	}
}
protected override void OnInit(EventArgs e)
{
	base.OnInit(e);
    if (CurrentGroup != null)
	    GroupRoleKey_Input.DataSource = CurrentGroup.GetGroupTypeGroupRoles();
}
</script>
<asi:SmartControl id="GroupRoleKey_Input" runat="server" BoundPropertyName="GroupRoleKey" DisplayType="EditOnce" />
