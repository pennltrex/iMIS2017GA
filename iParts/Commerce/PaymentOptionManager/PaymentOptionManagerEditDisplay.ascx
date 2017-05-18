<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentOptionManagerEditDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PaymentOptionManager.PaymentOptionManagerEditDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="PaymentCreator" Src="~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="AutoPayAddressSelector" Src="~/iParts/Commerce/AutoPayEnrollments/AutoPayAddressSelector.ascx" %>

<asiweb:PanelTemplateControl2 ID="DetailedEnrollmentTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="True">
    <h2><asiweb:StyledLabel runat="server" id="LabelPageTitle" Text="Edit payment option"></asiweb:StyledLabel></h2>
    <uc1:PaymentCreator ID="PaymentCreator1" runat="server" />
<asp:UpdatePanel ID="UpdatePanelAutoPayAddressSelector" runat="server">
            <ContentTemplate>
                <fieldset>
    <uc2:AutoPayAddressSelector ID="AutoPayAddressSelector" runat="server"/>
               </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
</asiweb:PanelTemplateControl2>