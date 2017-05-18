<%@ Control Language="c#" ClassName="TaskItemProcessHost" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="asi" TagName="WorkflowProcessHost" Src="~/AsiCommon/Controls/WorkflowManagement/WorkflowProcessHost.ascx" %>

<%@import namespace="Asi" %>
<%@import namespace="Asi.Business" %>
<%@import namespace="Asi.Business.Common" %>
<%@import Namespace="Asi.Business.Contact" %>
<%@import Namespace="Asi.Business.ContentManagement" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
        get { return "Task"; }
    }
    
    private void PageLoad(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            WorkflowControl.Reset();
            if (Request["iKey"] != null)
            {
                Task t = TaskController.Task(new Guid(Request["iKey"]), StatefulBusinessContainer);
                WorkflowControl.ProcessInstanceKey = t.WorkflowInstanceKey;
            }
            else
            {
                WorkflowControl.PackageKey = new Guid("4c7b9b85-47dd-42c1-b98b-dc52367501fa");
            }
        }
    }	
    
	private void InitializeComponent()
	{
        Load += new EventHandler(PageLoad);
	}

    protected override void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
        
        AddChildUserControl(WorkflowControl);
        WorkflowControl.Container = Container;
    }

    public override void CommandButtonRequisites(Asi.Web.UI.CommandButtonRequisiteArgs e)
    {
        base.CommandButtonRequisites(e);
        e.SetNeed(Asi.Web.UI.CommandButtonType.Cancel, false);
    }
</script>

<asi:WorkflowProcessHost ID="WorkflowControl" runat="server" />
