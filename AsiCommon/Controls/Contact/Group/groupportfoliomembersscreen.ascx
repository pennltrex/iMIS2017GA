<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asi" TagName="BusinessObjectList" Src="~/AsiCommon/Controls/Shared/Utility/BusinessObjectList.ascx" %>
<%@ Control language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<script language="C#" runat="server">
public override string AtomComponentName
{
	get{ return "Group"; }
}
protected Asi.Business.Common.Group CurrentGroup
{
	get
	{
		EnsureAtomObject();
		if (Asi.Utilities.Validation.IsEmpty(AtomObject))
		{
			if (CurrentContext.SubjectUniformKey != Guid.Empty)
				AtomObject = new Asi.Business.Common.Group[]{ Asi.Business.Common.GroupController.Group(CurrentContext.SubjectUniformKey, this.StatefulBusinessContainer) };
			else
				return null;
		}
		return (Asi.Business.Common.Group)AtomObject[0];
	}
}
public override void PreCommit(Asi.Web.UI.PreCommitArgs e)
{
	e.AddBusinessItemForCommit(CurrentGroup);
	e.CommitContainer = true;
	base.PreCommit (e);
}
protected override void OnInit(EventArgs e)
{
	base.OnInit(e);
	MembersList.PreDataBinding += new EventHandler(this.MembersList_PreDataBinding);
	//MembersList.ItemEdited =+ new EventHandler(this.MembersList_ItemEdited);

	AddChildUserControl(MembersList);
	MembersList.Container = this.Container;
}
private void MembersList_PreDataBinding(object sender, EventArgs e)
{
	MembersList.AtomObject = CurrentGroup != null ? CurrentGroup.GetMembers(true) : new Asi.Business.BusinessItem[0];
}
public override void CommandButtonRequisites(Asi.Web.UI.CommandButtonRequisiteArgs e)
{
	base.CommandButtonRequisites(e);
	e.SetNeed(Asi.Web.UI.CommandButtonType.Save);
	e.SetNeed(Asi.Web.UI.CommandButtonType.Cancel);
}
</script>

<asi:BusinessObjectList id="MembersList" runat="server" 
	AtomComponentName="GroupMember" PanelTemplateTitle="Group Members"  
	OrderedPropertyNameList="MemberContactKey,CurrentlyActiveRolesString,JoinDate,DropDate"
	LinkBehavior="NewWindowAllShare" TargetContentCode="GroupMember.EditSelectContact" UseUniformKey="False"
	DeleteImmediately="False" DeleteIconStyle="Remove" IncludeParentUniformKey="true">
</asi:BusinessObjectList>
