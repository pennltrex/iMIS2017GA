<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FriendraisingSettingsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.FriendraisingSettings.FriendraisingSettingsDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />

<style type="text/css">

.PanelColumn
{
	width:100%;
}

</style>    
    <div>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:ValidationSummary ID="validationSummaryControl" runat="server" CssClass="Error" />
                <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="Error"></asp:Label>                        
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <asiweb:PanelTemplateControl ID="FriendraisingSettings" runat="server" FieldSet="true" ShowHeader="true" Collapsible="false"  Text="FriendraisingSettings"  >
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3" runat="server" LabelWidth="19em" >
            <asiweb:BusinessCheckBox runat="server" RenderPanelField="true" ID="UpdateParty" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessCheckBox runat="server" RenderPanelField="true" ID="IgnoreImportedOnetimeOffline" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="ServiceUrl" DisplayCaption="true" PositionCaption="Left" Width="35em" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="OrganizationId" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="UserName" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="UserPassword" DisplayCaption="true" PositionCaption="Left" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
    
    <asiweb:PanelTemplateControl ID="iMISSettings" runat="server" FieldSet="true" ShowHeader="true"  Collapsible="false"  Text="iMISSettings"  >
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="19em" >
            <div class="PanelField Left">
                <div style="display: inline">
                    <asiweb:StyledLabel runat="server" ID="PaymentMethodLabel" AssociatedControlID="PaymentMethod" CssClass="Required" ></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="PaymentMethod" DisplayCaption="false"  />
                    <asiweb:AsiRequiredFieldValidator ID="PaymentMethodRequiredFieldValidator" ControlToValidate="PaymentMethod" runat="server"  />
                </div>
            </div>
                    
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="HomeAddress" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="HomePhone" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="HomeEmailAddress" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="WorkAddress" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="WorkPhone" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="WorkEmailAddress" DisplayCaption="true" PositionCaption="Left" />
            <asiweb:BusinessTextBox runat="server" RenderPanelField="true" ID="MobilePhone" DisplayCaption="true" PositionCaption="Left" />        
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>

</asp:Panel>       
