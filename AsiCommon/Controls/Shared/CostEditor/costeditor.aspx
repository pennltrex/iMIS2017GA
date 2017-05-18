<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Edit Cost" %>
<%@ Register TagPrefix="uc1" TagName="CostEditor" Src="CostEditor.ascx" %>
<asp:Content ContentPlaceHolderID="TemplateBody" id="ContentPlaceHolder" runat="server">
	<uc1:costeditor id="CostEditor1" runat="server"></uc1:costeditor>
</asp:Content>
