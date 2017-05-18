<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoicePaymentLinkConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.InvoicePaymentLink.InvoicePaymentLinkConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">               
    <asiweb:SmartControl 
        ID="LinkText" runat="server" BoundPropertyName="LinkText" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />

    <asiweb:SmartControl 
        ID="CancelLinkText" runat="server" BoundPropertyName="CancelLinkText" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />

    <asiweb:SmartControl 
        ID="InvoiceLegend" runat="server" BoundPropertyName="InvoiceLegend" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl 
        ID="AutoPayInvoiceLegend" runat="server" BoundPropertyName="AutoPayInvoiceLegend" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper"/>

    <asiweb:SmartControl 
        ID="InvoicePurposeCaption" runat="server" BoundPropertyName="InvoicePurposeCaption" DisplayType="Caption" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" CssClass="Label"  />        
    <div class="SubItems AutoWidth">
        <asiweb:SmartControl 
            ID="InvoicePurposeStandard" runat="server" BoundPropertyName="InvoicePurposeStandard" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="InvoicePurposeRenewal" runat="server" BoundPropertyName="InvoicePurposeRenewal" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    
    <asp:Panel class="ClearFix form-inline" id="FinancialEntitySection" runat="server">
        <asiweb:SmartControl runat="server" ID="FilterByFinancialEntity" BoundPropertyName="FilterByFinancialEntity" DisplayCaption="True"
            PositionCaption="Right" DataSaveUponStateChange="False" AutoPostBack="True" />
        <asiweb:StyledLabel runat="server" ID="FinancialEntityLabel" BoundPropertyName="SelectedFinancialEntity" CssClass="screen-reader-text" 
            RenderPanelField="False" AssociatedControlID="FinancialEntitySelect" />
        <asiweb:SmartControl runat="server" ID ="FinancialEntitySelect" BoundPropertyName="SelectedFinancialEntity" DisplayCaption="False"
            DataSaveUponStateChange="False" />
    </asp:Panel>

    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayOption" runat="server" BoundPropertyName="DisplayOption" DisplayCaption="true" 
            PositionCaption="Top" DataSaveUponStateChange="false" AutoPostBack="true" InputFieldCssClass="SubItems" />       
        <div class="SubItems">
            <asiweb:SmartControl ID="NoOpenInvoice" runat="server" BoundPropertyName="NoOpenInvoice" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
        </div> 
    </div>
    
    <asiweb:BusinessCheckBox DisplayCaption="True" id="EnableJoinButton" BoundPropertyName="EnableJoinButton" AutoPostBack="True" PositionCaption="Right" OnCheckedChanged="EnableJoin_OnCheckChanged" RenderPanelField="true" runat="server" />
    <div ID="EnableJoinSection" runat="server" class="ShowFieldset AddPadding" style="width:750px;">
        <fieldset>
            <legend>
                <span class="SectionLabel"><%#GetTranslatedPhrase("Join options")%></span>             
            </legend>
            
            <asiweb:BusinessCheckBox id="JoinDisplayToStaffOnly" BoundPropertyName="JoinDisplayToStaffOnly" DisplayCaption="True" AutoPostBack="True" PositionCaption="Right" 
                OnCheckedChanged="JoinDisplayToStaffOnly_OnCheckChanged" RenderPanelField="true" runat="server" />
            
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="StyledLabel1" Text='<%# ResourceManager.GetPhrase("Button text", "Button text")%>' 
                        CssClass="Required" AssociatedControlID="JoinButtonText"></asiweb:StyledLabel> 
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="JoinButtonText" BoundPropertyName="JoinButtonText" DisplayCaption="False" PositionCaption="Left" RenderPanelField="False" runat="server" CssClass="InputMediumWrapper" />
                </div>
                <asp:RequiredFieldValidator id="JoinButtonTextValidator" ControlToValidate="JoinButtonText" CssClass="Error FloatLeft" ErrorMessage='<%# ResourceManager.GetPhrase("Required", "Required")%>' runat="server" />
            </div>

            <asiweb:BusinessTextBox ID="JoinButtonMessage" BoundPropertyName="JoinButtonMessage" DisplayCaption="True" PositionCaption="Left" RenderPanelField="true" runat="server" CssClass="InputXLarge" />
            
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LinkTargetLabel" Text='<%# ResourceManager.GetPhrase("Content or URL to link to", "Content or URL to link to")%>' 
                        CssClass="Required" AssociatedControlID="JoinContentOrUrl"></asiweb:StyledLabel> 
                </div>
                <div class="PanelFieldValue InputMediumWrapper">               
                    <asiweb:BusinessDocumentBrowserControl ID="JoinContentOrUrl" runat="server" BoundPropertyName="JoinContentOrUrl" DisplayCaption="False" 
                        Wrap="False" DataSaveUponStateChange="False" RenderPanelField="False" PositionCaption="Left" RootFolder="@/" InputFieldCssClass="InputMediumWrapper"/>
                </div>   
                
                <asiweb:InfoControl ID="EnableJoinButtonHelpInfo" CssClass="FloatLeft" runat="server" Visible="False" Translate="no"/>  
                <asp:RequiredFieldValidator id="JoinContentOrUrlValidation" CssClass="Error FloatLeft" ErrorMessage='<%# ResourceManager.GetPhrase("Required", "Required")%>' runat="server" />
            </div>
            
        </fieldset>
    </div>
    
    <asiweb:BusinessCheckBox DisplayCaption="True" id="EnableRenewInAdvanceCheckbox" BoundPropertyName="EnableRenewInAdvanceCheckbox" AutoPostBack="True" PositionCaption="Right" OnCheckedChanged="EnableRenewInAdvance_OnCheckChanged" RenderPanelField="true" runat="server" />
    <div id="EnableRenewInAdvanceSection" runat="server" class="ShowFieldset" style="width:750px;">
        <fieldset>
            <legend>
                <span class="SectionLabel"><%#GetTranslatedPhrase("Renew in advance options")%></span>             
            </legend>
            
            <asiweb:StyledLabel runat="server" ID="EnableRenewInAdvanceInfoMessage" BoundPropertyName="EnableRenewInAdvanceInfoMessage" RenderPanelField="False" />
            
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="EnableRenewInAdvanceButtonTextLabel" Text='<%# ResourceManager.GetPhrase("Button text", "Button text")%>' CssClass="Required" 
                        AssociatedControlID="EnableRenewInAdvanceButtonText"></asiweb:StyledLabel> 
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="EnableRenewInAdvanceButtonText" BoundPropertyName="EnableRenewInAdvanceButtonText" PositionCaption="Left" runat="server" CssClass="InputMediumWrapper" />
                </div>
                <asp:RequiredFieldValidator id="EnableRenewInAdvanceButtonTextValidator" ControlToValidate="EnableRenewInAdvanceButtonText" CssClass="Error FloatLeft" 
                    ErrorMessage='<%# ResourceManager.GetPhrase("Required", "Required")%>' runat="server" />
            </div>
            
            <asiweb:BusinessTextBox ID="EnableRenewInAdvanceMessageText" BoundPropertyName="EnableRenewInAdvanceMessageText" DisplayCaption="True" PositionCaption="Left" RenderPanelField="true" runat="server" CssClass="InputXLarge" />  
        </fieldset>
    </div>
    
    <script type="text/javascript">
        //<![CDATA[
        
        //]]>
    </script>
</asiweb:paneltemplatecontrol>