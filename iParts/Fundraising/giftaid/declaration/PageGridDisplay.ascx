<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageGridDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.PageGridDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asp:Label ID="infoLabel" runat="server" Text=""></asp:Label>

<div>
    <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="Error"></asp:Label>
</div>

<div style="clear: both;padding-top: 0.25em;width: 100%;">
     <div  style="float:right; text-align:right;"> 
         <asp:LinkButton ID="newButton" runat="server" CausesValidation="false" Text="Create new declaration" onclick="Lister1_AddButtonClicked" />
    </div>
</div>

<asiweb:Lister2 ID="Lister1" runat="server" 
    PagerMode="Advanced" PageSize="20" 
    SelectColumnLocation="Beginning" 
    SelectMode="true"
    AllowGridRowSelectStyle="false"
    SelectColumnText="select"    
    SortingEnabled="false"  
    DeleteColumnButtonType="Link"
    DeleteColumnLocation="End"
    OnItemDeleted="Lister1_ItemDeleted"
    OnItemSelected="Lister1_ItemSelected"
    OnAddButtonClicked="Lister1_AddButtonClicked"
    OnNeedDataSource="Lister1_NeedDataSource"
    EnableClientSideDelete="false"
    LinkTargetBehavior="RaiseEvent"
    EnableViewState="true"
    DataKeyNames="GiftAidDeclarationKey"
    DisplayPropertiesList="DeclarationMethodKey,Status,IsUsing6YearRule,DeclarationStartDate,DeclarationEndDate"
    DisplayPropertiesTitleOverride="Declaration Method,Status, 4 Year Rule?, Specific Start Date, End Date" >

</asiweb:Lister2>




