<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.PackageManagement.SupplementTop" Codebehind="SupplementTop.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<img src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/32/32_reports.gif" alt="<%# Asi.ResourceManager.GetPhrase("Supplement","Supplement") %>" align="absMiddle">&nbsp;
<asp:Label id="lblName" runat="server" Width="100%"></asp:Label>

