<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostDefault.aspx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostDefault" %>

<%@ Register src="PostHome.ascx" tagname="PostHome" tagprefix="uc1" %>

<asp:Content id="PostContent" runat="server" ContentPlaceHolderID="TemplateBody">

    <uc1:PostHome ID="PostHomeControl" runat="server" />
</asp:Content>
