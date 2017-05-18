<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_SubjectControl" Codebehind="SubjectControl.ascx.cs" %>
<div>
    Key:<br /> <asp:TextBox ID="Key" runat="server"></asp:TextBox>
</div>
<div>
    Name:<br /><asp:Literal ID="Name" runat="server"></asp:Literal>
</div>

<asp:Button ID="GoButton" runat="server" Text="Go" OnClick="GoButton_Click" />