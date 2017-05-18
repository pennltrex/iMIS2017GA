<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        InitializeStrings();
    }

    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        string masterPage;
        switch (Request.QueryString["iErrorType"])
        {
            case "Asi.Security.AccessDenied":
                masterPage = string.Empty;
                break;
            default:
                masterPage = "~/Templates/MasterPages/Empty.master";
                break;
        }
        if (!String.IsNullOrEmpty(masterPage))
            MasterPageFile = masterPage;
    }    

    private void InitializeStrings()
    {
        string imageUrl = "~/AsiCommon/Images/error.gif";
       
        switch (Request.QueryString["iErrorType"])
        {
            case "Asi.InvalidRedirect":
                var badTarget = Request.QueryString["iBadTarget"];
                lblNormalErrorMessage.Text = Asi.ResourceManager.GetPhrase(
                "AsiError.InvalidRedirectMessage",
                "Invalid redirect attempted to another site: {0}.", badTarget
                );
                lblNormalError.Text = Asi.ResourceManager.GetWord("Error");
                break;
            case "Asi.Web.Browser.CookiesDisabled":
                lblNormalErrorMessage.Text = Asi.ResourceManager.GetPhrase(
                "AsiError.CookieErrorMessage",
                "Cookies must be enabled in your browser setup options in order to access this application."
                );
                lblNormalError.Text = Asi.ResourceManager.GetPhrase("CookiesDisabled","Cookies Disabled");
                break;
            case "Asi.Security.AccessDenied":
                lblNormalErrorMessage.Text = Asi.ResourceManager.GetPhrase("AsiError.AccessDeniedMessage", "You do not have permission to view this content.");
                imageUrl = "~/AsiCommon/Images/accessdenied.gif";
                lblNormalError.Text = Asi.ResourceManager.GetPhrase("AccessDenied", "Access Denied");
                break;
            default:
                if ((bool)Application["iMISVersionCheck"] == false)
                {
                    lblNormalErrorMessage.Text = Asi.ResourceManager.GetPhrase("AsiError.VersionMismatch",
                        "The version of your application does not match your database. Please contact the system administrator.");
                    lblNormalError.Text = Asi.ResourceManager.GetPhrase("VersionMismatch", "Version Mismatch");
                }
                else if (Asi.Security.SecurityContext.DaysUntilExpiration <= 0)
                {
                    lblNormalErrorMessage.Text = Asi.Security.SecurityContext.ProductExpiredMessage;
                }
                else if (Session.IsNewSession)
                {
                    if (Context.User.Identity.IsAuthenticated)
                    {
                        lblNormalErrorMessage.Text = Asi.ResourceManager.GetPhrase(
                        "AsiError.SessionTimeoutMessage",
                        "Your session has timed out. Please try your operation again.");
                        lblNormalError.Text = Asi.ResourceManager.GetPhrase("SessionTimeout", "Session Timeout");
                    }
                    else
                    {
                        Asi.Web.Security.RedirectToLoginPage(Asi.ResourceManager.GetPhrase("AsiError.SessionTimeoutMessage", "Your session has timed out. Please try your operation again."));
                    }   
                }
                else
                {
                    var errorMessageText = string.Empty;
                    Exception exception = null;
                    if (Session["LastException"] != null)
                    {
                        exception = Session["LastException"] as Exception;
                    }
                    if (exception is HttpUnhandledException)
                    {
                        exception = exception.InnerException;
                    }
                    if (exception != null)
                    {
                        if (exception is System.ServiceModel.EndpointNotFoundException)
                        {
                            errorMessageText = Asi.ResourceManager.GetPhrase(
                                "System.ServiceModel.EndpointNotFoundException",
                                "Communication error: Could not connect to the iMIS Web Service.");
                            lblNormalError.Text = Asi.ResourceManager.GetPhrase("EndpointNotFound","Endpoint Not Found");
                        }
                        else if (exception is System.ServiceModel.FaultException &&
                            exception.Message.Contains("Security principal does not satisfy required claims"))
                        {
                            errorMessageText = Asi.ResourceManager.GetPhrase(
                                "System.ServiceModel.EndpointNotFoundException.AccessDenied",
                                "Access error: Invalid credentials supplied to the iMIS Web Service.");
                            lblNormalError.Text = Asi.ResourceManager.GetPhrase("EndpointNotFound", "Endpoint Not Found");
                        }
                        else if (exception is System.BadImageFormatException && (exception.ToString().Contains("CrystalDecisions.")))
                        {
                            lblNormalError.Text = Asi.ResourceManager.GetPhrase(
                                    "System.BadImageFormatException.CrystalMissing.Header", 
                                    "Server Error in Application");
                            errorMessageText = Asi.ResourceManager.GetPhrase(
                                    "System.BadImageFormatException.CrystalMissing.Detail",
                                    "The iMIS app pool is set to run in 64-bit mode. Crystal Reports will not run in 64-bit mode.<br/> See “Running Crystal Reports in 32-bit mode” in the Installation Guide for more information about how to enable 32-bit mode and Crystal Reports.");
                        }

                        // Not sure that we want to display this detail to the end user. Commenting out for now.
                        //else
                        //    errorMessageText = exception.Message;
                    }

                    if (string.IsNullOrEmpty(errorMessageText))
                    {
                        errorMessageText = Asi.ResourceManager.GetPhrase(
                            "AsiError.NormalErrorMessage",
                            "An unexpected iMIS error has occurred. Please try your operation again; if you still receive an error, contact the system administrator."
                            );
                        lblNormalError.Text = Asi.ResourceManager.GetWord("Error");
                    }

                    lblNormalErrorMessage.Text = errorMessageText;
                }
                break;
        }
        iMISIcon.ImageUrl = imageUrl;
    }    
</script>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody" >
    <asp:panel id="pnlErrorNormal" runat="server" cssclass="ErrorNormal" visible="True">       
        <asp:image id="iMISIcon" runat="server" AlternateText="Error message image" /> 
        <asp:label id="lblNormalError" runat="server" CssClass="ErrorType" />     
        <asp:label id="lblNormalErrorMessage" runat="server" CssClass="ErrorTypeMessage" />
    </asp:panel>
</asp:Content>