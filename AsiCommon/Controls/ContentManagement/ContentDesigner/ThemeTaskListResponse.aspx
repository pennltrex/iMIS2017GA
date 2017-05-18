<%@ Page Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ThemeTaskListResponse" MasterPageFile="~/Templates/MasterPages/empty.master" Codebehind="ThemeTaskListResponse.aspx.cs" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="ThemeTaskListResponsePanel" runat="server" FieldSet="true" ShowHeader="true" TemplateTitle="Send a Message" BorderStyle="None">
        <asp:Label ID="SendToLabel" runat="server" AssociatedControlID="SendToText" Text="Send to" />
        <asp:TextBox ID="SendToText" runat="server" Text="Temp" ReadOnly="true" /><br />
        <asp:Label ID="SubjectLabel" runat="server" AssociatedControlID="SubjectText" Text="Subject" />
        <asp:TextBox ID="SubjectText" runat="server" Text="Content change request" ReadOnly="true" /><br />
        <asp:Label ID="MessageLabel" runat="server" AssociatedControlID="MessageText" Text="Message" /><br />
        <asp:TextBox ID="MessageText" runat="server" Text="Temp3" Height="25em" Width="55em" TextMode="MultiLine" />
    </asiweb:PanelTemplateControl>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
