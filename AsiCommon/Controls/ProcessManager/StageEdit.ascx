<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.StageEdit" Codebehind="StageEdit.ascx.cs" %>
<%@ Register Src="ActionItemCollectionEdit.ascx" TagName="ActionItemCollection" TagPrefix="ProcessBlueprint" %>

<asiweb:PanelTemplateControl ID="pnlStage" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div style="float:right;">
        <asiweb:StyledImageButton id="btnDelete" runat="server" IconStyle="Remove" AlternateText="Remove" />
        <asiweb:StyledImageButton id="btnUp" runat="server" IconStyle="MoveItemUp" AlternateText="Move Item Up"  />
        <asiweb:StyledImageButton id="btnDown" runat="server" IconStyle="MoveItemDown" AlternateText="Move Item Down" />
    </div>

    <asp:PlaceHolder ID="stagePlaceHolder" runat="server" />
	
    <asp:Panel runat="server" id="ActionItemsTable" style="clear:both; margin:5px;">
            <ProcessBlueprint:ActionItemCollection ID="actionItemCollection"
            StageId='<%# StageId %>'
            runat="server" />
	</asp:Panel>
</asiweb:PanelTemplateControl>