<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_SearchForm" Codebehind="SearchForm.ascx.cs" %>
<asiweb:PanelTemplateControl ID="SearchFields" runat="server" RoundedCorners="false" FieldSet="true" TemplateTitle="Search Parameters" CollapsedText="Search Parameters">
    <asp:Label ID="SearchIntroduction" runat="server"></asp:Label>
    <div id="KeywordsDiv" runat="server">
        <asp:Label ID="SearchTermsLabel" runat="server" AssociatedControlID="SearchTerms" translate ="yes" Text="Search For:"></asp:Label> <asp:TextBox ID="SearchTerms" runat="server"></asp:TextBox>
    </div>
    <div id="SearchDatesDiv" runat="server">
        <asp:Label ID="SearchDateLabel" runat="server" AssociatedControlID="FromDate" translate ="yes" Text="Show content published between" /> <asiweb:BusinessCalendar ID="FromDate" runat="server" /> <asp:Label ID="SearchDateLabel2" runat="server" AssociatedControlID="ToDate" Text="and" /> <asiweb:BusinessCalendar ID="ToDate" runat="server" />
    </div>
    <div><asp:Button ID="GoButton" runat="server" OnClick="GoButton_Clicked" translate ="yes" Text="Go" SkinID="SearchGoButton" /></div>
    <div>
        <asp:Repeater ID="UdfRepeater" runat="server" OnItemCreated="UdfRepeater_ItemCreated">
            <ItemTemplate>
                <asiweb:SmartControl ID="UdfControl" runat="server" DisplayCaption="true" PositionCaption="Left"></asiweb:SmartControl>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="margin-top: 10px">
        <asp:Repeater ID="SectionRepeater" runat="server" OnItemDataBound="SectionRepeater_ItemDataBound">
            <ItemTemplate>
                <div class="AdvancedSearchSection">
                    <asp:Label ID="SectionIntroduction" runat="server"></asp:Label>
                    <asp:Repeater ID="TagRepeater" runat="server" OnItemDataBound="TagRepeater_ItemDataBound">
                        <ItemTemplate>
                            <span style="float: left"><asp:CheckBox ID="UseTag" runat="server" /></span>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span style="clear: both"></span>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="TagGroupRepeater" runat="server" OnItemDataBound="TagGroupRepeater_ItemDataBound">
                        <ItemTemplate>
                            <span style="float: left"><asp:CheckBox ID="UseTagGroup" runat="server" /></span>
                        </ItemTemplate>
                        <FooterTemplate>
                            <span style="clear: both"></span>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div style="clear: both;"></div>
            </ItemTemplate>
            <SeparatorTemplate>
                    <hr id="SectionSeparator" runat="server" />
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asiweb:PanelTemplateControl>
<asiweb:PanelTemplateControl ID="SearchResults" runat="server" RoundedCorners="false" FieldSet="true" TemplateTitle="Search Results" CollapsedText="Search Results" Visible="false">
    <div class="SearchResultsSortLink">
        <asp:LinkButton ID="SortByRelevance" runat="server" Enabled="false" Text="Sorted by relevance" OnClick="SortByRelevance_Click" CssClass="SearchResultsSortLink_Selected"></asp:LinkButton>
        <asp:LinkButton ID="SortByDate" runat="server" Text="Sort by date" OnClick="SortByDate_Click"></asp:LinkButton>
    </div>
    <asiweb:Lister2 ID="SearchResultsLister" runat="server" AddButtonEnabled="false" DeleteColumnLocation="None"
                    HeaderVisible="false" DisplayContentCode="Search.ResultsRow" AjaxEnabled="true"
                    EditColumnLocation="None" ExportButtonLocation="TopRight" GroupingEnabled="false" LinkTargetBehavior="SameWindow" Title=""
                    SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="true" PagerMode="Advanced"></asiweb:Lister2>

    <div style="display: none;">
        <%-- Lister below is for exporting data --%>
        <asiweb:Lister2 ID="lstExportableSearchResults" runat="server" Title="Search Results"
            AddButtonEnabled="false" DeleteColumnLocation="None" AjaxEnabled="false"
            EditColumnLocation="None" ExportButtonLocation="None" GroupingEnabled="false"
            SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="false" 
            DisplayPropertiesList="Title, PublicationDate, Abstract, Rank" />
    </div>
                        
    <asp:Label ID="ExceedMaxResultsLabel" runat="server" Visible="false"></asp:Label>
</asiweb:PanelTemplateControl>
