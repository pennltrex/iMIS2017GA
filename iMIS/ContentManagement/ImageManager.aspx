<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ImageManager" Title="Image Manager" Codebehind="ImageManager.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <rad:dialogopener runat="server" id="DialogOpener1"></rad:dialogopener> 
    <input type="button" onclick="LaunchImageManager();" value="Launch Image Manager" />
    <script type="text/javascript">
        function LaunchImageManager() {
            $find('<%= DialogOpener1.ClientID %>').open('ImageManager');
        }
    </script>
</asp:Content>