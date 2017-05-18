<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentHistoryDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.RecentHistory.RecentHistoryDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <div>
        <asiweb:BusinessDropDownList runat="server" ID="SelectedTypeDropDownList" Visible="False" OnSelectedIndexChanged="SelectedTypeChanged" AutoPostBack="True"/>
    </div>
    <ul id="RecentItemList" runat="server" class="RecentHistoryList">
        <asp:Repeater ID="LinkRepeater" runat="server" OnItemDataBound="LinkRepeaterItemDataBound">
            <ItemTemplate>
                <li class="RecentHistoryItem">
                    <asiweb:StyledHyperlink ID="Link" runat="server" Visible="true"> </asiweb:StyledHyperlink>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asiweb:StyledButton runat="server" ID="ClearLink" OnClick="ClearLinkClicked" Text="Clear History"/>
</telerik:RadAjaxPanel>

