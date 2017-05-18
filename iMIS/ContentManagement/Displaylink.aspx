<%@ Page language="c#" Inherits="Asi.Web.UI.ContentManagement.DisplayLink" MasterPageFile="~/Templates/Masterpages/Empty.master" Codebehind="DisplayLink.aspx.cs" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
<asi:PanelTemplateControl ID="Template" runat="server" TemplateTitle="Links">
<asp:PlaceHolder id="PanelPlaceHolder" runat="server"></asp:PlaceHolder>
</asi:PanelTemplateControl>
</asp:content>