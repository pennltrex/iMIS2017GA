<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.RoleEdit" Codebehind="RoleEdit.ascx.cs" %>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<div class="Info">
    <asiweb:StyledLabel runat="server" ID="SystemRole" />
</div>
<asiweb:BusinessTextBox runat="server" ID="Name" DisplayCaption="True" RenderPanelField="True" 
        OnTextChanged="Name_TextChanged" />
<asiweb:BusinessTextBox runat="server" ID="Description" DisplayCaption="True" RenderPanelField="True" TextMode="MultiLine" Rows="5" 
        OnTextChanged="Description_TextChanged" />
