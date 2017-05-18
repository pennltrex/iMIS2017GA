<%@ Page Language="C#" Inherits="iMIS_ContentManagement_ThemeContentDesigner" Title="Content designer" Codebehind="ThemeContentDesigner.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content6" ContentPlaceHolderID="TemplateBody" Runat="Server">
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
            Text="Website Template Folders" Mode="Standard" ShowContainers="true" PublishedOnly="false"
            SortByName="true" RootHierarchyKey="b3bf668b-5f75-49d5-9320-7985df62a043"
            OnContainerSelected="ContentItemBrowser_ContainerSelected" ShowOrphans="false" ShowRecycleBin="true" SingleContentRecord="true"/>
    </asp:Panel>
    <asp:Label ID="SmallScreenMessage" style="display: none" Text="Manage Website Templates is not supported on the screen size of this browser." runat="server" translate="yes"></asp:Label>
</asp:Content>

