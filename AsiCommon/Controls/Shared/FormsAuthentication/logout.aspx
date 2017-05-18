<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        FormsAuthentication.SignOut();
        Session.Abandon();
        if (Asi.ContentManagerNet.ContentManager.Enabled)
        {
            Asi.ContentManagerNet.Utilities.LogoutFromColdFusion(null);
        }
        string returnUrl = Request.QueryString["returnurl"];
        if (!string.IsNullOrEmpty(returnUrl))
        {
            Response.Redirect(returnUrl, true);
        }
        else if (Request.QueryString["Redirect"] != null && Request.QueryString["Redirect"] == "0")
        {
            //Response.Redirect("about:blank", true);
        }
        else
        {
            Response.Redirect(FormsAuthentication.LoginUrl, true);
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Logout Page</title>
</head>
<script type="text/javascript">
    window.onerror = function (message, url, lineNumber) {
        // code to execute on an error  
        return true; // prevents browser error messages  
    };
</script> 
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
