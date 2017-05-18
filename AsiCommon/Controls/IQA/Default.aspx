<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Intelligent Query Architect" %>

<%@ Register TagPrefix="bsa" TagName="ObjectBrowserControl" Src="~/AsiCommon/Controls/BSA/Objectbrowser2.ascx" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        AddChildUserControl(ObjectBrowser1);
    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
            DataBind();
    }

</script>
<asp:content id="MainContent" runat="server" contentplaceholderid="TemplateBody">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">
	    <bsa:ObjectBrowserControl id="ObjectBrowser1" Runat="server" Mode="Standard"
	        DocumentPath="$" RootHierarchyKey="D2C71101-E31C-4DCF-830F-8647236F99F2"
	        Text="IQA Folders" TypeFilter="FOL,IQD" CssClass="hidden-xs" ShowRecycleBin="True" />
    </asp:Panel>
    <asp:Label ID="SmallScreenMessage" Text="Intelligent Query Architect is not supported on the screen size of this browser." CssClass="visible-xs" runat="server" translate="yes"></asp:Label>
</asp:content>
