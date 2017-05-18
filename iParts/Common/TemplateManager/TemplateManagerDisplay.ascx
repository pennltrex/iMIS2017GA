<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateManagerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.TemplateManager.TemplateManagerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:BusinessLabel runat="server" id="LabelManageTemplateIntroText"></asiweb:BusinessLabel><br />
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel EnableAJAX="true" EnableViewState="true" ID="ListerPanel" 
    LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Visible="true">
               
    <asiweb:Lister2 ID="TemplateGrid" 
        AddButtonEnabled="true" 
        AddButtonText="Add new template"
        AddButtonLocation="TopRight" 
        AddLinkTargetBehavior="RaiseEvent" 
        OnAddButtonClicked="TemplateGrid_OnAddButtonClicked"
        AjaxEnabled="true" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="End"
        DeleteConfirmText="Delete this template?"
        DeleteButtonCssClass="FloatRight"
        DeleteColumnButtonType = "Image"
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        OnItemDeleted="DeleteTemplate"
        DisableQueryEdit="true" 
        EditColumnLocation="None" 
        EnableClientSideDelete="false"         
        LinkTargetBehavior="SameWindow"
        OnNeedDataSource="TemplateGridNeedDataSource" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="None" 
        SortingEnabled="true" 
        TargetPreserveStatefulBusinessContainer="false"         
        OnItemDataBound="TemplateGridOnItemDataBound"
        DataKeyNames="TemplateId"
        DisplayPropertiesList="Name,Description" 
        DisplayPropertiesTitleOverride="Template,Description" />
                    
</telerik:RadAjaxPanel>

