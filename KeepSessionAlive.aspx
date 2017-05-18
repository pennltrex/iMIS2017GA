<%@ Page Language="C#" %>
<%@ OutputCache Location="None" VaryByParam="None" %>

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        // Touch the user and the page's cached business container to make sure they all stay alive.
        log4net.LogManager.GetLogger("KeepSessionAlive").Debug(string.Format("KeepSessionAlive touched for user {0}.", Context.User.Identity.Name));
        System.Diagnostics.Debug.WriteLine(string.Format("KeepSessionAlive touched for user {0} at {1}.", Context.User.Identity.Name, Asi.AppTime.Now));
        if (Request.QueryString["PageInstanceKey"] != null)
        {
            var container = Cache["PageBusinessContainer_" + Request.QueryString["PageInstanceKey"]] as Asi.Business.BusinessContainer;
            if (container != null)
            {
                log4net.LogManager.GetLogger("KeepSessionAlive").Debug("Page instance container found.");
                System.Diagnostics.Debug.WriteLine("Page instance container found.");
            }
        }
    }
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="cache-control" content="no-cache">
</head>
<body runat="server" visible="false">

This is from <a href="http://www.codeproject.com/aspnet/Reconnect.asp">http://www.codeproject.com/aspnet/Reconnect.asp</a>
<!-- Article Starts -->


<H2>Introduction</H2>
<P>I have developed ASP and ASP.NET sites for many years and one of the most common 
end user problems (apart from basic stupidity ;-) is that while the user is entering 
information into a web form or HTML edit box, the session timeout period will elapse 
and they lose all the work they have done.</P>
<P>I have tried solutions such as making JavaScript alert the user to click a button or 
refresh page, but this has restrictions, especially if they are not able to submit the 
form yet due to required field limitations.</P>
<H2>Solution</H2>
<P>I recently came across some code which attempted to fix this problem but that was 
unsuccessful because the author had forgotten the issue of client side caching.</P>
<P>Add to your page the following code:</P>
<PRE lang=cs><span class='cs-keyword'>private</span> <span class='cs-keyword'>void</span> Page_Load(<span class='cs-keyword'>object</span> sender, System.EventArgs e)
{
<span class='cs-keyword'>this</span>.AddKeepAlive();
}</PRE>
<PRE lang=cs><span class='cs-keyword'>private</span> <span class='cs-keyword'>void</span> AddKeepAlive()
{
<span class='cs-keyword'>int</span> int_MilliSecondsTimeOut = (<span class='cs-keyword'>this</span>.Session.Timeout * <span class='cs-literal'>60000</span>) - <span class='cs-literal'>30000</span>;
<span class='cs-keyword'>string</span> str_Script = @<span class='cpp-string'>"
&lt;script type='text/javascript'&gt;
//Number of Reconnects
var count=0;
//Maximum reconnects setting
var max = 5;
function Reconnect(){

count++;
if (count &lt; max)
{
window.status = 'Link to Server Refreshed ' + count.toString()+' time(s)' ;

var img = new Image(1,1);

img.src = 'Reconnect.aspx';

}
}

window.setInterval('Reconnect()',"</span>+ _
    int_MilliSecondsTimeOut.ToString()+ @<span class='cpp-string'>"); //Set to length required

&lt;/script&gt;

"</span>;

<span class='cs-keyword'>this</span>.Page.RegisterClientScriptBlock(<span class='cpp-string'>"Reconnect"</span>, str_Script);

}</PRE>
<P>This code will cause the client to request within 30 seconds of the session timeout 
the page <i>Reconnect.aspx</i>.</P>
<H2>The Important Part</H2>
<P>Now this works the first time but if the page is cached locally then the request is 
not made to the server and the session times out again, so what we have to do is specify 
that the page <i>Reconnect.aspx</i> cannot be cached at the server or client.</P>
<P>This is done by creating the <i>Reconnect.aspx</i> page with this content:</P>
<Pre lang=aspnet>&lt;%@ OutputCache Location="None" VaryByParam="None" %&gt;
&lt;html&gt;
&lt;/html&gt;</pre>
<P>The <code>OutputCache</code> directive prevents this from being cached and so the 
request is made each time. No code behind file will be needed for this page so no 
<code>@Page</code> directive is needed either.</P>
<P>And that's it.</P>
<P>Hope this helps someone.</P>

<!-- Article Ends -->


</body>
</html>

