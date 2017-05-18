<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.EventsSetup" Codebehind="Setup.aspx.cs" %>
<%@ Import Namespace="Asi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" >
    
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">
                             
            <div class="SectionLabel Section"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("Events.Setup.AdditionalFields", "Additional fields for staff use")) %></div>  
            <div class="AddPaddingHorizontal Section">
                <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" LabelWidth="3em" runat="server" translate="yes" Width="20em">
            		                               
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro1TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro2TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro3TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro4TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro5TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />
     	                     
                </asiweb:PanelTemplateColumn>

                <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" LabelWidth="3em" runat="server" translate="yes">
                
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro6TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro7TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro8TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro9TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="MUFPro10TextBox" MaxLength="15" PositionCaption="Left" RenderPanelField="true" runat="server" />                        
                
                </asiweb:PanelTemplateColumn>              
            </div>
                   
            <div class="SectionLabel Section"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("Events.Setup.ActivityFields", "Activity fields")) %></div>        
            <div class="AddPaddingHorizontal">
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF1TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF2TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF3TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF4TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF5TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF6TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ActivityUF7TextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />   
            </div>                
    
        </asiweb:PanelTemplateControl2>
        
    </telerik:RadAjaxPanel>
    
 <script type="text/javascript">
    //<![CDATA[
        function ShowLoadingPanel() {
            jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
    //]]>
    </script>
</asp:Content> 