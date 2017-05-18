<%@ Page Language="C#" Inherits="iMIS_ContentManagement_WebsiteLayoutList" Title="Website layouts" Codebehind="WebsiteLayoutList.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/objectbrowser2.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">  
        <asi:ObjectBrowser ID="ContentLayoutBrowser" runat="server" TypeFilter="WSL" 
            Text="" Mode="Standard" ShowContainers="true" PublishedOnly="false" ShowAddress="false"
            SortByName="true" DocumentPath="$/ContentManagement/DefaultSystem/WebsiteLayouts" RootFolder="$/ContentManagement/DefaultSystem/WebsiteLayouts"
            ShowHierarchyTree="false" ShowOrphans="false" ShowRecycleBin="false" SingleContentRecord="true"
            DisallowDeletionOfRootFolder="false" AutoSelectFirstDocument="false" />   
    </asp:Panel>
</asp:Content>
