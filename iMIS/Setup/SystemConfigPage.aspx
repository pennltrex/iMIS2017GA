<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.SystemConfigPage" Codebehind="SystemConfigPage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
    BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>
    <asiweb:PanelTemplateControl2 ID="SystemConfigPageTemplateControl" runat="server" Collapsible="false" Text="<%# PageObj.Description %>" FieldSet="true">
        <asp:Repeater ID="Variables" runat="server" OnItemCreated="Variables_ItemCreated" OnItemDataBound="Variables_ItemDataBound">
            <ItemTemplate>
                <asiweb:SmartControl ID="PropertyEditControl" runat="server" DisplayCaption="true" PositionCaption="Top" ValidateRequestMode="Disabled"></asiweb:SmartControl>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asiweb:SmartControl ID="PropertyEditControl" runat="server" DisplayCaption="true" PositionCaption="Top" ValidateRequestMode="Disabled"></asiweb:SmartControl>
            </AlternatingItemTemplate>
        </asp:Repeater>
    </asiweb:PanelTemplateControl2>
    <script type="text/javascript">
        //<![CDATA[
        function ShowLoadingPanel() {
            if (Page_IsValid)
                jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
    //]]>
    </script>
</asp:Content> 