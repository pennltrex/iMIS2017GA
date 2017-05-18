<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.FormsAuthentication.Login" Codebehind="Login.ascx.cs" %>

<script type="text/javascript">
    addLoadEvent(focusLogonName);
    function focusLogonName()
    {
        var logonNameId = '<asp:Literal runat="server" Text='<%# LoginView1.FindControl("Login1") != null ? LoginView1.FindControl("Login1").FindControl("UserName").ClientID : "" %>' />';
        if (logonNameId.length > 0)
            $get(logonNameId).focus();
    }
</script>
<div style="width:100%; text-align: center;">
<asp:UpdatePanel ID="LoginUpdatePanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
    <ContentTemplate>
    <p><asp:Label ID="lblMessage" runat="server"></asp:Label></p>
    <p class="error"><asp:Label ID="LoginErrorMessage" runat="server" Visible="false"></asp:Label></p>
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server" style="margin:auto;" Width="275px"
                DisplayRememberMe="true" OnAuthenticate="Login1_Authenticate"
                OnLoggedIn="Login1_LoggedIn" 
                PasswordRecoveryUrl="RecoverPassword.aspx">
                <LayoutTemplate>
                    <asiweb:PanelTemplateControl2 id="PanelTemplate1" runat="server" TemplateTitle="iMIS Logon" Collapsible="false" DefaultButton="Login" FieldSet="true">                        
                        <span class="Error" style="width:99%; text-align:center;">
                            <asp:Literal ID="FailureText" runat="server" />
                        </span>
                        <div class="PanelField AutoWidth">
                            <asp:Label ID="UserNameLabel" runat="server" Text="Logon" AssociatedControlID="UserName" style="width:7em !important;" />
                            <div class="PanelFieldValue">
                                <asp:TextBox ID="UserName" runat="server" style="width:11em;" /> <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="UserNameRequired" runat="server" ControlToValidate="UserName" Text="*"></asp:requiredfieldvalidator>
                            </div>
                        </div>
                        <div class="PanelField AutoWidth">
                            <asp:Label ID="PasswordLabel" runat="server" Text="Password" AssociatedControlID="Password" style="width:7em !important;" />
                            <div class="PanelFieldValue">
                                <asp:TextBox TextMode="Password" ID="Password" runat="server" style="width:11.1em;" /> <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="PasswordRequired" runat="server" ControlToValidate="Password" Text="*"></asp:requiredfieldvalidator>
                            </div>
                        </div>
                        <div id="Div1" class="PanelField AutoWidth FloatNone" runat="server" visible="<%# ShowRememberMe() %>" style="text-align:left;">
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me on this computer." />
                        </div>
                        <div class="PanelField" style="text-align:right; margin-left: auto; border-bottom: none;">
                            <asiweb:StyledButton ID="Login" CommandName="Login" runat="server" Text="Log On" CausesValidation="true" UseSubmitBehavior="true" />
                        </div>
                        <div class="PanelField" style="text-align:left; border-bottom: none;">
                            <asp:HyperLink ID="RecoverPasswordLink" runat="server" NavigateUrl="<%# RecoverPasswordURL() %>" Text="Forgot my password"></asp:HyperLink>
                        </div>
                        <div id="CreateAccount" runat="server" class="PanelField" style="text-align:left;">
                            <asp:HyperLink ID="CreateAnAccountLink" runat="server" NavigateUrl="<%# CreateAccountURL() %>" Text="Create a new account"></asp:HyperLink>
                        </div>
                        <div class="PanelField" style="text-align:right; margin-left: auto;">
                            <asp:Image ID="iMISOrangeImage" runat="server" SkinID="LoginImage" />
                        </div>
                    </asiweb:PanelTemplateControl2>
                </LayoutTemplate>
                </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div><asp:LoginName runat="server" ID="LoginName1" /></div>
            <asp:Panel runat="server" ID="UsernameChangePanel">
                <table cellspacing="0" cellpadding="1" border="0" style="border-collapse:collapse;">
                    <tr>
	                    <td><table cellpadding="0" border="0">
		                    <tr>
			                    <td align="center" colspan="2"><asp:Label runat="server" ID="UsernameInstructionLabel"></asp:Label></td>
		                    </tr><tr>
			                    <td align="right"><asp:Label runat="server" ID="UsernameLabel"></asp:Label></td><td><asp:TextBox runat="server" ID="UsernameTextBox"></asp:TextBox></td>
		                    </tr><tr>
			                    <td align="right"><asp:Label runat="server" ID="PasswordLabel"></asp:Label></td><td><asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password"></asp:TextBox></td>
		                    </tr><tr>
			                    <td align="center" colspan="2"><asp:Button runat="server" ID="ChangeUsernameButton" OnClick="ChangeUsername_Click" /></td>
		                    </tr><tr>
			                    <td align="center" colspan="2"><asp:Label runat="server" ID="UsernameMessageLabel" /></td>
		                    </tr>
	                    </table></td>
                    </tr>
                </table>            
            </asp:Panel>
            <asp:Panel runat="server" ID="ChangePasswordPanel">
                <asp:ChangePassword ID="ChangePassword1" runat="server" Visible="False"></asp:ChangePassword>
            </asp:Panel>
            <div><asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggedOut="LoginStatus1_LoggedOut" /></div>
        </LoggedInTemplate>
    </asp:LoginView>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
