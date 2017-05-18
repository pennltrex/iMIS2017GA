<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asi" TagName="BusinessObjectList" Src="~/AsiCommon/Controls/Shared/Utility/BusinessObjectList.ascx" %>
<%@ Control language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "User"; }
    }
    protected Asi.Business.Common.User CurrentUser
    {
	    get
	    {
		    EnsureAtomObject();
		    if (Asi.Utilities.Validation.IsEmpty(AtomObject))
		    {
                return null;
		    }
		    return (Asi.Business.Common.User)AtomObject[0];
	    }
    }
    protected override void OnInit(EventArgs e)
    {
	    base.OnInit(e);
        DepartmentsList.PreDataBinding += new EventHandler(this.DepartmentsList_PreDataBinding);
        this.Load += new EventHandler(Page_Load);

        AddChildUserControl(DepartmentsList);
        DepartmentsList.Container = this.Container;
    }

    private void Page_Load(object sender, EventArgs e)
    {
    }
    private void DepartmentsList_PreDataBinding(object sender, EventArgs e)
    {
	    DepartmentsList.AtomObject = CurrentUser != null ? CurrentUser.GetDepartmentMemberships() : new Asi.Business.BusinessItem[0];
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (CurrentUser == null || CurrentUser.RowState == System.Data.DataRowState.Added)
        {
            NullUserMessage.Text = Asi.ResourceManager.GetPhrase("User.NullUser", "You must save this User before editing their Departments list.");
            NullUserMessage.Visible = true;
            DepartmentsList.Visible = false;
        }
        else
        {
            DepartmentsList.Visible = true;
            NullUserMessage.Visible = false;
            if (Page.IsPostBack)
                DepartmentsList.DataBind();
        }
    }
    public override void PreCommit(Asi.Web.UI.PreCommitArgs e)
    {
        base.PreCommit(e);
        
        // Set user's default perspective to be the department's default perspective
        // TODO: in the future (post-pecos) the perspective list will be available on this page, so this
        // should be removed.
        Asi.Business.Common.GroupPerspective gp = Asi.Business.Common.GroupPerspectiveController.GetDefaultPerspective(CurrentUser.DefaultDepartmentGroupKey, StatefulBusinessContainer);
        CurrentUser.DefaultPerspectiveKey = gp.PerspectiveKey;
    }
</script>

<asi:BusinessObjectList id="DepartmentsList" runat="server" 
	AtomComponentName="GroupMember" PanelTemplateVisible="False" ShowEdit="False"
	OrderedPropertyNameList="GroupKey,JoinDate"
	LinkBehavior="NewWindowAllShare" AddContentCode="User.AddDepartment" UseUniformKey="False"
	DeleteImmediately="False" DeleteIconStyle="Remove" IncludeParentUniformKey="true">
</asi:BusinessObjectList>
<asp:Label ID="NullUserMessage" runat="server" Visible="false" style="font-style:italic"></asp:Label>