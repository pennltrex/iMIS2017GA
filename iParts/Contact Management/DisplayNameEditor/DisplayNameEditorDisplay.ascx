<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayNameEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.DisplayNameEditor.DisplayNameEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="DisplayNameEditorDisplayPanel" runat="server">
    
    <div class="AutoWidth">
        <asiweb:BusinessTextBox runat="server" ID="TextName" MaxLength="100" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top"  />
        <asiweb:BusinessLabel runat="server" ID="LabelName" RenderPanelField="true" DisplayCaption="true" Visible="false" PositionCaption="Top" />
    </div>

	<div class="AutoWidth SubItems FloatNone">
		<asiweb:BusinessCheckBox ID="AnonCheckBox" runat="server" RenderPanelField="true" PositionCaption="Right"  />
	</div>

</asp:Panel>
