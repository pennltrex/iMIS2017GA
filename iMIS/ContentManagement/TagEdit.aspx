<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_TagEdit" Codebehind="TagEdit.aspx.cs" %>
<%@ Register TagPrefix="asiweb" TagName="TagEdit" Src="~/AsiCommon/Controls/ContentManagement/TagEdit.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:TagEdit ID="TagEditControl" runat="server" UseParentAtomObject="true" />
</asp:Content>