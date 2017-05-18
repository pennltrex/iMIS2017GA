<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EgaDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.EFTGatewayAdmin.EgaDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:UpdatePanel runat="server" ID="UpdatePanel" >
<ContentTemplate>
<fieldset>
<div id="SynchPanel" runat="server">
<h4>Synchronize gateways</h4>    
   
    <asiweb:BusinessTextBox DisplayCaption="True" ID="SynchronizationOrganisationName" runat="server" Caption="Organization name" RenderPanelField="True" Required="True" ToolTip="Your iMIS organization name." />

    <div class="PanelField Left" ID="divButtonSynch" runat="server" >
        <asiweb:StyledButton runat="server" ID="ButtonSyncGateways" Text="Synchronize gateways with DataVault" OnClick="OnSynchGatewaysClick" CausesValidation="false" />
    </div>
    <div class="PanelField Left" ID="divTextSynch" runat="server" >
        <asiweb:BusinessTextBox runat="server" ID="TextSynchGateways" TextMode="MultiLine" Rows="10" Width="90%" ReadOnly="true"/>
    </div>
</div>
</fieldset>
</ContentTemplate>    
</asp:UpdatePanel>

