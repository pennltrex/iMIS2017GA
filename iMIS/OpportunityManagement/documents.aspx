<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Documents" %>

<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/OpportunityManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Documents" Src="~/AsiCommon/Controls/OpportunityManagement/Documents.ascx" %>
<%@ Register TagPrefix="uc4" TagName="Navigation" Src="~/AsiCommon/Controls/OpportunityManagement/navigation.ascx" %>
<%@ Register TagPrefix="uc3" TagName="OpportunityTop" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityTop.ascx" %>

<%@ Import Namespace="System.Web.Services"%>
<%@ Import Namespace="Asi.Web.UI.Common.BSA"%>

<script runat="server" language="C#">

    /// <summary>
    /// Wrapper method for the call to get an item's link based on a specified action.
    /// </summary>
    /// <param name="action">The action.</param>
    /// <param name="templateType">Type of the template.</param>
    /// <param name="docType">Type of the doc.</param>
    /// <param name="hierarchyKey">The hierarchy key.</param>
    /// <param name="documentVersionKey">The document version key.</param>
    /// <param name="folderHierarchyKey">The folder hierarchy key.</param>
    /// <param name="itemCount">The item count.</param>
    /// <param name="closeWindowOnCommit">if set to <c>true</c> [close window on commit].</param>
    /// <param name="websiteKey">The website key.</param>
    /// <remarks>Has to be here because PageMethod methods must be declared on a Page and not on a UserControl.</remarks>
    [WebMethod]
    public static string GetActionLink(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return ObjectBrowserHelper.GetActionLink(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }

    /// <summary>
    /// Gets the window properties.
    /// </summary>
    /// <param name="action">The action.</param>
    /// <param name="templateType">Type of the template.</param>
    /// <param name="docType">Type of the doc.</param>
    /// <param name="hierarchyKey">The hierarchy key.</param>
    /// <param name="documentVersionKey">The document version key.</param>
    /// <param name="folderHierarchyKey">The folder hierarchy key.</param>
    /// <param name="itemCount">The item count.</param>
    /// <param name="closeWindowOnCommit">if set to <c>true</c> [close window on commit].</param>
    /// <param name="websiteKey">The website key.</param>
    /// <remarks>Has to be here because PageMethod methods must be declared on a Page and not on a UserControl.</remarks>
    [WebMethod]
    public static WindowProperties GetWindowProperties(Asi.Web.UI.PageOperation action, Asi.Web.UI.TemplateType templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return ObjectBrowserHelper.GetWindowProperties(action, templateType, docType, hierarchyKey, documentVersionKey, folderHierarchyKey, itemCount, closeWindowOnCommit, websiteKey, pageInstanceKey);
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static bool CheckForPasteConflict(string selectedKeys, Guid targetHierarchyKey)
    {
        return ObjectBrowserHelper.CheckForPasteConflict(selectedKeys.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries), targetHierarchyKey);
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

    <div id="doc3" class="yui-t1">

        <div id="leftnav" class="yui-b">
            <uc4:Navigation id="nav" runat="server" />
        </div>
        <div id="yui-main">
            <div id="mainContent" class="yui-b">

		        <div class="TaskHeading">
			        <uc3:OpportunityTop id="OpportunityTop2" runat="server" />
		        </div>

		        <div class="TaskBar">
			        <uc2:TaskButtons id="TaskButtons1" runat="server" />
		        </div>
           
                <uc1:Documents ID="Documents1" runat="server" />
            
            </div>
        </div>

    </div>

</asp:Content>