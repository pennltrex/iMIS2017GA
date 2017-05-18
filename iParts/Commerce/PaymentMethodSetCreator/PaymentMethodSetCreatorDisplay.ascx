<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethodSetCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PaymentMethodSetCreator.PaymentMethodSetCreatorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel EnableAJAX="true" EnableViewState="true" ID="ListerPanel" 
    LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Visible="true">
               
    <asiweb:Lister2 AddButtonEnabled="true" 
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowEachLink" 
        AddTargetUrl="~/iParts/Commerce/PaymentMethodSetCreator/PaymentMethodSetCreatorDialog.aspx?mode=add"
        AjaxEnabled="true" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="End"
        DeleteConfirmText="Delete this item?"
        OnItemDeleted="DeletePaymentMethodSet"
        DisableQueryEdit="true" 
        EditColumnLocation="None" 
        EnableClientSideDelete="false" 
        ID="ResultsGrid" 
        LinkTargetBehavior="NewWindowAllShare" 
        OnNeedDataSource="ResultsGridNeedDataSource" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="Beginning" 
        SortingEnabled="true" 
        TargetPreserveStatefulBusinessContainer="false" 
        TargetUrl="~/iParts/Commerce/PaymentMethodSetCreator/PaymentMethodSetCreatorDialog.aspx" 
        UseUniformKey="true"  
        OnItemDataBound="ResultsGridOnItemDataBound"
        DisplayPropertiesList="Name,Description,IsDefault" 
        DisplayPropertiesTitleOverride="Name,Description,IsDefault" 
        DialogWindowCallback="CallbackRefresh" />
                    
</telerik:RadAjaxPanel>

<script>  
    function CallbackRefresh() {
        if (window != null)
            window.location.href = window.location.href;
    }
</script>

