<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityActionPlanNote" Codebehind="OpportunityActionPlanNote.ascx.cs" %>

<div class="SpacerA"><img height="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif" width="1" alt="1"/></div>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asiweb:PanelTemplateControl ID="NotesPanel" runat="server" Text="Notes" Collapsed="false" FieldSet="true">
    <div align="right">
		<asiweb:StyledButton id="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_ServerClick"/> 
		<asiweb:StyledButton id="btnContinue" Text="Continue" runat="server" OnClick="btnContinue_ServerClick"/>
	</div>
    <asiweb:PanelTemplateColumn ID="Column1" runat="server">
        <div class="PanelField">
		    <asiweb:BusinessLabel id="lblSubject" runat="server" Text="Subject" />*
		    <asp:textbox id="txtSubject" runat="server"></asp:textbox>&nbsp;<asp:requiredfieldvalidator id="SubjectValidator" runat="server" controltovalidate="txtSubject" errormessage="RequiredFieldValidator"></asp:requiredfieldvalidator>
		</div>
        <div class="PanelField">
		    <asiweb:BusinessLabel id="lblBody" runat="server" Text="Body"/>
		    <asp:textbox id="txtBody" runat="server" textmode="MultiLine" Width="300" Height="200"></asp:textbox>
		</div>
        <div class="PanelField">
		    <asiweb:BusinessLabel id="lblStatus" runat="server" Text="Status"/>
		    <asp:DropDownList ID="ddlNoteStatus" runat="server" />
		</div>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>