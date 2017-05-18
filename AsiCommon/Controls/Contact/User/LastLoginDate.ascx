<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" ClassName="LastLoginDate" %>

<script runat="server">
    public override string AtomComponentName
    {
        get
        {
            return "User";
        }
    }
    
    public override void EnsureAtomObject()
    {
        Filter = new Asi.Business.BusinessFilter[] { new Asi.Business.BusinessFilter("UserKey", Asi.ComparisonType.Equal, CurrentContext.SubjectUniformKey) };
        base.EnsureAtomObject();
    }

    public override void DataBind()
    {
        Asi.Business.Common.User currentUser = (AtomObject != null && AtomObject.Length > 0 ? AtomObject[0] as Asi.Business.Common.User : null);
        if (currentUser != null)
        {
            System.Web.Security.MembershipUser example = System.Web.Security.Membership.GetUser();
            object providerKey = currentUser.ConvertProviderKeyToExampleType(example.ProviderUserKey);
            MembershipUser member = System.Web.Security.Membership.GetUser(providerKey, false);
            
            if (member != null)
            {
                LastLoginLabel.Text = member.LastLoginDate.ToString();
            }
        }
           
        base.DataBind();
    }
</script>
<asp:Label ID="LastLoginLabel" runat="server" />