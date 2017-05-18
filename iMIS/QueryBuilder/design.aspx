<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="IQA - Intelligent Query Architect" %>
<%@ Register TagPrefix="queryBuilder" TagName="DesignShell" Src="~/AsiCommon/Controls/QueryBuilder/DesignShell.ascx" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<queryBuilder:DesignShell id="DesignShell1" runat="server"></queryBuilder:DesignShell>
</asp:Content>