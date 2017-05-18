<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageGridDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.PageGridDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asp:Label ID="infoLabel" runat="server" Text="" />

<div>
    <asp:Label ID="errorLabel" runat="server" Text="" CssClass="Error" />
</div>

<div style="clear: both;padding-top: 0.25em;width: 100%;">
        <div  style="float:right; text-align:right;"> 
            <asp:LinkButton ID="newLinkButton" runat="server" CausesValidation="false" Text="Create new commitment" onclick="RecurringDocumentCommitmentGrid_AddButtonClicked" />
    </div>
</div>

<asiweb:Lister2 ID="RecurringDocumentCommitmentGrid" runat="server" 
    PagerMode="Advanced" PageSize="20" 
    DataSourceDocumentPath="$/Fundraising/DefaultSystem/Queries/Recurring Donations/Recurring Donations By Contact"
    SelectColumnLocation="Beginning" 
    SelectMode="true"
    SelectColumnText="select"    
    SortingEnabled="false"
    DeleteColumnButtonType="Link"
    DeleteColumnLocation="End"
    OnItemDeleted="RecurringDocumentCommitmentGrid_ItemDeleted"
    OnItemSelected="RecurringDocumentCommitmentGrid_ItemSelected"
    OnAddButtonClicked="RecurringDocumentCommitmentGrid_AddButtonClicked"
    EnableClientSideDelete="false"
    LinkTargetBehavior="RaiseEvent"
    EnableViewState="true"    
    DisplayPropertiesList=""
    DisplayPropertiesTitleOverride="" >

</asiweb:Lister2>
