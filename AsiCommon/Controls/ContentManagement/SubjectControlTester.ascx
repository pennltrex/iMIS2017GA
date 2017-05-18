<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_SubjectControlTester" Codebehind="SubjectControlTester.ascx.cs" %>
<div>
    Key:<br /> <asp:TextBox ID="Key" Columns="40" runat="server"></asp:TextBox> 
    <asp:Button ID="GoButton" runat="server" Text="Go" OnClick="GoButton_Click" />
</div>
<div>
    Name:<br /><asp:Literal ID="Name" runat="server"></asp:Literal>
</div>

