<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainDisplay.ascx.cs" Inherits="Asi.Web.iParts.PackageInstaller.MainDisplay" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asiweb:PanelTemplateControl ID="MainPanel" Text="Package installer"   runat="server" FieldSet="true"
        ShowHeader="true" BorderStyle="None" Collapsible="false" >

<div class="PanelField top">
   <asp:Label ID="labelFilterLabel" runat="server" Text="Show" AssociatedControlID="PackageViewList" translate="yes"/> 
<asp:DropDownList ID="PackageViewList" runat="server" AutoPostBack="true" translate="yes">
    <asp:ListItem Selected="True" Text="Packages to be Installed" Value="Pending"></asp:ListItem>
    <asp:ListItem Text="Currently Installed Packages" Value="Completed"></asp:ListItem>
    <asp:ListItem Text="Failed Package Installs" Value="Failed"></asp:ListItem>    
</asp:DropDownList>

</div>
    <asiweb:Lister2 id="listPackages" runat="server" 
                            SortingEnabled="true"
                            PagingEnabled="true"
                            PagerMode="Advanced"
                            PageSize="20" 
                            ColumnReorderingEnabled="false"
                            EnableClientSideDelete="false"
                            DeleteColumnLocation="None"
                            EditColumnLocation="None"                            
                            LinkTargetBehavior="SameWindow"                                                                                         
                            ExportButtonLocation="None"
                            DisplayPropertiesList="Title,Description"
                            DataSourceIsRealDataSource="true"
                            DataKeyNames="Title">
    </asiweb:Lister2>

    <div class="PanelField Left">
        <asiweb:StyledButton ID="InstallButton" runat="server" Text="Install" OnClick="InstallButton_Click" Enabled="false" />
    </div>
<div class="PanelField Top">
    <asp:label id="MessagesLabel" runat="server" Text="Messages" translate="yes"/>
    <asp:Panel CssClass="PanelFieldValue" id="MessagesPanel" BackColor="white" runat="server" BorderWidth="1" style="overflow: auto;" 
        Height="250px" Width="95%">
        <asp:Repeater id="MessagesRepeater" runat="server">
            <ItemTemplate>
                <asp:label id="Message1" Width="100%" runat="server" CssClass="GridRow" /><br />
            </ItemTemplate>
            <AlternatingItemTemplate><asp:label id="Message2" Width="100%" runat="server" CssClass="GridAlternateRow"></asp:label><br></AlternatingItemTemplate>
        </asp:Repeater>
    </asp:Panel>
</div>
    
</asiweb:PanelTemplateControl>
