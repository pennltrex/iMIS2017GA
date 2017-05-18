<%@ Control Language="c#" ClassName="GroupMemberDetailRoleSelect" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupMemberDetail"; }
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }
    public override void DataBind()
    {
        Guid groupMemberKey = Request["iParentUniformKey"] != null ? new Guid(Request["iParentUniformKey"]) : Guid.Empty;
        Asi.Business.Common.GroupMember groupMember = Asi.Business.Common.GroupMemberController.GroupMember(groupMemberKey, StatefulBusinessContainer);
        if (groupMember != null)
        {
            GroupRoleKey_Input.DataSource = groupMember.Group.GetGroupRoles();
            GroupRoleKey_Input.DefaultValue = groupMember.Group.DefaultGroupRole.GroupRoleKey;
        }

        base.DataBind();
    }
</script>
<asi:SmartControl id="GroupRoleKey_Input" runat="server" BoundPropertyName="GroupRoleKey" DisplayType="EditableField" AutoPostBack="true" />
