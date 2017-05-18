<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PasswordEdit.ascx.cs" Inherits="Asi.Web.UI.Common.Contact.UserManagement.PasswordEdit" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="PanelField">  
    <asp:Label ID="PasswordLabel" runat="server" Text="Password" AssociatedControlID="Password"/>                    
    <div class="PanelFieldValue">
        <asiweb:BusinessTextBox id="Password" runat="server" TextMode="Password" Enabled="false" CssClass="InputLarge" autocomplete="off" />
        <asp:CustomValidator id="PasswordCustomValidator" runat="server" ControlToValidate="Password" Display="Dynamic" EnableClientScript="true" />     
        <asp:CompareValidator id="PasswordCompareValidator1" runat="server" ControlToCompare="PasswordVerify" ControlToValidate="Password" Display="Dynamic" EnableClientScript="true" />                      
    </div>
</div>
<div class="PanelField">	
    <asp:Label ID="PasswordVerifyLabel" runat="server" Text="Confirm password" AssociatedControlID="PasswordVerify" /> 	
	<div class="PanelFieldValue">
        <asiweb:BusinessTextBox id="PasswordVerify" runat="server" TextMode="Password" Enabled="false" CssClass="InputLarge" autocomplete="off" />     
        <asp:CompareValidator id="PasswordCompareValidator" runat="server" ControlToCompare="Password" ControlToValidate="PasswordVerify" Display="Dynamic" EnableClientScript="true" />		
	</div>
</div>