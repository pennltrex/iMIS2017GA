<%@ Page Codebehind="GatewayAccountDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.GatewayAccountDialog" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false" ShowHeader="False">

            <div class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="GatewayLabel" CssClass="Required" AssociatedControlID="GatewayDropDownList" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList AutoPostBack="True" CausesValidation="False" DisplayCaption="False" ID="GatewayDropDownList" RenderPanelField="false" Required="True" runat="server" OnSelectedIndexChanged="GatewayDropDownIndexChanged" TabIndex="1" TranslateOnlyCaptionAndToolTip="True"/> 
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="GatewayDropDownList" CssClass="Important" ID="GatewayDropDownListValidator" runat="server" SetFocusOnError="True" Text="Required" Display="Dynamic"/>             
                </div>
            </div>          
            <div>                      
                <div class="PanelColumn">
                    <asiweb:BusinessDropDownList DisplayCaption="true" ID="AuthorizationModeDropDownList" RenderPanelField="true" runat="server" />                   
                </div>
                <asp:Panel class="PanelColumn" id="SaveCscBeforeAuthCheckBoxDiv" runat="server">
                    <asiweb:BusinessCheckBox DisplayCaption="True" ID="SaveCscBeforeAuthCheckBox" PositionCaption="Right" RenderPanelField="True" runat="server" />
                </asp:Panel>
            </div>                                     
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" translate="yes" Width="30em">          
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="CCAuthAcctCodeTextBox" CssClass="Required" ID="CCAuthAcctCodeLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="false" ID="CCAuthAcctCodeTextBox" MaxLength="20" RenderPanelField="false" Required="True" runat="server" TabIndex="2" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="CCAuthAcctCodeTextBox" CssClass="Important" ID="CCAuthAcctCodeValidator" runat="server" SetFocusOnError="True" Text="Required" />            
                    </div>
                </div>                
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="CCAuthAdminEmailTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="4" />   
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="CCAuthURLTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="6" />   
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthVerisignVendorTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="8"/>   
                
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthPasswordTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TextMode="Password" TabIndex="10"/>   
                <asp:CompareValidator ControlToCompare="CCAuthPasswordTextBox" ControlToValidate="VerifyCCAuthPasswordTextBox" CssClass="MarginLeft" Display="Dynamic" ErrorMessage="Verify for password does not match" id="CCAuthPasswordTextBoxCompareValidator" runat="server" />                 
                
                <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="CCAuthTimeoutTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="12" />   
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthVerisignProxyUserTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="14"/>   
                <div style="clear: both;">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthVerisignProxyPasswordTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TextMode="Password" TabIndex="16"/>                                                 
                    <asp:CompareValidator ControlToCompare="CCAuthVerisignProxyPasswordTextBox" ControlToValidate="VerifyCCAuthVerisignProxyPasswordTextBox" CssClass="MarginLeft" Display="Dynamic" ErrorMessage="Verify for proxy server password does not match" id="CCAuthVerisignProxyPasswordTextBoxCompareValidator" runat="server" />                        
                </div>
            </asiweb:PanelTemplateColumn>

            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2"  runat="server" translate="yes">          	
                <div class="PanelField Left">
                    <asiweb:StyledLabel AssociatedControlID="CCAuthAcctDescriptionTextBox" CssClass="Required" ID="CCAuthAcctDescriptionLabel" runat="server" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="false" ID="CCAuthAcctDescriptionTextBox" MaxLength="255" RenderPanelField="false" Required="True" runat="server" TabIndex="3" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="CCAuthAcctDescriptionTextBox" CssClass="Important" ID="CCAuthAcctDescriptionTextBoxValidator" runat="server" SetFocusOnError="True" Text="Required" />            
                    </div>
                </div>                  
                
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthVerisignPartner" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="5" />   
                <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="CCAuthPortTextBox" PositionCaption="Left" RenderPanelField="True" runat="server" TabIndex="7" />   
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthUserTextBox" PositionCaption="Left" RenderPanelField="True" runat="server" TabIndex="9" />                  
                
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="VerifyCCAuthPasswordTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="True" runat="server" TabIndex="11" TextMode="Password" />   
                <asp:CompareValidator ControlToCompare="VerifyCCAuthPasswordTextBox" ControlToValidate="CCAuthPasswordTextBox" CssClass="MarginLeft" Display="Dynamic" ErrorMessage="Password does not match" id="CCAuthPasswordCompareValidator" runat="server" />                                               
                
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="CCAuthVerisignProxyServerTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" TabIndex="13" />   
                <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="CCAuthVerisignProxyPortTextBox" PositionCaption="Left" RenderPanelField="True" runat="server" TabIndex="15" />                   
                
                <div style="clear: both;">
                    <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="VerifyCCAuthVerisignProxyPasswordTextBox" MaxLength="255" RenderPanelField="True" runat="server" TextMode="Password" TabIndex="17" />                 
                    <asp:CompareValidator ControlToCompare="VerifyCCAuthVerisignProxyPasswordTextBox" ControlToValidate="CCAuthVerisignProxyPasswordTextBox" CssClass="MarginLeft" Display="Dynamic" ErrorMessage="Proxy server password does not match" id="CCAuthVerisignProxyPasswordCompareValidator" runat="server" />  
                </div>      
            </asiweb:PanelTemplateColumn>              
               
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script>
    function ShowLoadingPanel() {
        if (!Page_ClientValidate()) return false;
            jQuery("[id$='_LoadingPanel']").show();
        return false;
    }
    Sys.Application.add_load(function () {
        var ddl = jQuery('#<%=AuthorizationModeDropDownList.ClientID%>');
        var div = jQuery('#<%= SaveCscBeforeAuthCheckBoxDiv.ClientID %>');
        var cb = jQuery('#<%= SaveCscBeforeAuthCheckBox.ClientID %>');
        ddl.change(function() {
            var selected = $get('<%= AuthorizationModeDropDownList.ClientID %> :selected');            
            cb.attr('checked', false);
            div.hide();
            if (selected.value === "3") {
                div.show();
            }
        });            
    });
    </script>
        
</asp:Content> 	    