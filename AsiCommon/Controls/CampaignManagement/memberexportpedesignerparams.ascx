<%@ Reference Control="~/asicommon/controls/shared/paramcollector/paramcontrolv2.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.MemberExportPEDesignerParams" Codebehind="MemberExportPEDesignerParams.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<div class="SpacerA"><IMG height="1" src="<% Asi.Web.Utilities.GetTildeExpansion(); %>/AsiCommon/Images/1.gif" width="1"></div>
<asp:PlaceHolder id="ParamCollectorPlaceHolder" runat="server"></asp:PlaceHolder>
