<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_PageLayout" Title="Untitled Page" Codebehind="PageLayout.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateLoadingPanel" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
<asp:webpartmanager id="WebPartManager1" runat="server" />
    <div>
       <asp:Label ID="Output" runat="server" Text="Test"></asp:Label>
      <asp:webpartzone id="SideBarZone" runat="server" 
        headertext="Sidebar">
        <zonetemplate>
          <asp:BulletedList 
            DisplayMode="HyperLink" 
            ID="BulletedList1" 
            runat="server"
            Title="My Links">
            <asp:ListItem Value="http://www.microsoft.com">
            Microsoft
            </asp:ListItem>
            <asp:ListItem Value="http://www.msn.com">
            MSN
            </asp:ListItem>
            <asp:ListItem Value="http://www.contoso.com">
            Contoso Corp.
            </asp:ListItem>
          </asp:BulletedList>
        </zonetemplate>
      </asp:webpartzone>
      <asp:webpartzone id="MiddleZone" runat="server" 
        headertext="Middle">
        <zonetemplate>
          <asp:BulletedList 
            DisplayMode="HyperLink" 
            ID="BulletedList2" 
            runat="server"
            Title="My Links">
            <asp:ListItem Value="http://www.microsoft.com">
            Microsoft
            </asp:ListItem>
            <asp:ListItem Value="http://www.msn.com">
            MSN
            </asp:ListItem>
            <asp:ListItem Value="http://www.contoso.com">
            Contoso Corp.
            </asp:ListItem>
          </asp:BulletedList>
        </zonetemplate>
      </asp:webpartzone>
      <asp:editorzone id="EditorZone1" runat="server">
        <zonetemplate>
          <asp:appearanceeditorpart 
            runat="server" 
            id="AppearanceEditorPart1" />
          <asp:layouteditorpart 
            runat="server" 
            id="LayoutEditorPart1" />
        </zonetemplate>
      </asp:editorzone>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="TemplateButtonBar" Runat="Server">
</asp:Content>

