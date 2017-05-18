<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentationJobQuery" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="JobNselect.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<div class="CommandBar">
    <asiweb:StyledButton ID="btnCreateNSelectSegments" runat="server" />
	<asiweb:StyledButton ID="btnClearNSelectSegments" runat="server" />
</div>
<div class="PanelField">
    <div class="PanelFieldLabel">
        <asiweb:StyledLabel ID="lblNumSegments" runat="server" AssociatedControlID="txtNumSegments" />
    </div>
    <div class="PanelFieldValue AutoWidth FloatNone">
        <asiweb:BusinessTextBox ID="txtNumSegments" runat="server" />
        <asiweb:BusinessCheckBox ID="cboFullUsage" runat="server" AutoPostBack="true" />
    </div>
</div>
<asiweb:BusinessTextBox ID="ContactsPerSegment" runat="server" RenderPanelField="true" DisplayCaption="true" />