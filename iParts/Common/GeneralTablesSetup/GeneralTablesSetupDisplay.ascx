<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralTablesSetupDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.GeneralTablesSetup.GeneralTablesSetupDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Button runat="server" id="RefreshTrigger1" style="display:none" OnClick="RefreshResultGrid" Text="text" />
<div ID="GenTablesDropDown" class="ClearFix PanelField Left" runat="server">
    <div class="PanelFieldLabel">
        <asiweb:StyledLabel ID="GenTablesListLabel" AssociatedControlID="GenTablesList" runat="server" Text="General tables" Translate="yes"></asiweb:StyledLabel>
        </div> 
        <div class="PanelFieldValue">           
            <asiweb:BusinessDropDownList runat="server" ID="GenTablesList" OnSelectedIndexChanged="GenTablesList_OnSelectedIndexChanged" AutoPostBack="true" />
        </div>
</div>


<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="false" UpdatePanelsRenderMode="Inline" DefaultLoadingPanelID="RadAjaxLoadingPanel1"> 
        <AjaxSettings>  
            <telerik:AjaxSetting AjaxControlID="GenTablesList"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="ResultsGrid" />           
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="SourceMessage"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="SourceMessage" />           
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ResultsGrid"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="ResultsGrid" />           
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings> 
    </telerik:RadAjaxManager>   
    

<asp:Panel ID="ContentPanel" runat="server" Visible="true">     
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 
    <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>
    <asiweb:Lister2 ID="ResultsGrid" runat="server" AjaxEnabled="false" SortingEnabled="true" 
        PagingEnabled="true" ColumnReorderingEnabled="false"   
        TargetPreserveStatefulBusinessContainer="false" 
        AddButtonLocation="TopRight" AddButtonEnabled="false"
        DeleteColumnLocation="None" EnableClientSideDelete="false" OnItemCreated="ResultsGrid_OnItemCreated"
        OnNeedDataSource="ResultsGrid_NeedDataSource" OnItemDataBound="ResultsGrid_ItemDataBound" 
        CollapsiblePanelTemplate="false" DisableQueryEdit="false" ReloadOnRefresh="True" LinkTargetHeight="90%" LinkTargetWidth="90%"/>
    <div id="errorLabel" class="iMISUserMessageInformation"></div>
           
</asp:Panel> 
