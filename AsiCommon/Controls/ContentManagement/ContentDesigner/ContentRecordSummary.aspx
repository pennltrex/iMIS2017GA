<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="bsa" TagName="DefaultSummary" Src="~/asicommon/controls/bsa/documentsummarydefault.ascx" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <bsa:DefaultSummary ID="DefaultSummaryControl" runat="server" />
    
    <%--<asiweb:PanelTemplateControl ID="ContentItemSummaryPanel" runat="server">
        <asiweb:PanelTemplateColumn ID="ImageColumn" runat="server">
            <asp:Image ID="ZonesImage" runat="server" />
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="ItemsColumn" runat="server">
            
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>--%>
</asp:Content>