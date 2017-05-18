<%@ Reference Control="~/asicommon/controls/shared/security/permissiondetail.ascx" %>
<%@ Reference Control="~/asicommon/controls/shared/security/managesecurity.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityControls.Migrated_AccessTable" AutoEventWireup="true" Codebehind="AccessTable.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="AccessListPanel" runat="server" TemplateTitle="Current Access List" Collapsible="false" BorderStyle="None">
<div style="padding-top:0.5em;padding-bottom:0.5em;">   
    <asp:PlaceHolder id="TopPlaceHolder" runat="server"></asp:PlaceHolder>	        
    <asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>			    	        
    <asp:PlaceHolder id="BottomPlaceHolder" runat="server"></asp:PlaceHolder>		        
</div>             
</asiweb:PanelTemplateControl2>