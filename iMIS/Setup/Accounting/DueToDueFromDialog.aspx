<%@ Page Codebehind="DueToDueFromDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.DueToDueFromDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">
            
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="DueFromFinancialEntityDropDownList" CssClass="Required" ID="DueFromFinancialEntityLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList DisplayCaption="True" ID="DueFromFinancialEntityDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" /> 
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="DueFromFinancialEntityDropDownList" CssClass="Important" ID="DueFromFinancialEntityValidator" runat="server" SetFocusOnError="True" Text="Required" />           
                </div>
            </div>  
                        
            <div class="PanelField Left">               
                <asiweb:StyledLabel AssociatedControlID="DueToFinancialEntityDropDownList" CssClass="Required" ID="DueToFinancialEntityLabel" runat="server" />                
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList DisplayCaption="True" ID="DueToFinancialEntityDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" /> 
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="DueToFinancialEntityDropDownList" CssClass="Important" ID="DueToFinancialEntityValidator" runat="server" SetFocusOnError="True" Text="Required" />           
                </div>
            </div>               

            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DueFromAccountDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />            
            
            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DueToAccountDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />            
            
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
