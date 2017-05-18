<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.WebRoot.AMC.AMCTop1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<table class="TaskTableWithin" cellspacing="0" cellpadding="3" width="100%">
	<tr>
		<td class="TaskBarWithin" align="right" nowrap><asiwc:helpbutton id="btnHelp" runat="server" ImageUrl="~/AsiCommon/Images/3x3.gif" CssClass="ButtonHelp"></asiwc:helpbutton>&nbsp;&nbsp;
		</td>
	</tr>
</table>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>