<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceCodeInserts" Codebehind="SourceCodeInserts.ascx.cs" %>

<asp:UpdatePanel ID="InsertsUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
        <asiweb:PanelTemplateControl2 ID="SelectedInsertsPanel" runat="server" TemplateTitle="Selected Inserts" Collapsible="false">
            <asp:Label runat="server" ID="NoInsertsSelected" CssClass="GeneralMessage" Visible="false" Height="10px" />
            <asp:Repeater runat="server" ID="SelectedInserts" DataSource="<%#GetPackageItems()%>">
                <HeaderTemplate>
                    <table class="Grid">
                        <tr class="GridHeader">
                            <th><asiweb:StyledLabel runat="server" ID="NameLabel" Text="Name" /></th>
                            <th><asiweb:StyledLabel runat="server" ID="StyledLabel1" Text="Created On" /></th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="GridRow" id='<%#Eval("SupplementKey","{0}Row")%>' onmouseover="this.oldClassName=this.className;this.className='GridRowHover';" onmouseout="this.className=this.oldClassName;">
                        <td><%#Eval("Name")%></td>
                        <td><%# Convert.ToDateTime(Eval("CreatedOn")).ToString("d",System.Globalization.CultureInfo.CurrentCulture)%></td>
                        <td><asp:LinkButton runat="server" Text="remove" ToolTip="Remove this item" ID="DeleteButton" CommandName="Delete" CommandArgument='<%#Eval("SupplementKey")%>' /></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="GridAlternateRow" id='<%#Eval("SupplementKey","{0}Row")%>' onmouseover="this.oldClassName=this.className;this.className='GridAlternateRowHover';" onmouseout="this.className=this.oldClassName;">
                        <td><%#Eval("Name")%></td>
                        <td><%# Convert.ToDateTime(Eval("CreatedOn")).ToString("d",System.Globalization.CultureInfo.CurrentCulture)%></td>
                        <td><asp:LinkButton runat="server" Text="remove" ToolTip="Remove this item" ID="DeleteButton" CommandName="Delete" CommandArgument='<%#Eval("SupplementKey")%>' /></td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
        </asiweb:PanelTemplateControl2>

        <asiweb:PanelTemplateControl2 ID="AvailableInsertsPanel" runat="server" TemplateTitle="Available Inserts" Collapsible="false">
            <div style="width:100%; clear:both;">
                <asiResultsViewer:QueryResultGrid 
                    ID="AvailableInsertsGrid" runat="Server" 
                    SelectEnabled="True" SelectItemBehavior="RaiseEvent"
                    QueryPath = "$/PackageManagement/DefaultSystem/Queries/SupplementList"
                     />
            </div>
        </asiweb:PanelTemplateControl2>
    </ContentTemplate>
</asp:UpdatePanel>

