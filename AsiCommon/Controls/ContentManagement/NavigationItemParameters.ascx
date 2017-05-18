<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_NavigationItemParameters" Codebehind="NavigationItemParameters.ascx.cs" %>
<asp:Repeater runat="server" ID="ContentParameterRepeater" OnItemCreated="Repeater_OnItemCreated">
    <ItemTemplate>
        <asiweb:PanelTemplateControl ID="ParameterPanel" runat="server" FieldSet="true"></asiweb:PanelTemplateControl>
    </ItemTemplate>
</asp:Repeater>
<asp:Label ID="NoContentMessage" runat="server" Text="There is no attached content for which to gather parameters." />
<asp:Label ID="NoParametersMessage" runat="server" Text="The attached content does not have any parameters to edit." />