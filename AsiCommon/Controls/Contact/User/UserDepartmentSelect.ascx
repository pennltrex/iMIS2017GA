<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Control language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupMember"; }
    }
    protected Asi.Business.Common.GroupMember CurrentGroupMember
    {
        get
        {
            EnsureAtomObject();
            if (Asi.Utilities.Validation.IsEmpty(AtomObject))
                return null;
            return (Asi.Business.Common.GroupMember)AtomObject[0];
        }
    }
    protected Asi.Business.Common.User CurrentUser
    {
	    get
	    {
            if (CurrentGroupMember != null)
                return Asi.Business.Common.UserController.User(CurrentGroupMember.MemberContactKey);
            
            if (Request["iParentUniformKey"] != null)
                return Asi.Business.Common.UserController.User(new Guid(Request["iParentUniformKey"]));

            return null;            
	    }
    }
    public override void DataBind()
    {
        Asi.Business.Common.User user = CurrentUser;
        if (user != null)
            AvailableDepartments.DataSource = user.GetAvailableDepartments();
        base.DataBind();
    }
</script>

<asi:SmartControl ID="AvailableDepartments" runat="server" 
    HIControlType="DropDownList" BoundPropertyName="GroupKey" 
    DisplayType="EditOnce" DataValueField="GroupKey" DataTextField="Name" />
