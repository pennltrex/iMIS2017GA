<%@ Control Language="c#" ClassName="GroupInstanceRoleDefaultStatusSelect" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupInstanceRole"; }
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }
    public override void DataBind()
    {
        Asi.Business.Common.Group group = Asi.Business.Common.GroupController.Group(CurrentContext.SubjectUniformKey, StatefulBusinessContainer);
        if (group != null)
        {
            Asi.Business.Common.GroupTypeMemberStatus[] typeStatuses = group.GroupType.GetGroupMemberStatus(true);
            Asi.Business.Common.GroupMemberStatus[] statuses = new Asi.Business.Common.GroupMemberStatus[typeStatuses.Length];
            int i = 0;
            foreach (Asi.Business.Common.GroupTypeMemberStatus typeStatus in typeStatuses)
            {
                Asi.Business.Common.GroupMemberStatus status = Asi.Business.Common.GroupMemberStatusController.GroupMemberStatus(typeStatus.GroupMemberStatusCode, StatefulBusinessContainer);
                statuses[i++] = status;
            }
            GroupInstanceRoleDefaultMemberStatusKey_Input.DataSource = statuses;
            //GroupMemberStatusKey_Input.DefaultValue = group.GroupType.def;
        }

        base.DataBind();
    }
</script>
<asi:SmartControl id="GroupInstanceRoleDefaultMemberStatusKey_Input" runat="server" BoundPropertyName="DefaultMemberStatusCode" DisplayType="EditableField" />
