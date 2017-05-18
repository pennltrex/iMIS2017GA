<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_AuthorityGroupRoles" Codebehind="AuthorityGroupRoles.ascx.cs" %>

<asp:Panel ID="GroupRoles" runat="server">
    <asp:Label ID="SelectPermissionsLabel" runat="server" CssClass="Label" Text="Select permissions:" />
    <div class="AutoWidth FloatNone Section">
        <asp:CheckBoxList ID="GroupTypeRoles" runat="server" DataTextField="GroupRoleName" DataValueField="GroupRoleKey" CssClass="PermissionTable" RepeatColumns="3" TextAlign="Right"  />
    </div>   
    <div>
        <asiweb:StyledButton ID="UpdateButton" Text="Update" runat="server" CommandName="Update" OnClick="UpdateButton_Click" CssClass="PrimaryButton"/>
        <asiweb:StyledButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel" />
    </div>
</asp:Panel>