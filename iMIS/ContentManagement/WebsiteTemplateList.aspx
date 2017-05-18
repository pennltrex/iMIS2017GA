<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebsiteTemplateList.aspx.cs" Title="Website templates" Inherits="iMIS_ContentManagement_WebsiteTemplateList" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <script id="ResizeEvent" type="text/javascript">
    //<![CDATA[
        addResizeEvent(Window_Resize);
        jQuery(document).ready(CheckScreenSize);
        jQuery(window).resize(CheckScreenSize);

        function CheckScreenSize() {
            var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            var smallScreenMessage = document.getElementById('<%=SmallScreenMessage.ClientID%>');
            var browserPanel = document.getElementById('<%=BrowserPanel.ClientID%>');
            if (width < 991) {
                browserPanel.style.display = 'none';
                smallScreenMessage.style.display = 'block';
            } else {
                browserPanel.style.display = 'block';
                smallScreenMessage.style.display = 'none';
            }
        }
    //]]>
    </script>

    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%">      
        <asi:ObjectBrowser ID="ContentItemBrowser" runat="server" TypeFilter="WST,CFL" 
            Text="" Mode="Standard" ShowContainers="true" PublishedOnly="false" ShowAddress="false"
            SortByName="true" DocumentPath="@/Website_Templates" RootFolder="@/Website_Templates"
            OnContainerSelected="ContentItemBrowserContainerSelected" ShowOrphans="false" ShowRecycleBin="true" SingleContentRecord="true"
            DisallowDeletionOfRootFolder="false" AutoSelectFirstDocument="false" />                      
    </asp:Panel>
    
    <asp:Label ID="SmallScreenMessage" Text="Website templates is not supported on the screen size of this browser." style="display: none" runat="server" translate="yes"></asp:Label>
</asp:Content>
