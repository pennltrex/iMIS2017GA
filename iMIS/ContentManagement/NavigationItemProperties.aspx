<%@ Page Language="C#" AutoEventWireup="true" Inherits="iMIS_ContentManagement_NavigationItemProperties" MasterPageFile="~/Templates/MasterPages/Empty.master" Codebehind="NavigationItemProperties.aspx.cs" %>
<%@ Register TagName="NavigationItem" TagPrefix="asi" src="~/AsiCommon/Controls/ContentManagement/NavigationItem.ascx"%>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="TemplateBody">
    <asi:NavigationItem ID="NavigationItemControl" runat="server" UseParentAtomObject="true" />
</asp:Content>
