<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Control language="c#" Inherits="Asi.Web.UI.AtomPanelBase" %>
<%@ Import Namespace="Asi.Web.UI" %>

<script language="c#" runat="server">
    public override string AtomComponentName
    {
        get{ return "Group"; }
    }
    protected override void CreateChildControls()
    {
        base.CreateChildControls();

        CurrentContext.SubjectUniformKey = Guid.Empty;
        Asi.Atom.AtomPanel profilePanel = Asi.Atom.AtomPanel.GetFromPanelKey(new Guid("56e21ab7-7ac5-4416-96d2-ad91acee8f4f"), Container);
        AtomPanelBase profile = Page.LoadControl(profilePanel.GetControlFilePath()) as AtomPanelBase;
        ProfilePlaceholder.Controls.Add(profile);

        AddChildUserControl(profile);
    }
    public override void PostCommitRedirect()
    {
        AtomPanelBase profile = ProfilePlaceholder.Controls[0] as AtomPanelBase;
        if (profile == null || Asi.Utilities.Validation.IsEmpty(profile.AtomObject)) return;

        Asi.Business.Common.Group group = (Asi.Business.Common.Group)profile.AtomObject[0];
        Response.Redirect(CurrentContext.TemplatePath + "?HierarchyCode=Group.Members&iUniformKey=" + group.GroupKey.ToString() + "&iSession=" + Request["iSession"], false);
    }
</script>

<asp:PlaceHolder ID="ProfilePlaceholder" runat="server"></asp:PlaceHolder>
