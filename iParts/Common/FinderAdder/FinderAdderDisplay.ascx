<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FinderAdderDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.FinderAdder.FinderAdderDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Button runat="server" id="RefreshTrigger1" style="display:none" OnClick="RefreshResultGrid" Text="text" />
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="false" UpdatePanelsRenderMode="Inline" DefaultLoadingPanelID="RadAjaxLoadingPanel1"> 
        <AjaxSettings>  
            <telerik:AjaxSetting AjaxControlID="ResultsGrid"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="ResultsGrid" />           
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="SourceMessage"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="SourceMessage" />           
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings> 
    </telerik:RadAjaxManager>   
<asp:Panel ID="ContentPanel" runat="server" Visible="true">     
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 
        <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>           
		<asiweb:Lister2 
            AddButtonEnabled="false" 
            AddButtonLocation="TopRight"
            AddButtonText="Add new item" 
            AjaxEnabled="false" 
            CollapsiblePanelTemplate="false" 
            ColumnReorderingEnabled="false" 
            DeleteColumnLocation="None"
            DeleteButtonCssClass="MiddleCenter"
            DeleteColumnButtonType = "Image"
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteConfirmText="Delete this item?"  
            DisableQueryEdit="true" 
            EditColumnLocation="None" 
            EnableClientSideDelete="false" 
            ID="ResultsGrid" 
            LinkTargetHeight="90%" 
            LinkTargetWidth="90%" 
            OnItemDataBound="ResultsGrid_ItemDataBound" 
            OnNeedDataSource="ResultsGrid_NeedDataSource" 
            OnItemCreated="ResultsGrid_OnItemCreated"
            PagingEnabled="true" 
            ReloadOnRefresh="True" 
            runat="server" 
            SelectColumnLocation="Beginning" 
            SortingEnabled="true" 
            TargetPreserveStatefulBusinessContainer="false" />
        <div id="errorLabel" class="iMISUserMessageInformation"></div>              
</asp:Panel> 