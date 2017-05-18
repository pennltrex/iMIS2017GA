<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductLocationDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.ProductLocationDialog" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">
            
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="LocationCodeTextBox" CssClass="Required" ID="LocationCodeLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="LocationCodeTextBox" MaxLength="18" RenderPanelField="false" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="LocationCodeTextBox" CssClass="Important" ID="LocationCodeValidator" runat="server" SetFocusOnError="True" Text="Required" />
                </div>
            </div>  
                        
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="DescriptionTextBox" ID="DescriptionLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="DescriptionTextBox" MaxLength="18" RenderPanelField="false" runat="server" onkeypress="enterKeyPress(event);"/>
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