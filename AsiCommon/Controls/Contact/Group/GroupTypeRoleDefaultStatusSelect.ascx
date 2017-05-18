<%@ Control Language="c#" ClassName="GroupTypeRoleDefaultStatusSelect" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupTypeRole"; }
    }
    public override void DataBind()
    {
        Guid groupTypeKey = Request["iParentUniformKey"] != null ? new Guid(Request["iParentUniformKey"]) : Guid.Empty;
        Asi.Business.Common.GroupType groupType = Asi.Business.Common.GroupTypeController.GroupType(groupTypeKey, StatefulBusinessContainer);
        Asi.Business.Common.GroupTypeMemberStatus[] typeStatuses = groupType.GetGroupMemberStatus(true);
        Asi.Business.Common.GroupMemberStatus[] statuses = new Asi.Business.Common.GroupMemberStatus[typeStatuses.Length];
        int i = 0;
        foreach (Asi.Business.Common.GroupTypeMemberStatus typeStatus in typeStatuses)
        {
            Asi.Business.Common.GroupMemberStatus status = Asi.Business.Common.GroupMemberStatusController.GroupMemberStatus(typeStatus.GroupMemberStatusCode, StatefulBusinessContainer);
            statuses[i++] = status;
        }
        GroupTypeMemberStatusKey_Input.DataSource = statuses;
        
        base.DataBind();
    }
</script>
<asi:SmartControl id="GroupTypeMemberStatusKey_Input" runat="server" BoundPropertyName="DefaultMemberStatusCode" DisplayType="EditableField" />
