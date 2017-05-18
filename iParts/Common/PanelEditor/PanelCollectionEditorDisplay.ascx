<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelCollectionEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelCollectionEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagName="PanelEditorDisplay" TagPrefix="PanelEditorDisplay" Src="PanelEditorDisplay.ascx" %>

<asp:Label ID="designMode" runat="server" Visible="false" CssClass="Information" />
<div id="Panel1" runat="server" translate="yes">
	<div id="PanelCollectionEditorAnchor" clientidmode="Inherit" runat="server" visible="False"></div>
	<telerik:RadTabStrip ID="tabStrip" SelectedIndex="0" ScrollChildren="false"
		runat="server" MultiPageID="multiplePage" Orientation="HorizontalTop" ScrollPosition="0" ScrollButtonsPosition="Middle"
		PerTabScrolling="true" CausesValidation="false" OnTabClick="TabStripTabClick" ShowBaseLine="true" Style="position: relative;">
	</telerik:RadTabStrip>

	<telerik:RadMultiPage ID="multiplePage" data-multipage="yes" runat="server" SelectedIndex="0" ScrollBars="Auto" CssClass="ContentTabbedDisplay" />
</div>
<script type="text/javascript">
	jQuery(document).ready(
		function () {
			if (jQuery("#<%#PanelCollectionEditorAnchor.ClientID%>").length) {
				jQuery('html,body')
					.animate({
						scrollTop: jQuery("#<%#PanelCollectionEditorAnchor.ClientID%>").offset().top
					}, 10);
				jQuery("#<%#PanelCollectionEditorAnchor.ClientID%>").remove();
			}
		});
</script>
