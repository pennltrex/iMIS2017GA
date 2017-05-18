<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Import Namespace="Asi.Business" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asi" TagName="FinderAdder" Src="~/AsiCommon/Controls/Shared/FinderAdder/FinderAdder.ascx" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AddChildUserControl(AccessKeywordFinderAdder);
    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        if (!Page.IsPostBack)
            DataBind();
    }
    protected void AccessKeywordFinderAdder_NeedDataSource(object sender, EventArgs e)
    {
        // Add a filter for each access keyword that the user already has; it wouldn't make sense
        // for them to be able to select it again.
        string userAccessKeywords = Request.QueryString["CurrentUserAccessKeywords"];
        string[] userAccessKeywordsArray = userAccessKeywords.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        BusinessFilter[] filters = new BusinessFilter[userAccessKeywordsArray.Length];
        for (int i = 0; i < userAccessKeywordsArray.Length; i++)
        {
            filters[i] = new BusinessFilter("Code", ComparisonType.NotEqual, userAccessKeywordsArray[i]);
        }

        AccessKeywordFinderAdder.DocumentPath = "$/Common/Queries/Value Lists/CsAccessKeysList";
        AccessKeywordFinderAdder.Lister.DisplayPropertiesList = new[] { "Code", "Description" };
        AccessKeywordFinderAdder.Lister.Filters = filters;
        Array.Sort(AccessKeywordFinderAdder.Lister.DisplayPropertiesList);
        AccessKeywordFinderAdder.DataKeyNames = new[] { "Code" };
    }
</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asi:FinderAdder id="AccessKeywordFinderAdder" runat="server" DialogMode="true" AllowMultiSelect="true" 
    OnNeedDataSource="AccessKeywordFinderAdder_NeedDataSource"
     />
</asp:Content>
