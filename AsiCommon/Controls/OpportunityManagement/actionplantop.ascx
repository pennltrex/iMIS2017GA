<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.ActionPlanTop" Codebehind="ActionPlanTop.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<img src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/32/32_opp_mgmt.gif" alt='<%# Asi.ResourceManager.GetPhrase("ActionPlanEditor","Action Plan Editor") %>' align='absMiddle'>&nbsp;
<asp:label id="lblName" runat="server" width="100%"></asp:label>
