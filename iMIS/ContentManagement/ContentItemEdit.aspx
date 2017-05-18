<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ContentItemEdit" Title="Configure iPart" Codebehind="ContentItemEdit.aspx.cs" %>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <script type="text/javascript">
        PageMethods.set_path('<%= Request.FilePath %>');
    </script>
    <asiweb:StyledHyperlink ID="HelpLink" runat="server" ImageUrl="~/AsiCommon/Images/icon_help.png" NavigateUrl="javascript:;" CssClass="PositionTopRight" ToolTip="Configuration Help" Text="Configuration Help" />
    <asiweb:PanelTemplateControl ID="MainPanel" runat="server" Collapsible="false" BorderStyle="None" ShowHeader="false">
        <asp:PlaceHolder ID="ContentItemEditPlaceHolder" runat="server"></asp:PlaceHolder>
    </asiweb:PanelTemplateControl>
</asp:Content>