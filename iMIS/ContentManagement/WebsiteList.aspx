<%@ Page Language="C#" Inherits="Asi.Web.UI.ContentManagement.WebsiteList" Title="Manage websites" Codebehind="WebsiteList.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="Server">
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
        <asi:ObjectBrowser ID="NavigationItemBrowser" runat="server" ShowAddress="false"
            Text="" Mode="EditContainer" TypeFilter="FOL,WEB" RootFolder="$/ContentManagement/DefaultSystem/Websites"
            AllowUpwardNavigation="false" PublishedOnly="false" ShowRecycleBin="true" ShowNonContainersInHierarchyTree="true" />
    </asp:Panel>
    <asp:Label ID="SmallScreenMessage" Text="Manage websites is not supported on the screen size of this browser." style="display: none" runat="server" translate="yes"></asp:Label>
</asp:Content>
