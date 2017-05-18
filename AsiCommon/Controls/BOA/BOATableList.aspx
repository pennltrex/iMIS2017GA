<%@ Page Language="C#" Title="Table List" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.UI" %>

<script language="C#" runat="server">

    private bool isStaffUser;
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
            DataBind();

        isStaffUser = ((Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin")) ||
                            (Asi.AppContext.CurrentPrincipal.IsInRole("IsStaff")) ||
                            (Asi.AppContext.CurrentPrincipal.IsInRole("full staff")));

        if (!Asi.Security.Utility.SecurityHelper.IsAuthenticatedUser || !isStaffUser)
        {
            ((DisplayPageBase)Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                                                                          ResourceManager.GetPhrase(
                                                                              "AccessDenied", "Access Denied")));
            TableListPanel.Visible = false;
        }                       
    }
    public override void CommandButtonRequisites(CommandButtonRequisiteArgs e)
    {
        base.CommandButtonRequisites(e);
        e.SetNeed(CommandButtonType.Ok, isStaffUser);
        e.SetAutoPostBack(CommandButtonType.Ok, false);
        e.SetClientClick(CommandButtonType.Ok, "OKClicked()");
    }

</script>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script type="text/javascript">
    addLoadEvent(FocusTableList);
    function FocusTableList()
    {
        setTimeout("$('<%= TableList.ClientID %>').focus()", 500);
    }
    
    // when ok is clicked, return the selected tables
    function OKClicked()
    {
	    var retval = "";
	    
	    var oWindow = <%=MasterPageBase.WindowClientScript %>;
	    var list = document.getElementById('<%= TableList.ClientID %>');
	    var count = list.options.length;
	    for (i=0;i<count;i++)
	    {
		    if (list.options[i].selected)
		    {
			    if (retval != "")
				    retval = retval + ",";
			    retval = retval + list.options[i].value;
		    }
	    }
	    oWindow.result = retval;
  	    oWindow.Close();
    }
    </script>
    <asiweb:PanelTemplateControl2 ID="TableListPanel" runat="server" TemplateTitle="Select a table or view" FieldSet="true" Collapsible="false">
        <asp:ListBox id="TableList" runat="server" DataSource="<%# Asi.Business.ObjectDesign.SchemaUtility.SqlTableNames() %>"
            Rows="15" SelectionMode="Multiple" ondblclick="OKClicked()" Width="100%" />       
    </asiweb:PanelTemplateControl2>
</asp:Content>
