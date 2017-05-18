<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_SecurityAdmin_AccessSettingsModuleAuthorization" Codebehind="AccessSettingsModuleAuthorization.ascx.cs" %>

<asp:Repeater ID="Repeater1" runat="server"
    DataSource='<%# LegacyRoleDataSource %>'>
    <ItemTemplate>
        <div class="PanelField">
            <asp:Label ID="ListLabel" runat="server" AssociatedControlID="LevelSelect"></asp:Label>
            <div class="PanelFieldValue">
                <asp:DropDownList ID="LevelSelect" runat="server"
                    OnDataBound="LevelList_DataBound"
                    OnSelectedIndexChanged="LevelList_SelectedIndexChanged">
                    <asp:ListItem Text="0 - No Access" Value="" />
                    <asp:ListItem Text="1 - Basic Display Only" />
                    <asp:ListItem Text="2 - Reports" />
                    <asp:ListItem Text="3 - Limited Entry/Edit" />
                    <asp:ListItem Text="4 - Full Entry/Edit" />
                    <asp:ListItem Text="5 - Table Maintenance" />
                    <asp:ListItem Text="6 - Report Changed" />
                    <asp:ListItem Text="8 - System Setup" />
                </asp:DropDownList>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
