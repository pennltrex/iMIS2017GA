<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Content Types" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ContentTypeList" Codebehind="ContentTypeList.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>
<asp:Content ID="ContentBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asi:ObjectBrowser ID="NavigationItemBrowser" runat="server" ShowAddress="false" Visible="true"
        Text="" Mode="EditContainer" TypeFilter="FOL,RCT,SRT" RootFolder="$/ContentManagement/DefaultSystem/ContentTypes"
        AllowUpwardNavigation="false" PublishedOnly="false" ShowNonContainersInHierarchyTree="true" AutoSelectFirstDocument="true" ShowContainerEdit="false"
        ShowRecycleBin="True"/>
</asp:Content>