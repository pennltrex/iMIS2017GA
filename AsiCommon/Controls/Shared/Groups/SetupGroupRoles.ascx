<%@ Control Language="C#" Inherits="Asi.Web.UI.Common.Utility.SetupGroupRoles" Codebehind="SetupGroupRoles.ascx.cs" %>
<%@ Reference Control="~/asicommon/controls/shared/listbuilder/listbuilder.ascx" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asp:Label id="lblName" runat="server"></asp:Label>
<asp:TextBox id="txtName" runat="server"></asp:TextBox>
<br /><br />
<asp:PlaceHolder id="phListBuilder" runat="server"/>
<div>
    <div class="CommandBar">
        <asiweb:StyledButton ID="btnAdd" runat="server" AutoPostBack="false" />
        <asiweb:StyledButton ID="btnSave" runat="server" CommandButtonType="Save" />
        <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" CausesValidation="false" />
    </div>
</div>