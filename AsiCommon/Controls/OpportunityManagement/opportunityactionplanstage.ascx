<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityActionPlanStage" Codebehind="OpportunityActionPlanStage.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div class="StageBlock">
    <div class="StageHeader">
        <img width="16" height="16" alt="expand" id="toggleImage" runat="server" />
	    <span class="StageTab" id="StageTab" runat="server">
	        <asp:label id="lblNameValue" runat="server"/>
	    </span>
    </div>
    <asp:panel id="pnlStagePanel" cssclass="StagePanel" style="display:block" runat="server">
        <div class="PanelField Left">
            <div class="PanelFieldLabel"><asp:label id="lblStatus" runat="server" AssociatedControlID="lblStatusValue" /></div>
            <div class="PanelFieldValue"><asp:label id="lblStatusValue" runat="server"/></div>
        </div>
        <div class="PanelField Left">
            <div class="PanelFieldLabel"><asp:label id="lblBeginDate" runat="server" AssociatedControlID="lblBeginDateValue" /></div>
            <div class="PanelFieldValue">
                <asp:label id="lblBeginDateValue" runat="server"/>
                <asiweb:StyledButton ID="btnNewTask" runat="server" enabled="false"/>
            </div>
        </div>
        <div class="PanelField Left">
            <div class="PanelFieldLabel"><asp:label id="lblCompletedDate" runat="server" AssociatedControlID="lblCompletedDateValue" /></div>
            <div class="PanelFieldValue"><asp:label id="lblCompletedDateValue" runat="server"/></div>
        </div>
        <div class="PanelField Top">
            <div class="PanelFieldLabel"><asp:label id="lblDescription" runat="server" AssociatedControlID="lblDescriptionValue" /></div>
            <div class="PanelFieldValue"><asp:label id="lblDescriptionValue" runat="server"/></div>
        </div>
		<table class="Grid" width="99%" border="0" cellpadding="1" cellspacing="0" style="clear:both">
			<tr class="GridHeader">
				<th style="WIDTH: 2%;">&nbsp;</th>
				<th style="WIDTH: 38%;"><asp:label id="lblActionItemTitle" runat="server"/></th>
				<th style="WIDTH: 20%;"><asp:label id="lblStartDate" runat="server"/></th>
				<th style="WIDTH: 20%;"><asp:label id="lblDueDate" runat="server"/></th>
				<th style="WIDTH: 20%;"><asp:label id="lblActionItemStatus" runat="server"/></th>
			</tr>
			<tr><td colspan="5"><strong><asp:label id="lblTasks" runat="server"/></strong></td></tr>
			<asp:placeholder id="TaskRowPlaceHolder" runat="server"/>
			<tr><td colspan="5"><strong><asp:label id="lblNotes" runat="server"/></strong></td></tr>
			<asp:placeholder id="NoteRowPlaceHolder" runat="server"/>
			<tr><td colspan="5"><strong><asp:label id="lblEmail" runat="server"/></strong></td></tr>
			<asp:placeholder id="EmailRowPlaceHolder" runat="server"/>
		</table>
    </asp:panel>
</div>
