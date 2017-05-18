<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.Competitor" Codebehind="Competitor.ascx.cs" %>



<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div style="text-align:right">
		    <asiweb:StyledButton id="btnDelete" runat="server" OnClick="btnDelete_ServerClick" /> 
		    <asiweb:StyledButton id="btnSave" runat="server" OnClick="btnSave_ServerClick" />
			<asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_ServerClick" />			
</div>
<div>
<asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder>
</div>
