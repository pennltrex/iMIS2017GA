<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManager.WorkflowResultsDisplay" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WorkflowResultsDisplay.ascx.cs" %>
<asp:placeholder id=ErrorMsgPlaceHolder runat="server"></asp:placeholder>

			<asp:image id="imgNotSubmitted" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/cancel.gif" visible="False" imagealign="AbsMiddle"></asp:image>
			<asp:image id="imgSubmitted" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/question_alert.gif" visible="False" imagealign="AbsMiddle"></asp:image>
			<asp:image id="imgSuccess" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/check.gif" visible="False" imagealign="AbsMiddle"></asp:image>
			<asp:image id="imgError" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/error_alert.gif" visible="False" imagealign="AbsMiddle"></asp:image>
			<asp:hyperlink class="StatusProcess" Font-Underline="true"   id="lnkDisplayStatus"  runat="server"></asp:hyperlink>
			<asp:label cssclass="StatusProcess" id="lblDisplayStatus" runat="server"></asp:label>
