<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentOptionManagerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PaymentOptionManager.PaymentOptionManagerDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:Lister2 runat="server" ID="PaymentOptionGrid" 
    AddButtonEnabled="True"
    AddButtonText="Add a new payment option"
    AddButtonType="Link"
    AddButtonLocation="TopRight"
    AddLinkTargetBehavior="SameWindow"
    AjaxEnabled="true" 
    CollapsiblePanelTemplate="false" 
    ColumnReorderingEnabled="false" 
    DeleteColumnLocation="End"
    DeleteButtonCssClass="FloatRight"
    DeleteColumnButtonType="Image" 
    DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
    OnItemDeleted="PaymentOptionGrid_OnDeleteButtonClicked"
    DisableQueryEdit="true" 
    EditColumnLocation="End"
    EditColumnButtonType="Image"
    EditColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
    NoRecordsText="There are no automatic payment options to display."
    EnableClientSideDelete="false"
    LinkTargetBehavior="SameWindow"
    OnNeedDataSource="PaymentOptionGrid_OnNeedDataSource"
    PagingEnabled="true"
    SelectColumnLocation="None" 
    SortingEnabled="True"
    TargetPreserveStatefulBusinessContainer="False"
    OnItemDataBound="PaymentOptionGrid_OnItemDataBound" 
    DataKeyNames="PaymentOptionId, PaymentOptionType,IsAvailableToDisable, DisableMessage,IsReadOnly"
    DisplayPropertiesList="Description, Expiration"
    DisplayPropertiesTitleOverride="Card, Expires" 
    ReloadOnRefresh="True">
</asiweb:Lister2>
<script>
    function RefreshPaymentOptionParentWindow() {
        var masterTable = $find('<%# PaymentOptionGrid.ClientID %>_Grid1').get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    };
</script>
