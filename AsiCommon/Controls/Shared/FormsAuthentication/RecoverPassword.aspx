<%@ Page Title="iMIS Password Recovery" Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_FormsAuthentication_RecoverPassword" Codebehind="RecoverPassword.aspx.cs" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Content ID="UserMessages" runat="server" ContentPlaceHolderID="TemplateUserMessages" style="margin:auto;" >
</asp:Content>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">

    <asiweb:PanelTemplateControl2 runat="server" ID="RequestPanel" TemplateTitle="Forgot my password" FieldSet="true" Collapsible="false" style="margin: auto;" Width="400px">
            
        <asp:Literal ID="RequestInstructionsLiteral" runat="server" Text="Enter the Logon for your user account, then click Submit. We will email you a link to a page where you can easily create a new password.<br/>" />
        
        <div class="PanelField Left">
            <div style="display: inline;">
                <asp:Label ID="UserNameLabel" runat="server" Text="Logon Name" CssClass="Required" AssociatedControlID="UserNameTextBox"></asp:Label>
            </div>
            <div class="PanelFieldValue">
                <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox><br style="clear: both;" />
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" EnableClientScript="true" Display="Dynamic" ControlToValidate="UserNameTextBox" CssClass="Important" ErrorMessage="You must enter your logon name."></asp:RequiredFieldValidator>
            </div>
        </div>

        <asiweb:RecaptchaControl ID="Recaptcha1" runat="server" />

        <div class="CommandBar">
	        <asp:Button ID="RequestSubmitButton" runat="server" Text="Submit" OnClick="RequestSubmit_Click" />
        </div>

        <div style="clear: both;" />

    </asiweb:PanelTemplateControl2>

    <asiweb:PanelTemplateControl2 runat="server" ID="ResetPanel" TemplateTitle="Reset my password" FieldSet="true" Collapsible="false" style="margin:auto;" Width="400px">
            
        <asp:Literal ID="PasswordInstructionsLiteral" runat="server" />

        <div class="PanelField Left">
            <div style="display: inline;">
                <asp:Label ID="NewPasswordLabel" runat="server" Text="New Password" CssClass="Required" AssociatedControlID="NewPasswordTextBox"></asp:Label>
            </div>
            <div class="PanelFieldValue">
                <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="password"></asp:TextBox><br style="clear: both;" />
                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" EnableClientScript="true" Display="Dynamic" ControlToValidate="NewPasswordTextBox" CssClass="Important" ErrorMessage="You must enter a new password."></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="PanelField Left">
            <div style="display: inline;">
                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" Text="Confirm New Password" CssClass="Required" AssociatedControlID="NewPasswordTextBox"></asp:Label>
            </div>
            <div class="PanelFieldValue">
                <asp:TextBox ID="ConfirmNewPasswordTextBox" runat="server" TextMode="password"></asp:TextBox><br style="clear: both;" />
                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" EnableClientScript="true" Display="Dynamic" ControlToValidate="ConfirmNewPasswordTextBox" CssClass="Important" ErrorMessage="Confirm the new password."></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="PasswordsMatchValidator" runat="server" EnableClientScript="true" Display="Dynamic" ControlToValidate="ConfirmNewPasswordTextBox" ControlToCompare="NewPasswordTextBox" Type="String" CssClass="Important" ErrorMessage="Passwords must match."></asp:CompareValidator>
            </div>
        </div>

        <div class="CommandBar">
	        <asp:Button ID="ResetSubmitButton" runat="server" Text="Submit" OnClick="ResetSubmit_Click" causesvalidation="true"/>
	        <asp:Button ID="ResetCancelButton" runat="server" Text="Cancel" OnClick="ResetCancel_Click" causesvalidation="false"/>
        </div>

        <div style="clear: both;" />

    </asiweb:PanelTemplateControl2>

</asp:Content>