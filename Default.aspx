<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="iMIS - Welcome to the World of iMIS" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (Request["hkey"] == null)
        {
            //Asi.Business.ContentManagement.Website website = Asi.Business.ContentManagement.WebsiteController.Website(new Guid("E28BB596-80D6-48CA-B241-09745C03FAC2"));
            Asi.Business.ContentManagement.Website website = Asi.Business.ContentManagement.Website.FindWebsiteByURL(Request.Url);
            if (website == null)
            {
                string url = Asi.Web.Utilities.GetTildeExpansion() + "/Admin/Home/Default.aspx";
                Response.Redirect(url, true);
            }
        }
        Page.ClientScript.RegisterClientScriptInclude(GetType(), "PageNav", Asi.Web.Utilities.GetTildeExpansion() + "/Default.js");
        Page.ClientScript.RegisterStartupScript(GetType(), "DefaultStartupScript", "welcomeAddEvent(window,'load',welcomeRunOnPageLoad);", true);
        //// Force the sidenav bar to be hidden, since we don't want the header to show; it screws with the page formatting on this page.
        //if (Master is Asi.Web.UI.MasterPageBase)
        //    ((Asi.Web.UI.MasterPageBase)Master).ShowSubNavPanel = true;
    }


    // since we are not displaying the welcome message we do not need to do this
    //    protected override void OnLoad(EventArgs e)
    //    {
    //        base.OnLoad(e);
    //
    //        if (Asi.Security.AppPrincipal.CurrentPrincipal != null && Asi.Security.AppPrincipal.CurrentIdentity.IsAuthenticated)
    //        {
    //            // Eliminate race condition caused by lazy-loading ContentManager.CMUser
    //            string contactID = ((Asi.Security.AppPrincipal)Asi.Security.AppPrincipal.CurrentPrincipal).AppIdentity.ContactMaster;
    //            Asi.iBO.ContactManagement.CContact contact = new Asi.iBO.ContactManagement.CContact(Asi.ContentManagerNet.ContentManager.CMUser, contactID);
    //            WelcomeMessage.Text = string.Format("Welcome to our Website, {0} {1}!", contact.FirstName, contact.LastName);
    //        }
    //    }

</script>

<asp:Content ID="MainContent" ContentPlaceHolderID="TemplateBody" runat="server">
    <div class="Welcome_Border" style="float: left; overflow: hidden;">
        <!--
        <h2>
            <asp:Label ID="WelcomeMessage" runat="Server">Welcome to our Website!</asp:Label>
        </h2>
-->
        <table border="0">
            <tr>
                <td>
                    <table border="0" width="100%">
                        <tr>
                            <td class="WelcomePageHeader">
                                <span class="iMIS">iMIS</span> Resources
                            </td>
                        </tr>
                        <tr>
                            <td class="WelcomePageText">
                                <br />
                                At Advanced Solutions International (ASI) our mission is to keep our "Customers
                                for Life". From award-winning and certified technical and customer support, to industry-leading
                                online resources, to the largest independent users group in the non-profit software
                                industry, we provide the help you need, when you need it.
                            </td>
                        </tr>
                    </table>
                    <!--
<td valign="top">

                <asp:Image ID="GlobeImage" runat="server" SkinID="Homeglobe" style="float:right;" />
</td>
-->
            </tr>
            <tr>
                <td colspan="2" style="padding: 0.5cm 1.5cm 0.1cm 0.1cm">
                    <table border="0">
                        <tr>
                            <td>
                                <asp:Image ID="TechSupportImage" runat="server" SkinID="WelcomeTechSupport" Style="float: right;" />
                            </td>
                            <td>
                                <span class="WelcomeHeader">Technical Support</span><br />
                                <span class="WelcomePageText"><span class="iMIS">iMIS</span> customers who participate
                                    in the <span class="iMIS">iMIS</span> Software Update Plan can access online technical
                                    resources, request support from our award-winning and certified Technical Support
                                    Team, and receive regular <span class="iMIS">iMIS</span> product updates. </span>
                                <br />
                                <a href="http://www.advsol.com/support" target=_blank class="WelcomeLink">Request Support</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="DocumentationImage" runat="server" SkinID="WelcomeDocumentation" Style="float: right;" />
                            </td>
                            <td>
                                <span class="WelcomeHeader">Documentation</span><br />
                                <span class="WelcomePageText"><span class="iMIS">iMIS</span> documentation is available
                                    via the new <span class="iMIS">iMIS</span> Help Site, which is also accessible directly
                                    from your <span class="iMIS">iMIS</span> system. The <span class="iMIS">iMIS</span>
                                    Help Site includes the latest <span class="iMIS">iMIS</span> documentation in a
                                    searchable format as well as print-ready reference guides. </span>
                                <br />
                                <a href="http://www.advsol.com/helpsite" target=_blank class="WelcomeLink">Access Documentation</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="UsersImage" runat="server" SkinID="WelcomeUsersGroup" Style="float: right;" />
                            </td>
                            <td>
                                <span class="WelcomeHeader">Users Group</span><br />
                                <span class="WelcomePageText">NiUG International is the largest independent, not-for-profit,
                                    volunteer run <span class="iMIS">iMIS</span> user's group. Started as a grass roots,
                                    regional effort in the mid-90s, NiUG International's core purpose remains to advocate,
                                    educate, and connect <span class="iMIS">iMIS</span> users. </span>
                                <br />
                                <a href="http://www.advsol.com/niug" target=_blank class="WelcomeLink">Join NiUG</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="DevelopersSupportImage" runat="server" SkinID="WelcomeDevelopersSupport"
                                    Style="float: right;" />
                            </td>
                            <td>
                                <span class="WelcomeHeader">Developers Support</span><br />
                                <span class="WelcomePageText">The <span class="iMIS">iMIS</span> community website is
                                    an online resource for facilitating collaboration between customers, partners, and
                                    ASI employees. It includes documentation, discussion forums, blogs, and a wiki-style
                                    compendium of documentation. </span>
                                <br />
                                <a href="http://www.advsol.com/imiscommunity" target=_blank class="WelcomeLink">Participate Now</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="iXtendImage" runat="server" SkinID="WelcomeiXtend" Style="float: right;" />
                            </td>
                            <td>
                                <span class="WelcomeHeader">iXtend Application Library</span><br />
                                <span class="WelcomePageText">The iXtend Application Library features applications developed
                                    for <span class="iMIS">iMIS</span> by <span class="iMIS">iMIS</span> partners, developers,
                                    and customers. iXtend Applications can be purchased directly from the developer
                                    and contact information is provided for each Application. </span>
                                <br />
                                <a href="http://www.advsol.com/ixtend" target=_blank class="WelcomeLink">Browse Applications</a>
                            </td>
                        </tr>
                    </table>
            </tr>
        </table>
    </div>
    <asp:Image ID="asiimasImage" runat="server" SkinID="Welcomeasilogo" Style="float: right;" />
</asp:Content>
