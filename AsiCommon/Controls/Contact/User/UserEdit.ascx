<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.UserManagement.UserEditControl" Codebehind="UserEdit.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Contact/User/PasswordEdit.ascx" TagPrefix="asipass" TagName="PasswordEdit" %>
<%@ Register Src="~/AsiCommon/Controls/Contact/User/LockoutStatus.ascx" TagPrefix="asilockout" TagName="LockoutStatus" %>
<%@ Register Src="~/AsiCommon/Controls/Contact/User/CommonUserEdit.ascx" TagPrefix="asi" TagName="CommonUserEdit" %>
<%@ Register Src="~/AsiCommon/Controls/Contact/User/StaffUserEdit.ascx" TagPrefix="asi" TagName="StaffUserEdit" %>

<script type="text/javascript">
    var navPath = '<%= Asi.AppContext.CurrentContext.TemplatePath %>';
    var paramSeparator = '?';
    if (navPath.indexOf('?') > 0)
        paramSeparator = '&';
    
    function AddUser() {
        ShowDialog_NoReturnValue(navPath + paramSeparator + "ContentCode=User.AuthUserCreate&DefaultEmail=<%# HttpUtility.UrlEncode(GetContactEmail()) %>", null, 600, 400, "Create user", null, "E", AddUserCallback);
        CancelEvent();
    }
    function AddUserCallback(dialogWindow) {
        if (!dialogWindow.result)
            return;
        InitiateControlEventWithArgument('<%= AddUserHiddenButton.ClientID %>', dialogWindow.result);
    }
    function confirmUserRemove() {
        return confirm("Are you sure you wish to remove this logon? The user will no longer be able to log in.");
    }
</script>
<asp:Panel runat="server" ID="UserDetailsMainPanel" translate ="yes">
    <asiweb:PanelTemplateControl2 ID="ContactInfoPanel" runat="server" TemplateTitle="Contact information" FieldSet="true" Collapsible="false">
        <asiweb:SmartControl runat="server" ID="ContactID" DisplayCaption="true" ReadOnly="true" />
        <asiweb:SmartControl runat="server" ID="ContactName" DisplayCaption="true" DisplayType="ReadOnlyField" CaptionCssClass="CapitalizeFirst" translate="no"/>
    </asiweb:PanelTemplateControl2>          
    <asiweb:PanelTemplateControl2 ID="UserInfoPanel" runat="server" TemplateTitle="User credentials" FieldSet="true">
        <div class="PanelField">
            <asp:Label ID="LogonLabel" runat="server" Text="Logon" AssociatedControlID="UserIDTextBox"></asp:Label>
            <div class="PanelFieldValue">
                <asp:Label ID="UserIDLabel" runat="server" style="float:left; margin-right:.5em;"></asp:Label>
                <asp:TextBox runat="server" ID="UserIDTextBox" OnTextChanged="UserID_OnTextChanged" CssClass="InputLarge" />               
                <asp:ImageButton ID="AddUserLink" runat="server" OnClientClick="AddUser(); return false;" />
                <asp:ImageButton ID="RemoveUserButton" runat="server" OnClick="RemoveUser_OnClick" OnClientClick="return confirmUserRemove();" AlternateText="Remove User Button" />
                <asp:Button ID="AddUserHiddenButton" Text="Hidden Add User Button" runat="server" style="display:none" OnClick="AddUserHiddenButton_Click" />             
            </div>
        </div>
        
        <asipass:PasswordEdit runat="server" ID="PasswordEdit1" />
        
        <div class="PanelField">
            <asp:Label ID="EmailLabel" runat="server" Text="Email" AssociatedControlID="MemberEmail"></asp:Label>
            <div class="PanelFieldValue">             
                <asp:TextBox runat="server" ID="MemberEmail" Enabled="false" OnTextChanged="MemberEmail_TextChanged" CssClass="InputLarge" />
            </div>
        </div>
        <div class="PanelField" id="LockoutStatus">
            <asp:Label ID="LockedOutLabel" runat="server" Text="Locked out" CssClass="Label" />
            <div class="PanelFieldValue AutoWidth">
                <asilockout:LockoutStatus runat="server" ID="LockoutStatusControl" />
            </div>
        </div>
        <div class="PanelField" id="LastLogin">
            <asp:Label ID="LastLogonCaption" runat="server" Text="Last sign in" CssClass="Label" />
            <div class="PanelFieldValue"> 
                <asp:Label ID="LastLoginLabel" runat="server" />
            </div>
        </div>
        <div class="PanelField" id="LastActive">
            <asp:Label ID="LastActiveOnCaption" runat="server" Text="Last active on" CssClass="Label" />
            <div class="PanelFieldValue"> 
                <asp:Label ID="LastActiveLabel" runat="server" />
            </div>
        </div>
        <div class="PanelField">
            <asp:Label ID="UserClassLabel" runat="server" Text="User class" CssClass="Label" />
            <div class="PanelFieldValue AutoWidth">
                <asp:RadioButtonList runat="server" ID="UserClassList" RepeatDirection="Horizontal" AutoPostBack="true" 
                    OnSelectedIndexChanged="UserClass_Changed" RepeatLayout="Flow">
                    <asp:ListItem Text="Public" Value="WebOnly" Selected="true"></asp:ListItem>
                    <asp:ListItem Text="Casual" Value="CasualStaff"></asp:ListItem>
                    <asp:ListItem Text="Staff" Value="FullStaff"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </asiweb:PanelTemplateControl2>
    <asiweb:PanelTemplateControl2 ID="CommonUserPanel" runat="server" TemplateTitle="User information">
        <asi:CommonUserEdit ID="CommonUserEdit1" runat="server" />
        <asp:Label ID="NullCommonUserMessage" runat="server" Visible="false" style="font-style:italic"></asp:Label>
    </asiweb:PanelTemplateControl2>
    <asiweb:PanelTemplateControl2 ID="StaffUserPanel" runat="server" TemplateTitle="Staff access" Collapsed="true">
        <asi:StaffUserEdit ID="StaffUserEdit1" runat="server" />
        <asp:Label ID="NullStaffUserMessage" runat="server" Visible="false" style="font-style:italic"></asp:Label>
    </asiweb:PanelTemplateControl2>
</asp:Panel>
<div class="ClearFix">
    <asp:Label ID="UserDetailMessageLabel" runat="server" Visible="false" style="font-style:italic"></asp:Label>
</div>

<script type="text/javascript">
    //<![CDATA[ 
    var lockoutStatusControl = jQuery("[id$=LockoutStatusControl_LockoutStatusLabel]");
    if (lockoutStatusControl != null && lockoutStatusControl.html().length == 0) {
        var control = jQuery("[id$=LockoutStatus]");
        if (control != null)
            control.hide();
    }
    var lastLogin = jQuery("[id$=LastLoginLabel]");
    if (lastLogin != null && lastLogin.html().length == 0) {
        var control = jQuery("[id$=LastLogin]");
        if (control != null)
            control.hide();
    }
    var lastActive = jQuery("[id$=LastActiveLabel]");
    if (lastActive != null && lastActive.html().length == 0) {
        var control = jQuery("[id$=LastActive]");
        if (control != null)
            control.hide();
    }
    //]]>
</script>
