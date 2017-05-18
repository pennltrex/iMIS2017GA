<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_AdvancedSearchProperties" Codebehind="AdvancedSearchProperties.ascx.cs" %>
<%@ Register TagPrefix="asiweb" TagName="SearchSection" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/AdvancedSearchSectionProperties.ascx" %>
<asiweb:PanelTemplateControl ID="SearchFormProperties" runat="server" RoundedCorners="false" TemplateTitle="Advanced Search Properties" CollapsedText="Advanced Search Properties" Collapsed="false" FieldSet="true">
    <asiweb:SmartControl ID="Introduction" runat="server" BoundPropertyName="Introduction" DisplayCaption="true" />
    <asiweb:SmartControl ID="AllowKeywordSearch" runat="server" BoundPropertyName="AllowKeywordSearch" DisplayCaption="true" />
    <asiweb:SmartControl ID="AllowDateRangeSearch" runat="server" BoundPropertyName="AllowDateRangeSearch" DisplayCaption="true" />
    <asiweb:SmartControl ID="AllowUDFSearch" runat="server" BoundPropertyName="AllowUDFSearch" DisplayCaption="true" />
    <asiweb:SmartControl ID="SearchOperator" runat="server" BoundPropertyName="SearchOperator" DisplayCaption="true" />
</asiweb:PanelTemplateControl>
<asiweb:PanelTemplateControl ID="SearchSectionPanel" runat="server" RoundedCorners="false" TemplateTitle="Advanced Search Sections" CollapsedText="Advanced Search Sections" Collapsed="false">
    <asp:Repeater ID="SearchSections" runat="server" OnItemCommand="SearchSections_ItemCommand" OnItemCreated="SearchSections_ItemCreated">
        <HeaderTemplate>
            <div style="float:right"><asp:LinkButton ID="AddButton" Runat="server" CommandName="add">add</asp:LinkButton></div>
            <div style="clear:both"></div>
        </HeaderTemplate>
        <ItemTemplate>
            <div style="float:left"><asiweb:SearchSection ID="SearchSection" runat="server"></asiweb:SearchSection></div><div style="float:right"><asp:LinkButton ID="DeleteButton" runat="server" CommandName="delete">delete</asp:LinkButton></div>
            <div style="clear:both"></div>
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:Label ID="NoSearchSectionMessage" runat="server" Text="Click 'add' to add a new Advanced Search Section." Visible="false"></asp:Label>
</asiweb:PanelTemplateControl>