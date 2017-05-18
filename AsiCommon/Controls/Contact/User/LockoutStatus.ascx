<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.AtomPanelBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" ClassName="LockoutStatus" %>

<script runat="server">
    private Asi.Business.Contact.Contact currentContact;
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
    public Asi.Business.Contact.Contact CurrentContact
    {
        get
        {
            if (currentContact == null)
            {
                EnsureAtomObject();
                currentContact = Asi.Business.Contact.ContactController.Contact(CurrentContext.SubjectUniformKey, Container);
            }
            return currentContact;
        }
    }
    public override void DataBind()
    {
        LockoutStatusLabel.Text = string.Empty;
        ClearLockoutStatus.Visible = false;
        EnsureAtomObject();
        Asi.Business.Common.User currentUser = (AtomObject != null && AtomObject.Length > 0 ? AtomObject[0] as Asi.Business.Common.User : null);
        if (currentUser != null && !string.IsNullOrEmpty(currentUser.ProviderKey))
        {
            System.Web.Security.MembershipUser example = System.Web.Security.Membership.GetUser();
            object providerKey = currentUser.ConvertProviderKeyToExampleType(example.ProviderUserKey);
            MembershipUser member = System.Web.Security.Membership.GetUser(providerKey, false);

            if (member != null)
            {
                if (member.IsLockedOut)
                {
                    LockoutStatusLabel.Text = Asi.ResourceManager.GetPhrase("AccountLockedOut", "Account locked out as of {0}.", new string[] { member.LastLockoutDate.ToString() });
                    ClearLockoutStatus.Visible = true;
                }
                else
                {
                    LockoutStatusLabel.Text = Asi.ResourceManager.GetPhrase("AccountIsNotLockedOut", "This account is not locked out.");
                }
            }
        }

        base.DataBind();
    }

    private void ClearLockoutStatus_Click(object sender, EventArgs e)
    {
        EnsureAtomObject();
        Asi.Business.Common.User currentUser = (AtomObject != null && AtomObject.Length > 0 ? AtomObject[0] as Asi.Business.Common.User : null);
        if (currentUser != null)
        {
            System.Web.Security.MembershipUser example = System.Web.Security.Membership.GetUser();
            object providerKey = currentUser.ConvertProviderKeyToExampleType(example.ProviderUserKey);
            MembershipUser member = System.Web.Security.Membership.GetUser(providerKey, false);
            if (member != null)
            {
                member.UnlockUser();
                var logDescription = string.Format(System.Globalization.CultureInfo.CurrentCulture, "\n- User {0} unlocked.", currentUser.UserId);
                Asi.Utilities.PciLogger.LogPciEvent(CurrentContact.FullName, CurrentContact.ID, logDescription, Asi.Utilities.PciLogger.PciRequirementType.UserAccountChanges);
                DataBind();
            }
        }
    }

</script>
<asp:Label runat="server" ID="LockoutStatusLabel"></asp:Label> <asiweb:StyledImageButton runat="server" ID="ClearLockoutStatus" IconStyle="Edit" AlternateText="Unlock User Account" OnClick="ClearLockoutStatus_Click" />
