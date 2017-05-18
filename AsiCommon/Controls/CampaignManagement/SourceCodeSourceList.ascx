<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceCodeSourceList" Codebehind="SourceCodeSourceList.ascx.cs" %>
<%@ Register TagPrefix="Campaigns" TagName="AddSourceList" Src="~/AsiCommon/Controls/CampaignManagement/SourceList/SourceListSelector.ascx" %>

<asp:UpdatePanel ID="SourceListUpdatePanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
    <ContentTemplate>
        <asiweb:PanelTemplateControl2 ID="CurrentSourceListsPanel" runat="server" TemplateTitle="Current Source Lists" Collapsible="false">
            <asp:Label runat="server" ID="NoSourceListsSelected" CssClass="GeneralMessage" Visible="false" Height="10px" />

            <asp:Repeater runat="server" DataSource="<%#GetSourceLists()%>" ID="SourceListRepeater" >
                <HeaderTemplate>
                    <table class="Grid" id="SourceListsTable">
                        <tr class="GridHeader">
                            <th><asiweb:StyledLabel runat="server" ID="SourceListName" Text="Segments / Queries" /></th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="GridRow" onmouseover="this.oldClassName=this.className;this.className='GridRowHover';" onmouseout="this.className=this.oldClassName;">
                        <td><%#Eval("DisplayText")%></td>
                        <td><asp:LinkButton runat="server" ID="DeleteButton" CommandName="Delete" CommandArgument='<%#Eval("SourceListKey")%>' Text="remove" /></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="GridAlternateRow" onmouseover="this.oldClassName=this.className;this.className='GridAlternateRowHover';" onmouseout="this.className=this.oldClassName;">
                        <td><%#Eval("DisplayText")%></td>
                        <td><asp:LinkButton runat="server" ID="DeleteButton" CommandName="Delete" CommandArgument='<%#Eval("SourceListKey")%>' Text="remove" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
            
        </asiweb:PanelTemplateControl2>
    </ContentTemplate>
</asp:UpdatePanel>

<div style="height:auto;">
    <Campaigns:AddSourceList runat="server" ID="AddSourceList" OnSourceAdded="AddSourceList_SourceAdded"  />
</div>
