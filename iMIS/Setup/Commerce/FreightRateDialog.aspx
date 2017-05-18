<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightRateDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FreightRateDialog" MasterPageFile="~/Templates/MasterPages/Empty.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">
            <div ID="ShippingMethodDiv" class="ClearFix PanelField Left" runat="server">
                <asiweb:StyledLabel ID="ShippingMethodLabel" CssClass="InputMedium Required" runat="server" Translate="yes"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="ShippingMethodTextBox" CssClass="InputMedium" RenderPanelField="false" DisplayCaption="false" MaxLength="10" />        
                    <asiweb:BusinessDropDownList runat="server" ID="ShippingMethodDropDown" Required="True"/>
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="ShippingMethodTextBox" CssClass="Important" ID="ShippingRequiredValidator" runat="server" SetFocusOnError="True" Text="Required" />
                </div>
            </div>

            
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="ZoneTextBox" CssClass="Required" ID="ZoneLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="ZoneTextBox" MaxLength="10" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="ZoneTextBox" CssClass="Important" ID="RequiredZoneTextBox" runat="server" SetFocusOnError="True" Text="Required" />
                </div>
            </div>

            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="WeightTextBox" CssClass="Required" ID="WeightLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="WeightTextBox" MaxLength="18" RenderPanelField="false" Required="True" onblur="truncate()" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="WeightTextBox" CssClass="Important" ID="WeightValidator" runat="server" SetFocusOnError="True" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="WeightTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="WeightRegExValidator" runat="server" Text="Invalid decimal value" ValidationExpression="^\d{1,15}(\.\d{1,2})?$" />            
                </div>
            </div>  
                        
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="RateTextBox" CssClass="Required" ID="RateLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="RateTextBox" MaxLength="18" RenderPanelField="false" Required="True" onblur="truncate()" runat="server" onkeypress="enterKeyPress(event);"/>
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="RateTextBox" CssClass="Important" ID="RateValidator" runat="server" SetFocusOnError="True" Text="Required" />
                    <asiweb:AsiRegularExpressionValidator ControlToValidate="RateTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="Invalid character" id="RateRegExValidator" runat="server" Text="Invalid decimal value" ValidationExpression="^\d{1,15}(\.\d{1,2})?$" />            
                </div>
            </div>  

        </asiweb:PanelTemplateControl2>
        
    <script type="text/javascript">

        function truncate() {
            var oSource = window.event.srcElement;
            if (!isNaN(oSource.value) && oSource.value) {
                oSource.value = parseFloat(oSource.value).toFixed(2);;
            }
        }

    </script>

</asp:Content> 	  