<%@ Control Language="c#" ClassName="GroupMemberCheckExistingContact" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script language="C#" runat="server">
    public override string AtomComponentName
    {
	    get{ return "GroupMember"; }
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (Page.IsPostBack)
        {
            EnsureAtomObject();

            if (Asi.Utilities.Validation.IsEmpty(AtomObject))
                return;

            Asi.Business.Common.GroupMember groupMember = AtomObject[0] as Asi.Business.Common.GroupMember;

            Asi.Business.BusinessFilter[] filter = new Asi.Business.BusinessFilter[2];
            filter[0] = new Asi.Business.BusinessFilter("MemberContactKey", Asi.ComparisonType.Equal, groupMember.MemberContactKey);
            filter[1] = new Asi.Business.BusinessFilter("GroupKey", Asi.ComparisonType.Equal, groupMember.GroupKey);
            Asi.Business.Common.GroupMemberController groupMemberController = Asi.Business.Common.GroupMemberController.NewGroupMemberController(StatefulBusinessContainer);
            System.Data.DataRow[] rows = groupMemberController.SelectWithFilter(filter);
            if (rows.Length > 1)
            {
                Guid existingGroupMemberKey = Guid.Empty;
                foreach (Asi.Business.Common.GroupMember existingGroupMember in rows)
                {
                    if (existingGroupMember.GroupMemberKey != groupMember.GroupMemberKey)
                    {
                        existingGroupMemberKey = existingGroupMember.GroupMemberKey;
                        break;
                    }
                }

                if (existingGroupMemberKey != Guid.Empty)
                {
                    string url = Request.RawUrl;
                    if (url.Contains("&iKey="))
                        url = url.Replace("&iKey=" + groupMember.GroupMemberKey.ToString(), "&iKey=" + existingGroupMemberKey.ToString());
                    else
                        url += "&iKey=" + existingGroupMemberKey.ToString();
                    Response.Redirect(url, true);
                }
            }
        }
    }
</script>
