<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenCreditDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OpenCreditDisplay.OpenCreditDisplayDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<div class="PanelField Left">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <asiweb:StyledLabel runat="server" ID="CreditLabel" AssociatedControlID="CreditAmountLabel" CssClass="AutoWidth" />
            </div>
            <div class="PanelFieldValue">
                <asiweb:StyledLabel runat="server" ID="CreditAmountLabel" />
                &nbsp;
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="PanelFieldValue" style="margin-top: -3px;">
        <asiweb:StyledButton runat="server" ID="ApplyButton" Text="Apply" Visible="False" CssClass="PrimaryButton" OnClick="ApplyNowButton_Click" />
        <asiweb:StyledButton runat="server" ID="RemoveOpenCreditButton" Text="Remove" Visible="False" OnClick="RemoveOpenCreditButton_Click" />        
    </div>    
</div>
<div class="PanelField Left">
   <asiweb:StyledLabel Visible="False" runat="server" ID="ErrorText" />
</div>
