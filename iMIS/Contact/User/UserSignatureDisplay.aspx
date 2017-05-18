<%@ Page language="c#" AutoEventWireup="false" %>
<%@ Import Namespace="Asi.Business.Common" %>

<script language="C#" runat="server">

private void Page_Load(object sender, EventArgs e)
{
	if (Request.QueryString["UserKey"] != null)
	{
        Guid userKey = new Guid(Request.QueryString["UserKey"]);
        UserV10 user = UserController.User(userKey) as UserV10;
        if (user != null && !string.IsNullOrEmpty(user.ProviderKey) && user.CsStaffUser != null && user.CsStaffUser["Signature"] != null && ((Byte[])user.CsStaffUser["Signature"]).Length > 0)
        {
            Response.Clear();
            Response.ContentType = "image/bmp";
            Response.OutputStream.Write(((Byte[])user.CsStaffUser["Signature"]), 0, ((Byte[])user.CsStaffUser["Signature"]).Length);
            Response.Flush();
            Response.End();
        }

        Response.Clear();
        Response.StatusCode = 404;
        Response.End();
	}
}
protected override void OnInit(EventArgs e)
{
	InitializeComponent();
	base.OnInit(e);
}
private void InitializeComponent()
{
	this.Load += new EventHandler(this.Page_Load);
}
</script>