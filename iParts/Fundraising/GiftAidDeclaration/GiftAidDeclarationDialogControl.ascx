<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidDeclarationDialogControl.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.GiftAidDeclarationDialogControl" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true" CssClass="Section">

<div id="GiftAidStaffControls" runat="server" >
    <div  id="GiftAidStatus" runat="server">
            <asiweb:StyledLabel runat="server" ID="Status" Text="Status2" Caption="Status"  RenderPanelField="True" DisplayCaption="True" />
    </div>

    <div class="PanelField Left" id="GiftAidMethod" >
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="MethodOfDeclarationLabel" Text="Gift Aid declaration method" AssociatedControlID="MethodOfDeclaration" CssClass="Required"/>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="MethodOfDeclaration" DisplayCaption="False" Caption="" RenderPanelField="true" Required="true" EnableViewState="True"></asiweb:BusinessDropDownList>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="MethodOfDeclarationRequired" ControlToValidate="MethodOfDeclaration"
                                    CssClass="Important" Display="Dynamic"></asiweb:AsiRequiredFieldValidator>
        </div>
    </div>
    
    <div class="PanelField Left" >
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="DeclarationCoversLabel" Text="Include this gift and"  AssociatedControlID="Covers" />
        </div>
        <div class="PanelFieldValue" runat="server" id="IncludesPanel">
            <asiweb:BusinessCheckBoxList runat="server" ID="Covers" DisplayCaption="False" Caption="" RenderPanelField="true" RepeatDirection="Horizontal" EnableViewState="True" >
            </asiweb:BusinessCheckBoxList>
        </div>
    </div>

        <div class="PanelField Left" >
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel runat="server" ID="DeclarationReceived" Text="Declaration received" AssociatedControlID="DeclarationReceivedDate"  />
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessCalendar2 runat="server" ID="DeclarationReceivedDate" DisplayCaption="False" Caption="" RenderPanelField="true"></asiweb:BusinessCalendar2>
            </div>
        </div>

    <div id="ExtraProfileOptions" runat="server">
        <div class="PanelField Left" >
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel runat="server" ID="CancelledLabel" Text="Declaration cancelled" AssociatedControlID="CancelledDate" />
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessCalendar2 runat="server" ID="CancelledDate" DisplayCaption="False" Caption="" RenderPanelField="true"></asiweb:BusinessCalendar2>
            </div>
        </div>
    </div>
    <div class="PanelField Left" >
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="ConfirmationDateLabel" Text="Confirmation letter sent" AssociatedControlID="ConfirmationDate" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessCalendar2 runat="server" ID="ConfirmationDate" DisplayCaption="False" Caption="" RenderPanelField="true"></asiweb:BusinessCalendar2>
        </div>
    </div>
    
    <div class="PanelField Left" >
        <asiweb:BusinessLabel ID="LabelFullAddress" runat="server" translate="no" Caption="Address" RenderPanelField="True" DisplayCaption="True" Visible="False" />
    </div>
</div>
</asp:Panel>

