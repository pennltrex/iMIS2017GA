<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_EmailAFriend" Title="Email a friend" Codebehind="EmailAFriend.aspx.cs" %>

<asp:Content ID="Content3" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:PanelTemplateControl2 ID="EmailPanel" runat="server" FieldSet="true" ShowHeader="false">
        <div id="divSendThisPageTo" runat="server" class="PanelField Left">
            <asp:Label ID="SendThisPageToLabel" runat="server" AssociatedControlID="SendThisPageTo" Text="Send this page to" CssClass="Required"></asp:Label>
            <div class="PanelFieldValue">
                <asp:TextBox ID="SendThisPageTo" runat="server" CssClass="InputLarge" />
                <asiweb:AsiRequiredFieldValidator ID="ToAddressRequiredValidator" runat="server" ControlToValidate="SendThisPageTo" CssClass="Important" EnableClientScript="true" ErrorMessage="Required field"></asiweb:AsiRequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ToAddressFormatValidator" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="SendThisPageTo" Display="Dynamic" ValidationExpression="\s*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*(,\s*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*)*" CssClass="Important"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div id="divYourEmail" runat="server" class="PanelField Left">
            <asp:Label ID="YourEmailLabel" runat="server" AssociatedControlID="YourEmail" Text="Your email address" CssClass="Required"></asp:Label>
            <div class="PanelFieldValue">
                <asp:TextBox ID="YourEmail" runat="server" CssClass="InputLarge" />
                <asiweb:AsiRequiredFieldValidator ID="YourEmailRequiredValidator" runat="server" ControlToValidate="YourEmail" CssClass="Important" EnableClientScript="true" ErrorMessage="Required field"></asiweb:AsiRequiredFieldValidator>
                <asp:RegularExpressionValidator ID="YourEmailFormatValidator" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="YourEmail" Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Important"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div id="divPersonalMessage" runat="server" class="PanelField Left Top">
            <asp:Label ID="PersonalMessageLabel" runat="server" AssociatedControlID="PersonalMessage" Text="Personal message"></asp:Label>
            <div class="AutoWidth PanelFieldValue">
                <asp:TextBox ID="PersonalMessage" runat="server" TextMode="MultiLine" Rows="10" CssClass="InputXXLarge"></asp:TextBox>
            </div>
        </div>
    </asiweb:PanelTemplateControl2>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="TemplateButtonBar" Runat="Server">
</asp:Content>