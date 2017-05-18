<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightQuantityDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FreightQuantityDialog" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">
            
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="TotalQuantityRangeTextBox" CssClass="Required" ID="TotalQuantityRangeLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="TotalQuantityRangeTextBox" MaxLength="18" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="TotalQuantityRangeTextBox" CssClass="Important" ID="TotalQuantityRangeValidator" runat="server" SetFocusOnError="True" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="TotalQuantityRangeTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="TotalQuantityRangeRegExValidator" runat="server" Text="Invalid decimal value" ValidationExpression="^\d{1,15}(\.\d{1,2})?$" />            
                </div>
            </div>  
                        
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="RateTextBox" CssClass="Required" ID="RateLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="RateTextBox" MaxLength="18" RenderPanelField="false" Required="True" runat="server" onkeypress="enterKeyPress(event);"/>
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="RateTextBox" CssClass="Important" ID="RateValidator" runat="server" SetFocusOnError="true" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="RateTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="RateRegExValidator" runat="server" Text="Invalid decimal value" ValidationExpression="^\d{1,15}(\.\d{1,2})?$" />            
                </div>
            </div>  

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