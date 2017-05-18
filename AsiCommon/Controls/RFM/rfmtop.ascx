<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMTop" Codebehind="RFMTop.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<img src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/32/32_rfm.gif" alt="<%# Asi.ResourceManager.GetPhrase("RFMPortfolio","RFM Analytics Portfolio") %>" align=absMiddle>&nbsp;
<asp:Label id="lblName" runat="server" Width="100%"></asp:Label>
