<%@ Page Codebehind="TaxAuthorityDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.TaxAuthorityDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">
            
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="TaxAuthorityIdTextBox" CssClass="Required" ID="TaxAuthorityIdLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="TaxAuthorityIdTextBox" MaxLength="10" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="TaxAuthorityIdTextBox" CssClass="Important" ID="TaxAuthorityIdValidator" runat="server" SetFocusOnError="True" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="TaxAuthorityIdTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="TaxAuthorityIdRegExValidator" runat="server" Text="Invalid character" ValidationExpression="^[a-zA-Z0-9_-]*" />            
                </div>
            </div>  
                        
            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="true" ID="DescriptionTextBox" MaxLength="40" RenderPanelField="true" runat="server" />         
                
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="RateTextBox" ID="RateLabel" runat="server" />               
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="RateTextBox" MaxLength="15" RenderPanelField="false" runat="server" />                               
                    <asp:RegularExpressionValidator ControlToValidate="RateTextBox" CssClass="Important" ErrorMessage="Invalid value" ID="RateTextBoxRegex" runat="server" ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" />                            
                </div>
            </div>
            
            <asiweb:BusinessComboBox AllowCustomText="True" CssClass="WideTextBox" DisplayCaption="True" DropDownAutoWidth="Enabled" DropDownCssClass="WideTextBox" id="GLAccountDropDownList" RenderPanelField="True" runat="server" TranslateOnlyCaptionAndToolTip="True" />
           									                                        
            <div class="PanelField Left">            
                <asiweb:StyledLabel AssociatedControlID="OtherAuthority1TextBox" ID="RelatedTaxLabel" runat="server" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="OtherAuthority1TextBox" MaxLength="15" RenderPanelField="false" Required="False" runat="server" />
					<asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="false" ID="OtherAuthority2TextBox" MaxLength="15" RenderPanelField="false" Required="False" runat="server" />
                </div>
            </div> 
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="TaxCategoryDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" /> 
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="VatCountryDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />                         
            
            <asiweb:BusinessCheckBox DisplayCaption="True" ID="RelatedTaxIsTaxableCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" /> 

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