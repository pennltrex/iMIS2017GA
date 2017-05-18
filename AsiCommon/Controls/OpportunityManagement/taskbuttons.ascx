<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />
<div>  
    <div class="CommandBar">
	    <asiweb:StyledButton runat="server" id="btnNew" CausesValidation="false" onclick="btnNew_ServerClick" />
	    <asiweb:StyledButton runat="server" id="btnClose" CausesValidation="false" />
    </div>
</div>
