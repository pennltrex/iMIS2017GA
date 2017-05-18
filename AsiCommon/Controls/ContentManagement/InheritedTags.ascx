<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_InheritedTags" Codebehind="InheritedTags.ascx.cs" %>
<div style="border: thin solid darkgray; margin-top: 10px; padding: 5px;">
    <h4><asp:Label runat="server" Text="Tags inherited from parent hierarchy"/></h4>
    <asp:BulletedList runat="server" ID="SelectedTags" CssClass="SelectedTagList" translate="no"/>
    <asp:Label ID="NoResultsLabel" runat="server" Text="(None)" style="font-style: italic"></asp:Label>
</div>