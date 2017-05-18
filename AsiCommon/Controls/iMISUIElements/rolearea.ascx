<%@ Register TagPrefix="lo1" TagName="Logout" Src="~/AsiCommon/Controls/Shared/FormsAuthentication/Logout.ascx" %>
<%@ Register TagPrefix="asi" TagName="DepartmentPerspectiveControl" Src="~/AsiCommon/Controls/iMISUIElements/DepartmentPerspectiveControl.ascx" %>
<%@ Register TagPrefix="asi" TagName="BusinessObjectList" Src="~/AsiCommon/Controls/Shared/Utility/BusinessObjectList.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" ClassName="RoleArea" Inherits="Asi.Web.UI.UserControlBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<%@import namespace="Asi" %>
<%@import namespace="Asi.Business" %>
<%@import namespace="Asi.Web" %>
<%@import namespace="Asi.Web.UI.WebControls" %>
<%@import namespace="System.Data" %>
<%@import namespace="System.Drawing" %>
<%@import namespace="System.Web" %>
<%@import namespace="System.Web.UI.WebControls" %>
<%@import namespace="System.Web.UI.HtmlControls" %>
<script language="C#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		if(!IsPostBack)
		{
			phMyOpportunities.Controls.Add(Page.LoadControl("~/AsiCommon/Controls/iMISUIElements/MyOpportunities.ascx"));

			string name = Asi.AppContext.CurrentIdentity.Name;
            string loginName = Asi.AppContext.CurrentIdentity.LoginName;
			lblPrincipalNameValue.Text = name != null && name.Length > 0 ? name : loginName;

			HttpCookie principalMemType;
			principalMemType = Request.Cookies["PrincipalMemType"];
			if (principalMemType != null && principalMemType.ToString() != "")
			{
				lblPrincipalMemTypeValue.Text = principalMemType.Value;
			}
			else
			{
				lblPrincipalMemTypeValue.Text = "Company Member";
			}
			
			DataBind();
		}
	}
	override protected void OnInit(EventArgs e)
	{
		InitializeComponent();
		base.OnInit(e);
	}
	private void InitializeComponent()
	{
		this.Load += new System.EventHandler(this.Page_Load);
        AssignedTasks.PreDataBinding += new EventHandler(AssignedTasks_PreDataBinding);
        AssignedTasks.ItemDeleted += new EventHandler(AssignedTasks_ItemDeleted);
	}

    void AssignedTasks_ItemDeleted(object sender, EventArgs e)
    {
        DataBind();
    }
    private void AssignedTasks_PreDataBinding(object sender, EventArgs e)
    {
        string loginName = Asi.AppContext.CurrentIdentity.LoginName;
        Asi.Business.Common.User user = Asi.Business.Common.UserController.User(loginName);
        BusinessContainer container = new BusinessContainer();
        AssignedTasks.AtomObject = Asi.Business.Common.TaskController.GetUserTasks(user.UserKey, false, container);
    }

</script>


<table cellspacing="3" cellpadding="0" width="100%" border="0">
	<tbody>
		<tr><td class="StandardPanel"> 


<table cellspacing="0" cellpadding="10" width="100%" align="center" height="500" border="0" >
	<tr>
		<td valign="top">
		    <span class="iMISRoleItem">Assigned Tasks</span>
	        <br />
		    <asp:placeholder id="phAssignedTasks" runat="server"></asp:placeholder>
		    <asi:BusinessObjectList ID="AssignedTasks" runat="server" DeleteIconStyle="Delete"
		        AtomComponentName="Task" ShowDelete="True" LinkBehavior="NewWindowAllShare" 
		        PanelTemplateVisible="False" UseUniformKey="False" TargetContentCode="BSA.General.ExecuteTask"
		        OrderedPropertyNameList="Subject,TaskStatusCode,StartDate,DueDate"></asi:BusinessObjectList>
			<br /><br />
		    <span class="iMISRoleItem">My Opportunities</span>
		    <br />
			<asp:placeholder id="phMyOpportunities" runat="server"></asp:placeholder>
		</td>
		<td>&nbsp;</td>
		<td valign="top">

			<span class="iMISRoleItem">Principal</span> <span class="iMISRoleItems">
				<li style="LIST-STYLE-IMAGE: url(./AsiCommon/Images/icon_principal.gif);VERTICAL-ALIGN: super">
					&nbsp;&nbsp;<asp:label id="lblPrincipalNameValue" runat="server"></asp:label><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="lblPrincipalMemTypeValue" runat="server"></asp:label><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<lo1:logout id="Logout2" runat="server"></lo1:logout></span>
			<p>
			    <span class="iMISRoleItem">Department & Perspective</span><br />
			    <span class="iMISRoleItems">
			        <asi:DepartmentPerspectiveControl ID="dpControl" runat="server" />				    
			    </span>
			</p>
			<p>
			</p>
			<span class="iMISRoleItem">Personalize</span> <span class="iMISRoleItems">
				<li style="LIST-STYLE-IMAGE: url(./AsiCommon/Images/icon_personalize.gif);VERTICAL-ALIGN: super">
				&nbsp;&nbsp;Page Setup </span>
			<p><span class="iMISRoleItem">Need Help?<br />
					<input type="text" class="InputStandard" /></span> <img src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/icon_go.gif" align="absMiddle">
			</p>
			<li style="LIST-STYLE-IMAGE: url(./AsiCommon/Images/icon_help_small.gif);VERTICAL-ALIGN: super">
			&nbsp;Search
			<li style="LIST-STYLE-IMAGE: url(./AsiCommon/Images/icon_help_small.gif);VERTICAL-ALIGN: super">
				&nbsp;<a href="<%= Asi.Web.Utilities.GetTildeExpansion() %>/iMIS/Visuals/Sitemaps/InfoCenter.aspx">Info Center</a></li>
		</td>
	</tr>

</table>

					</td></tr>
				</tbody>
			</table>
