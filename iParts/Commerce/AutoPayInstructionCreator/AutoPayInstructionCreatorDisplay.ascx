<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayInstructionCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayInstructionCreator.AutoPayInstructionCreatorDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="Yes">
    <asp:HiddenField ID="existingToken" runat="server" Value="" />
    <asp:Label ID="errorLabel" runat="server" CssClass="Error" />
    <div class="PanelField">
        <div class="PanelFieldValue">
            <asp:Label ID="autoPayMessage" runat="server"></asp:Label>
        </div>
    </div>
    <div class="PanelFieldValue AutoWidth FloatNone">
        <div class="AutoWidth">
            <asp:RadioButtonList ID="RecurringPaymentOptions" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" TextAlign="Right"/>
        </div>
    </div>
</asp:Panel>
