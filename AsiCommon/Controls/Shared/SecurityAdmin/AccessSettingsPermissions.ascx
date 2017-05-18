<%@ Control Language="C#" Inherits="AsiCommon_Controls_Shared_SecurityAdmin_AccessSettingsPermissions" Codebehind="AccessSettingsPermissions.ascx.cs" %>

<div style="float: left; white-space:nowrap;">
    <asp:Literal ID="PermissionEditPanelBegin" runat="server"></asp:Literal>
        <div id="PermissionEditPanel" runat="server">
            <div>
                <span>
                    <asp:CheckBox ID="FullControlPermission" runat="server" Text="Full Control" TextAlign="Right" onclick="FullControl_Click(this);" />
                </span>
                <span>
                    <asp:CheckBox ID="ReadPermission" runat="server" Text="Read" TextAlign="Right" />
                    <asp:CheckBox ID="AddPermission" runat="server" Text="Add" TextAlign="Right" />
                    <asp:CheckBox ID="EditPermission" runat="server" Text="Edit" TextAlign="Right" />
                    <asp:CheckBox ID="DeletePermission" runat="server" Text="Delete" TextAlign="Right" />
                    <asp:CheckBox ID="SelectPermission" runat="server" Text="Select" TextAlign="Right" />
                </span>
            </div>
        </div>
    <asp:Literal ID="PermissionEditPanelEnd" runat="server"></asp:Literal>
</div>