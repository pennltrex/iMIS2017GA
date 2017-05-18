<%@ Page Codebehind="CashAccountDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.CashAccountDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">

            <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="AccountIdTextBox" CssClass="Required" ID="AccountIdLabel" runat="server" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="AccountIdTextBox" MaxLength="10" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="AccountIdTextBox" CssClass="Important" ID="AccountIdValidator" runat="server" SetFocusOnError="True" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="AccountIdTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="AccountIdRegExValidator" runat="server" Text="Invalid character" ValidationExpression="^[a-zA-Z0-9_-]*" />            
                </div>
            </div>  
                       
            <div class="PanelField Left">
                <asiweb:StyledLabel AssociatedControlID="DescriptionTextBox" CssClass="Required" ID="DescriptionLabel" runat="server" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="false" ID="DescriptionTextBox" MaxLength="40" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="DescriptionTextBox" CssClass="Important" ID="DescriptionTextBoxValidator" runat="server" SetFocusOnError="True" Text="Required" />            
                </div>
            </div>  
            
            <div class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="TypeLabel" AssociatedControlID="CashRadioButton" />     
                <asp:Panel ID="CashAccountTypePanel" runat="server" CssClass="PanelFieldValue AutoWidth">
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="true" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="CashRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" />			
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="false" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="CreditCardRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" style="white-space: nowrap;" /> 			
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="false" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="OtherRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" style="white-space: nowrap;" />			
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="false" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="DebitCardRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" style="white-space: nowrap;" />	
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="false" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="ServiceRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" style="white-space: nowrap;" />						
		            <asiweb:StyledRadioButton AutoPostBack="true" CausesValidation="False" Checked="false" DisplayCaption="true" Enabled="true" GroupName="CashAccountType" ID="DirectDebitRadioButton" OnCheckedChanged="CashAccountTypeRadioChanged" PositionCaption="Right" RenderPanelField="true" runat="server" style="white-space: nowrap;" />							
                </asp:Panel>             
            </div>
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="GLAccountDropDownList" RenderPanelField="True" runat="server" /> 
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="EntityDropDownList" RenderPanelField="True" runat="server" /> 
            
            <asp:Panel class="PanelField Left" id="GatewaySelectPanel" runat="server" Visible="False">              
                <asiweb:StyledLabel AssociatedControlID="GatewayDropDownList" ID="GatewayLabel" runat="server" />             
                <div class="PanelFieldValue">
					<asiweb:BusinessDropDownList AutoPostBack="true" CausesValidation="False" CssClass="Section" DisplayCaption="False" ID="GatewayDropDownList" OnSelectedIndexChanged="GatewayDropDownIndexChanged" RenderPanelField="False" Required="False" runat="server" Visible="False" />
					<asiweb:AsiRequiredFieldValidator ControlToValidate="GatewayDropDownList" CssClass="Important" ID="GatewayDropDownListValidator" runat="server" SetFocusOnError="True" Text="Required" />             
                </div>
            </asp:Panel>  
            
            <asiweb:BusinessCheckBox CssClass="FloatLeft" DisplayCaption="True" ID="CSCRequiredWebCheckBox" PositionCaption="Right" RenderPanelField="True" runat="server" Visible="False" />
            
            <asiweb:BusinessCheckBox CssClass="FloatLeft" DisplayCaption="True" ID="CSCRequiredDesktopCheckBox" PositionCaption="Right" RenderPanelField="True" runat="server" Visible="False" />
            
            <asiweb:BusinessCheckBox CssClass="FloatLeft" DisplayCaption="True" ID="IssueNumberRequiredCheckBox" PositionCaption="Right" RenderPanelField="True" runat="server" Visible="False" />           
               
            <asiweb:BusinessCheckBox CssClass="FloatLeft" DisplayCaption="True" ID="IssueDateRequiredCheckBox" PositionCaption="Right" RenderPanelField="True" runat="server" Visible="False" />
            
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script>
    function ShowLoadingPanel() {
        if (!Page_ClientValidate()) return false;
        jQuery("[id$='_LoadingPanel']").show();
        return false;
    }
    </script>
        
</asp:Content> 	    