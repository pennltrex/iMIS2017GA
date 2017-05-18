<%@ Page Language="C#" Inherits="iMIS_ContentManagement_ContentLayoutList" Title="Manage layouts" Codebehind="ContentLayoutList.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">
        <asi:ObjectBrowser ID="ContentLayoutBrowser" runat="server" TypeFilter="LAY" 
            Text="Layout Designs" Mode="Standard" PublishedOnly="false" 
            ShowHierarchyTree="false" ShowAddress="false"
            DocumentPath="$/ContentManagement/DefaultSystem/ContentLayouts" RootFolder="$/ContentManagement/DefaultSystem/ContentLayouts" />
    </asp:Panel>
</asp:Content>

