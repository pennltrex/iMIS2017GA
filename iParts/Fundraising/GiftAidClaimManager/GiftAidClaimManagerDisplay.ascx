<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="GiftAidClaimManagerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidClaimManager.GiftAidClaimManagerDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 
<telerik:RadAjaxPanel ID="radAjaxPanel1" runat="server" LoadingPanelID="radAjaxLoadingPanel1" >
    
    <asp:Panel runat="server" ID="ReviewClaimsPanel">
        <div class="Section">
            <div class="PanelField">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="ClaimReferenceLabel" CssClass="Required" AssociatedControlID="ClaimReference" Text="Claim Reference"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="ClaimReference" MaxLength="20" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="ClaimReference" Display="Dynamic" SetFocusOnError="true"/>
                </div>
            </div>
            <asiweb:BusinessCalendar runat="server" ID="GiftsFrom" Caption="Gifts from" RenderPanelField="true" DisplayCaption="True"/>
            <asiweb:BusinessCalendar runat="server" ID="GiftsTo" Caption="Gifts to" RenderPanelField="true" DisplayCaption="True"/>
                
            <div style="display: inline;">
                <asiweb:StyledButton runat="server" ID="GenerateClaim" Text="Generate Claim" OnClick="GenerateClaim_OnClick"/>
                <asiweb:StyledButton runat="server" ID="StatusCheck" Text="Check for Status Updates" OnClick="StatusCheck_OnClick" CausesValidation="false"/>
             </div>
        </div>
        <asiweb:StyledLabel runat="server" ID="InfoMessage" Text="Please review and submit claim below" Visible="false" CssClass="Info" />

        <h3>Review Claims</h3>

        <asiweb:Lister2 runat="server" ID="ClaimsGrid" 
            ExportButtonLocation="None" SelectColumnLocation="Beginning" SelectColumnText="Review" TargetUrlKeyParameterName="GiftAidClaimId" 
            DeleteColumnText="Delete" DeleteColumnLocation="End" EnableClientSideDelete="false" DataSourceDocumentKey="29CAAAFB-81D2-4C79-A5C5-370F15EB52BE"
            DataKeyNames="key_GiftAidClaimKey" OnItemDeleted="ClaimsGridOnItemDeleted" OnItemDataBound="ClaimsGridOnItemDataBound" 
            LinkTargetBehavior="SameWindow" DisableQueryEdit="true" />
    </asp:Panel>

    <asp:Panel runat="server" ID="ClaimDetailsPanel" Visible="False">
        <div class="ClearFix">
            <h3 class="FloatLeft">Claim Details</h3>
            <div class="FloatRight"><asiweb:StyledHyperlink runat="server" ID="ReturnLink" Text="Return to Claim List" /></div>
        </div>
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" CssClass="Section" Collapsible="False" ShowHeader="False">
            <div class="col-xs-4">
                <asiweb:StyledLabel runat="server" ID="ClaimReferenceReadOnly" RenderPanelField="True" DisplayCaption="True" Caption="Claim Reference" />
                <asiweb:StyledLabel runat="server" ID="ClaimStatus" RenderPanelField="True" DisplayCaption="True" Caption="Claim Status" />
                <asiweb:StyledLabel runat="server" ID="NumberOfTransactions" RenderPanelField="True" DisplayCaption="True" Caption="Number of Transactions" />
                <asiweb:StyledButton runat="server" ID="SubmitButton" Enabled="False" Text="Submit claim" OnClick="SubmitButton_OnClick" /> 
            </div>
            <div class="col-xs-8">
                <asiweb:StyledLabel runat="server" ID="ClaimDate" RenderPanelField="True" DisplayCaption="True" Caption="Date Submitted" />
                <asiweb:StyledLabel runat="server" ID="CorrelationId" RenderPanelField="True" DisplayCaption="True" Caption="Correlation Id" />
                <asiweb:StyledLabel runat="server" ID="ResponseText" RenderPanelField="True" DisplayCaption="True" Caption="Response" />
                <asiweb:StyledLabel runat="server" ID="ErrorMessage" RenderPanelField="True" DisplayCaption="True" Caption="Error" Visible="False" />
            </div>
        </asiweb:PanelTemplateControl2>

        <asiweb:Lister2 runat="server" ID="ReviewGrid"  CollapsiblePanelTemplate="False" EnableViewState="true"
            ExportButtonLocation="None" DisableQueryEdit="true" HideResultsOnInitialLoad="Visible" 
            DataKeyNames="key_GiftAidClaimDetailKey" DataSourceDocumentKey="AD6BE69C-AA87-426B-B0A3-D8CDE476A52A"
            DeleteColumnText="Remove" DeleteConfirmText="Are you sure you wish to remove this item?" EnableClientSideDelete="False" DeleteColumnLocation="End" LinkTargetBehavior="SameWindow" />
    </asp:Panel>

</telerik:RadAjaxPanel>
