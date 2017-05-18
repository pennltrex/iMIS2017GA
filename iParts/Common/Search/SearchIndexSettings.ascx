<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchIndexSettings.ascx.cs" Inherits="Asi.Web.iParts.Common.Search.SearchIndexSettings" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl2 runat="server" ID="DisplayPanel" TemplateTitle='<%# ResourceManager.GetPhrase("IndexingPreferences", "Indexing preferences") %>' ShowHeader="True" Collapsible="False" ScrollBars="None" ShowBorder="True" translate="yes">
    <asp:Panel runat="server" ID="PreferencesPanel" CssClass="row" >
        <div class="col-sm-6">
            <strong translate="yes"><asiweb:BusinessLiteral runat="server" ID="PublishersLiteral" ></asiweb:BusinessLiteral></strong>
            <asiweb:InfoControl ID="PublisherHelp" runat="server" Visible="True" Translate="no"/>
            <asp:Repeater ID="PublishHelperRepeater" runat="server" OnItemDataBound="PublishHelperRepeater_ItemDataBound">
            <HeaderTemplate>
                <div class="CheckBoxList">
            </HeaderTemplate>
            <ItemTemplate>
                <asiweb:BusinessCheckBox runat="server" ID="PublishHelperCheckBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" />
                <asp:HiddenField runat="server" ID="PublishHelperName"/>
            </ItemTemplate>
            <FooterTemplate>
                </div> <%-- End CheckBoxList class --%>
            </FooterTemplate>
            </asp:Repeater>         
            <div class="PanelField Left">
                <asiweb:StyledButton runat="server" ID="SaveButton" CssClass="PrimaryButton" Text='<%# ResourceManager.GetPhrase("Save", "Save") %>' OnClick="SaveButton_OnClick" />            
            </div>  
        </div>            
        <div class="col-sm-6">            
            <div class="PanelField Left">
                <asiweb:StyledButton runat="server" ID="ReIndexButton" Text='<%# ResourceManager.GetPhrase("ReIndexAll", "Rebuild search index") %>' OnClick="ReIndexButton_OnClick" />                                         
            </div>
            <div class="Info">
                <asiweb:BusinessLiteral runat="server" ID="AdditionalInfoLiteral" ></asiweb:BusinessLiteral>
                <asiweb:InfoControl ID="IndexHelper" runat="server" Visible="True" Translate="no"/>  
            </div>      
        </div>          
    </asp:Panel>       
</asiweb:PanelTemplateControl2>