<%@ Control Language="c#" Inherits="Asi.WebRoot.AsiCommon.Controls.Shared.Utility.CommitAll" Codebehind="CommitAll.ascx.cs" %>

<script language="C#" runat="server">
public override void PreCommit(Asi.Web.UI.PreCommitArgs e)
{
	// Add AtomObject[0] for commit, otherwise
	// if this object didn't change, nothing would get Committed
	EnsureAtomObject();
	if(AtomObject!=null && AtomObject.Length>0)
	{
		e.AddBusinessItemForCommit((Asi.Business.BusinessItem)AtomObject[0]);
	}
	base.PreCommit(e);	
	e.CommitContainer = true;
}
</script>
