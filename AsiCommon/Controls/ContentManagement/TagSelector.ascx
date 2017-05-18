<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.TagSelector" Codebehind="TagSelector.ascx.cs" %>

<div id="divSelectedTags" runat="server">
    <asp:BulletedList runat="server" ID="lstSelectedTags" CssClass="SelectedTagList"/>
    <asp:LinkButton ID="lnkShowDialog" runat="server" CssClass="SelectedTagList"></asp:LinkButton>
</div>

<asp:TextBox ID="hdnSelectedTagIDs" runat="server" EnableViewState="true" style="display: none;"></asp:TextBox>
<input type="hidden" id="hdnNoneSelectedMessage" runat="server" />
<div style="clear:both"></div>
