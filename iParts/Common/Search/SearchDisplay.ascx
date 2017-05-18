<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="SearchDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Search.SearchDisplay" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
 
<asp:Panel ID="ContentPanel" runat="server" Visible="true" Translate="Yes">
    <asiweb:StyledHyperlink ID="AddLink" runat="server" CssClass="DisplayNone" Text=" " />
    <asp:Label ID="lblInfo" runat="server" CssClass="Info"></asp:Label>
    <%--This panel is only displayed in runtime - It will only show configured settings--%>
    <asp:Panel ID="panDesign" runat="server"></asp:Panel>
    <%--This panel only displayed in runtime - it does all actual processing--%>
    <asp:Panel ID="panRuntime" runat="server">
            <asp:Panel ID="panTopBar" runat="server" CssClass="SearchField"></asp:Panel>
            <div class="AutoWidth">&nbsp;</div>
            <div class="AutoWidth">
                <asp:Panel ID="PanelInactiveResults" runat="server" Visible="False" CssClass="FloatRight">
                    <asp:CheckBox ID="IncludeInactiveResultsCheckBox" runat="server" TextAlign="Right" />
                </asp:Panel>
            </div>
            <asp:Panel ID="panResults" runat="server" Visible="false">
                <a id="skipLink_<%#ClientID%>" href="#searchresults_<%#ClientID%>" class="screen-reader-text show-on-focus" >Skip to search results</a>
                <asiweb:Lister2 ID="lstSearchResults" runat="server" AddButtonEnabled="false" AddButtonLocation="None" 
                    DeleteColumnLocation="None" HeaderVisible="false" DisplayContentCode="Search.ResultsRow" 
                    AjaxEnabled="true" EditColumnLocation="None" ExportButtonLocation="None" 
                    GroupingEnabled="false" LinkTargetBehavior="SameWindow" Title="" SelectColumnLocation="None" 
                    SortingEnabled="false" PagingEnabled="true" EnableViewState="False" PagerMode="NextPrevAndNumeric"
                    OnItemCreated="lstSearchResults_OnItemCreated" BorderWidth="0px" BorderStyle="None" 
                    AllowGridRowSelectStyle="False" AddAnchorLink="True">
                </asiweb:Lister2>
                <asp:Label ID="lblExceedMaxResultsLabel" runat="server" Visible="false"></asp:Label>
            </asp:Panel>
    </asp:Panel>
</asp:Panel>
<asp:Label ID="debug" runat="server"></asp:Label>
