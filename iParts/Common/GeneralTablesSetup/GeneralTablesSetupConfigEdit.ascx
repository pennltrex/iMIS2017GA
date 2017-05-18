<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralTablesSetupConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.GeneralTablesSetup.GeneralTablesSetupConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
 
 <asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false"
    borderstyle="None">
     <div ID="GenTablesDiv" class="PanelField Left" runat="server">
		<div style="display: inline;">
			<asiweb:StyledLabel runat="server" ID="GenTableName"  AssociatedControlID="GenTableList" Text="General tables to show"></asiweb:StyledLabel>
		</div>
		<div class="PanelFieldValue">
			<asiweb:MultiSelectControl2 ID="GenTableList" Width="22em" NoneSelectedText="Add or select general tables" SkipNoResults="True" runat="server"></asiweb:MultiSelectControl2>
		</div>
	</div>
     
     <div ID="Div1" class="PanelField Left" runat="server">
		<div style="display: inline;">
			<asiweb:StyledLabel runat="server" ID="GenTableNameExclude"  AssociatedControlID="GenTableExcludeList" Text="General tables to exclude"></asiweb:StyledLabel>
		</div>
		<div class="PanelFieldValue">
			<asiweb:MultiSelectControl2 ID="GenTableExcludeList" Width="22em" NoneSelectedText="Add or select general tables" SkipNoResults="True" runat="server"></asiweb:MultiSelectControl2>
		</div>
	</div>

     <div ID="Div2" class="PanelField Left" runat="server">
		<div style="display: inline;">
			<asiweb:StyledLabel runat="server" ID="AddButtonText"  AssociatedControlID="AddButtonTextBox" Text="Add button text"></asiweb:StyledLabel>
		</div>
		<div class="PanelFieldValue">
			<asiweb:BusinessTextBox ID="AddButtonTextBox" Width="22em" SkipNoResults="True" runat="server"></asiweb:BusinessTextBox>
		</div>
	</div>
     
    <div class="AutoWidth">
        <asiweb:SmartControl ID="AddEnabled" runat="server" 
        BoundPropertyName="AddEnabled" DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" /> 
    </div>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DeleteEnabled" runat="server" 
        BoundPropertyName="DeleteEnabled" DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" /> 
    </div>
     </asiweb:paneltemplatecontrol>