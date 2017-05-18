<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ProcessEngine.PERuntime" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="PERuntime.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="PEController" Src="PEController.ascx" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asp:panel id="Panel2" runat="server">
	<uc1:PEController id="PEController1" runat="server"></uc1:PEController>
</asp:panel>
