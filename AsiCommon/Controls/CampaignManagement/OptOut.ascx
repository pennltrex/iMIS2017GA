<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.Appeal1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="OptOut.ascx.cs" %>
<asiweb:ParameterList setbefore="true" method="add" id="AtomPanel_ParameterList_0" runat="server"  />
<asiweb:ParameterList missingparams="default" id="AtomPanel_ParameterList_1" runat="server" >
<asiweb:Parameter name="ActionPlanKey" type="Request" operation="Equal" value="iKey" id="AtomPanel_ParameterList_1_Parameter_0" runat="server" />
</asiweb:ParameterList>
<asiweb:PanelTemplateControl runat="server" ID="MainPanel">
 Email Address <%#Request["iToEmail"]%> opted out.
</asiweb:PanelTemplateControl>
