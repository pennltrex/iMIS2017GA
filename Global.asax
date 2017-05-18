<%@ Application Inherits="Asi.WebRoot.Global" Language="C#" %>

<script Language="C#" RunAt="server">
protected void Application_Error(object sender, EventArgs e)  
{ 
    // Store the last unhandled exception so that it can be accessed by the 
    // custom error page. 
    var ex = Server.GetLastError(); 
    if (ex != null)
        Session["LastException"] = ex; 
} 
</script>
