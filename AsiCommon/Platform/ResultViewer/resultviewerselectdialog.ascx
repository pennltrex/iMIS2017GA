<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.ResultViewer.ResultViewerSelectDialog" Codebehind="ResultViewerSelectDialog.ascx.cs" %>
<asi:PanelTemplateControl id="PanelTemplate" runat="server" TemplateTitle="Select an Item" AtomPanelTemplateTypeCode="5">
	<asp:PlaceHolder id="GridPlaceholder" Runat="server"></asp:PlaceHolder>
</asi:PanelTemplateControl>
