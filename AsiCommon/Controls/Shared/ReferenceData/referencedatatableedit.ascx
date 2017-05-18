<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ReferenceData.ReferenceDataTableEdit" Codebehind="ReferenceDataTableEdit.ascx.cs" %>
<asi:PanelTemplateControl2 id="Template" runat="server">
	<asp:PlaceHolder id="EditGridPlaceholder" Runat="server"></asp:PlaceHolder>
</asi:PanelTemplateControl2>
<asp:PlaceHolder id="PlaceHolder_editlink" runat="server"></asp:PlaceHolder>
