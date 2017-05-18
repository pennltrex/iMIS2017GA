<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.BusinessObjectEditor" Codebehind="BusinessObjectEditor.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asi:PanelTemplateControl2 id="Template" runat="server">
	<asi:BusinessDataGrid id="Grid" runat="server" AutoGenerateColumns="False" DataSource="<%#GetDataSource()%>">
	</asi:BusinessDataGrid>
</asi:PanelTemplateControl2>
