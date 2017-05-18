<%@ Control Language="c#" Inherits="AsiCommon_Controls_AtomPainter2_AtomPanelExplorer" Codebehind="AtomPanelExplorer.ascx.cs" %>
<%@ Register TagPrefix="ap" TagName="Fields" Src="~/AsiCommon/Controls/AtomPainter2/FieldRepeater.ascx" %>

<asp:Label ID="PrimaryAtomNameLabel" Runat="server" CssClass="Label"></asp:Label>
<asp:Label ID="Label1" Runat="server" Text=" - Properties" CssClass="Label"></asp:Label>
<br/>
<ap:Fields ID="FieldRepeater" runat="server" />
