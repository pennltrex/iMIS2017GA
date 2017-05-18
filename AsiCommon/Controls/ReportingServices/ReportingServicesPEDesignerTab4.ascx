<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPEDesignerTab4" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPEDesignerTab4.ascx.cs" %>
<%@ Reference VirtualPath="../../Controls/Shared/ParamCollector/ParamControlV2.ascx" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<asp:CheckBox id="chkRuntime" runat="server" Text="Show parameters at runtime"></asp:CheckBox>

<asp:PlaceHolder id="ParamCollectorPlaceHolder" runat="server"></asp:PlaceHolder>