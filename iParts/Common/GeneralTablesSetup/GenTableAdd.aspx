<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenTableAdd.aspx.cs" Inherits="Asi.Web.iParts.Common.GeneralTablesSetup.GenTableAdd" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody" translate="yes">
    <asiweb:PanelTemplateControl2 runat="server" ShowHeader="False" ShowBorder="False">
        <div ID="NewTable" class="ClearFix ShowFieldset ShowLegend" runat="server">
            <div ID="GenTablesTextBox" class="PanelField Left" runat="server">
		        <div style="display: inline;">
			        <asiweb:StyledLabel runat="server" ID="TableNameLabel" CssClass="Required" AssociatedControlID="TableName" Text="Table name"></asiweb:StyledLabel>
		        </div>
		        <div class="PanelFieldValue">
			        <asiweb:BusinessTextBox runat="server" ID="TableName" MaxLength="30" />
			        <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="TableName" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
		        </div>
	        </div>

            <div ID="GenTablesDropDown" class="ClearFix PanelField Left" runat="server">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel ID="GenTablesListLabel" AssociatedControlID="GenTablesList" runat="server" Text="General tables" Translate="yes"></asiweb:StyledLabel>
                </div> 
                <div class="PanelFieldValue">           
                    <asiweb:BusinessDropDownList runat="server" ID="GenTablesList"/>
                </div>
            </div>

            <fieldset style="margin-bottom: 0.375em;">
                <legend>
                    <asiweb:StyledLabel runat="server" ID="FieldSetLegend" Text="Row"></asiweb:StyledLabel>
                </legend>
                
                <div class="PanelField Left" runat="server">
		            <div style="display: inline;">
			            <asiweb:StyledLabel runat="server" ID="CodeLabel" AssociatedControlID="Code" Text="Code"></asiweb:StyledLabel>
		            </div>
		            <div class="PanelFieldValue">
			            <asiweb:BusinessTextBox runat="server" ID="Code" MaxLength="60" onkeypress="enterKeyPress(event);"/>
		            </div>
	            </div>
    
                <div class="PanelField Left" runat="server">
		            <div style="display: inline;">
			            <asiweb:StyledLabel runat="server" ID="DescriptionLabel"  AssociatedControlID="Description" Text="Description"></asiweb:StyledLabel>
		            </div>
		            <div class="PanelFieldValue">
			            <asiweb:BusinessTextBox runat="server" ID="Description" MaxLength="255" onkeypress="enterKeyPress(event);"/>
            
		            </div>
	            </div>
                
                <div class="PanelField Left" runat="server">
		            <div style="display: inline;">
			            <asiweb:StyledLabel runat="server" ID="ExpansionLabel"  AssociatedControlID="Expansion" Text="Expansion"></asiweb:StyledLabel>
		            </div>
		            <div class="PanelFieldValue">
			            <asiweb:BusinessTextBox runat="server" ID="Expansion" MaxLength="255" onkeypress="enterKeyPress(event);"/>
            
		            </div>
	            </div>
            </fieldset>

        </div>
    </asiweb:PanelTemplateControl2>
</asp:Content>