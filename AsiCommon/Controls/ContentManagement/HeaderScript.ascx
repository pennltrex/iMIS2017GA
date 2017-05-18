<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="Asi.Web.UI" %>

<script runat="server" >
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        string script = String.Format(System.Globalization.CultureInfo.InvariantCulture, "__Document_Head_Init('{0}NoCookies.html', '{1}', {2});", Asi.Web.Utilities.GetDocumentBaseUri(), string.Empty, Asi.SystemConfig.GetString("Browser.DisableContextMenu").ToLowerInvariant());
        ScriptManager.RegisterStartupScript(Page, GetType(), "StartupScript", script, true);          
    }
</script>

<script type="text/javascript">
//<![CDATA[
<% // Do not place any code above this line %>

<% // Global variables %>
var gDocumentTitle = document.title;
var gPostBackFormObject = null;
var gWindowOnLoad = new Array();
var gPostBackFormProcessSubmit = true;
var gWebRoot = '<%= Asi.Web.Utilities.GetTildeExpansion() %>';
var gWebSiteRoot = '<%= (Page is DisplayPageBase && ((DisplayPageBase)Page).iMISWebsite != null) ? ((DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl : string.Empty %>';
var gPageTheme = '<%= Page.Theme %>';
var gAdminWebRoot = gWebRoot + '/Admin';
var gWebsiteKey = '<%= Asi.AppContext.CurrentContext.WebsiteKey %>';
var gHKey = '<%= Asi.AppContext.CurrentContext.HKey != Guid.Empty ? Asi.AppContext.CurrentContext.HKey.ToString() : string.Empty %>';
var gIsPostBack = <%= Page.IsPostBack.ToString().ToLowerInvariant() %>;
var gDefaultConfirmMessage = '<%= Asi.Web.Utilities.PrepareForJavascript(Asi.ResourceManager.GetPhrase("PendingChangeWarning","Continue without saving changes?")) %>';
var gIsEasyEditEnabled = false;
var gMasterPage = '<%= Page.MasterPageFile.ToLower() %>';
<% //this is to prevent css from showing up in Desktop %>
if(gWebsiteKey != 'fbdf17a3-cae7-4943-b1eb-71b9c0dd65d2' && gWebsiteKey != 'fad2fd17-7e27-4c96-babe-3291ecde4822'){
    gIsEasyEditEnabled = <%= (Page is DisplayPageBase) ? ((DisplayPageBase)Page).SurfToEditEnabled.ToString().ToLowerInvariant() : "false"  %>;  
}
//]]>
</script>