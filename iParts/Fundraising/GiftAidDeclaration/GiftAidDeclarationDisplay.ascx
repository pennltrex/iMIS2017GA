<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidDeclarationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.GiftAidDeclarationDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register Src="GiftAidDeclarationDialogControl.ascx" TagPrefix="uc1" TagName="GiftAidDeclarationDialogControl" %>

<telerik:RadAjaxPanel ID="radAjaxPanel1" runat="server">
    <div class="AutoWidth" id="GiftAidDonorControls" runat="server">
        <asiweb:BusinessCheckBox
            ID="GiftAidCheckbox" runat="server" RenderPanelField="True" DisplayCaption="true" PositionCaption="Right" />

        <div class="SubItems">
            <div runat="server" id="GiftAidConfirmationMessage"></div>
        </div>
    </div>

    <uc1:GiftAidDeclarationDialogControl runat="server" ID="GiftAidStaffControls" />
    
</telerik:RadAjaxPanel>


            <asiweb:Lister2 id="ResultsGrid" runat="server"
               RefreshButtonLocation="BottomLeft"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"
                ColumnReorderingEnabled="false"
                EnableClientSideDelete="false"
                SelectColumnText="Edit Declaration"
                SelectColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
                SelectColumnButtonType="Image"
                DeleteColumnLocation="None"                                  
                AddButtonEnabled="true"
                AddButtonImageUrl="~/AsiCommon/Images/icon_add.png"
                AddButtonType="Image"
                AddButtonText="Add Declaration"
                TargetUrl="SeeCodeBehind"
                AddLinkTargetBehavior="NewWindowAllShare"
                LinkTargetBehavior="NewWindowAllShare"
                TargetUrlKeyParameterName="iUniformKey"
                UseUniformKey="True"
                TargetCloseWindowOnCommit="false"
                DataSourceIsRealDataSource="false"
                OnNeedDataSource="ResultsGrid_NeedDataSource"
                OnItemDataBound="ResultsGrid_ItemDataBound"
            />  

