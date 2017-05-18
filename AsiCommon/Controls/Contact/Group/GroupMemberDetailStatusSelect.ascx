<%@ Control Language="c#" ClassName="GroupMemberDetailStatusSelect" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupMemberDetail"; }
    }
    private Asi.Business.Common.GroupMemberDetail CurrentGroupMemberDetail
    {
        get
        {
            EnsureAtomObject();
            if (Asi.Utilities.Validation.IsEmpty(AtomObject))
                return null;

            return (Asi.Business.Common.GroupMemberDetail)AtomObject[0];
        }
    }
    private Asi.Business.Common.GroupMember CurrentGroupMember
    {
        get
        {
            Asi.Business.Common.GroupMember groupMember = null;
            if (CurrentGroupMemberDetail == null)
            {
                Guid groupMemberKey = Request["iParentUniformKey"] != null ? new Guid(Request["iParentUniformKey"]) : Guid.Empty;
                groupMember = Asi.Business.Common.GroupMemberController.GroupMember(groupMemberKey, StatefulBusinessContainer);
            }
            else
            {
                groupMember = CurrentGroupMemberDetail.GroupMember;
            }
            return groupMember;
        }
    }
    public override void DataBind()
    {
        Asi.Business.Common.GroupMember groupMember = CurrentGroupMember;
        if (groupMember != null)
        {
            Asi.Business.Common.GroupTypeMemberStatus[] typeStatuses = groupMember.Group.GroupType.GetGroupMemberStatus(true);
            Asi.Business.Common.GroupMemberStatus[] statuses = new Asi.Business.Common.GroupMemberStatus[typeStatuses.Length];
            int i = 0;
            foreach (Asi.Business.Common.GroupTypeMemberStatus typeStatus in typeStatuses)
            {
                Asi.Business.Common.GroupMemberStatus status = Asi.Business.Common.GroupMemberStatusController.GroupMemberStatus(typeStatus.GroupMemberStatusCode, StatefulBusinessContainer);
                statuses[i++] = status;
            }
            GroupMemberStatusKey_Input.DataSource = statuses;

            string defaultValue;
            if (CurrentGroupMemberDetail != null)
            {
                defaultValue = groupMember.Group.GetDefaultStatusForRole(CurrentGroupMemberDetail.GroupRoleKey).GroupMemberStatusCode;
            }
            else
            {
                defaultValue = groupMember.Group.GetDefaultStatusForRole(groupMember.Group.DefaultGroupRole.GroupRoleKey).GroupMemberStatusCode;
            }
            GroupMemberStatusKey_Input.DefaultValue = defaultValue;
        }

        base.DataBind();
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (Page.IsPostBack)
        {
            DataBind();
        }
    }
    private void SetDefaultMemberStatus()
    {
        Asi.Business.Common.GroupMember groupMember = CurrentGroupMember;
        
    }
</script>
<asi:SmartControl id="GroupMemberStatusKey_Input" runat="server" BoundPropertyName="GroupMemberStatusCode" DisplayType="EditableField" />
