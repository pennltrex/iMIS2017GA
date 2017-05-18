<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentManagement.WebsiteEdit" Codebehind="WebsiteEdit.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="WebsiteEdit" Src="~/AsiCommon/Controls/ContentManagement/WebsiteDesigner/WebsiteEdit.ascx" %>

<asp:content id="Content1" runat="server" contentplaceholderid="TemplateBody">
    <asi:WebsiteEdit id="WebsiteEditControl" runat="server" UseParentAtomObject="true"></asi:WebsiteEdit>
</asp:content>
