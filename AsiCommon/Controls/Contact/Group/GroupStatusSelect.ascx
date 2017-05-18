<%@ Control Language="c#" ClassName="GroupStatusSelect" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "Group"; }
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (Page.IsPostBack)
        {
            EnsureAtomObject();
            if (!Asi.Utilities.Validation.IsEmpty(AtomObject))
            {
                Asi.Business.Common.Group group = (Asi.Business.Common.Group)AtomObject[0];
                GroupStatusCode_Input.DefaultValue = group.GroupType.DefaultGroupStatusCode;
                GroupStatusCode_Input.DataBind();
            }
        }
    }
</script>
<asi:SmartControl id="GroupStatusCode_Input" runat="server" BoundPropertyName="StatusCode" DisplayType="EditableField" />
