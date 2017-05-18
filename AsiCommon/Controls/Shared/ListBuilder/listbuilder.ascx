<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Utility.ListBuilder" Codebehind="ListBuilder.ascx.cs" %>

<asp:placeholder id="phErrorMessage" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 ID="SelectedPanel" runat="server">
    <asp:placeholder id="phAccessItems" runat="server"></asp:placeholder>
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="AvailablePanel" runat="server">
    <asiweb:Lister2 id="lstrAvailable" runat="server" PageSize="20" LinkTargetBehavior="RaiseEvent" 
        OnNeedDataSource="lstrAvailable_NeedDataSource" AjaxEnabled="false"></asiweb:Lister2>
</asiweb:PanelTemplateControl2>
