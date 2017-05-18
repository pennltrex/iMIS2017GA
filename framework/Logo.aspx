<%@ Page Language="C#" MasterPageFile="~/framework/framework.master" Title="Framework Logo" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <asp:Image ID="Image1" runat="server" SkinID="LogoNavLeft" ToolTip="iMIS Home" />
    <asiweb:KeepAliveExtender ID="KeepAliveControl" TargetControlID="Image1" runat="server" />
</asp:Content>