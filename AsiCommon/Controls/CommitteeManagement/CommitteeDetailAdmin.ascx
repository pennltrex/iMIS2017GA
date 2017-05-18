<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommitteeDetailAdmin.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.CommitteeManagement.CommitteeDetailAdmin" %>
 
    <asp:Button runat="server" id="RefreshTrigger1" style="display:none" OnClick="RefreshResultGrid" Text="text" />
    
        <asiweb:PanelTemplateControl2 ID="RosterListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
        <div style="clear:both;">
        <asp:Button runat="server" ID="deleteButton" OnClick="deleteButton_OnClick" CssClass="hidden" CausesValidation="False"/>
        <asp:HiddenField runat="server"  ID="hiddenfield"/>
        <asiweb:Lister2 id="RosterList" runat="server"
            AjaxEnabled="True"
            CurrentQueryHasFilter="True"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Advanced"
            PageSize="20"      
            DisableQueryEdit ="true"
            DataKeyNames="code_GroupMemberDetailId"
            DataSourceDocumentPath ="$/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/" 
            ColumnReorderingEnabled="false"
            EnableClientSideDelete="false"
            GridIconColumnCssClass="grid-icon-column"
            EditColumnLocation="None"
            SelectColumnText="Edit"
            SelectColumnLocation="End"          
            SelectColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
            SelectColumnButtonType="Image"
            TargetUrl="~/AsiCommon/Controls/CommitteeManagement/CommitteeMemberAddEditDisplay.aspx"
            DeleteColumnLocation="End"
            DeleteColumnText="Delete" 
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteColumnButtonType="Image"
            AddButtonLocation="TopRight"   
            AddButtonText="Add a member position"                                                                     
            LinkPropertyTargetBehavior="SameWindow"
            LinkTargetBehavior="NewWindowAllShare"
            AddLinkTargetBehavior="NewWindowAllShare"
            UseUniformKey="true"  
            ExportButtonLocation="TopRight"
            OnItemDataBound="RosterList_OnItemDataBound"
            OnExport="RosterList_OnExportList_Export"
            DeleteConfirmText=""
            DataSourceSelectText="View members" 
            CollapsiblePanelTemplate="False"
        />
       </div>
            <div runat="server" id="DivEmail" class="AlignRight GridFooterPanel">
                <asiweb:StyledButton runat="server" ID="ButtonEmail" Text="Email"/>
            </div>
                   
            <div style="display: none;">
            <%-- Lister below is for exporting data --%>
            <asiweb:Lister2 ID="lstExportableRosterList" runat="server" Title="Committee roster list"
                AddButtonEnabled="false" DeleteColumnLocation="None" AjaxEnabled="false"
                EditColumnLocation="None" ExportButtonLocation="None" GroupingEnabled="false"
                SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="false" 
                DataSourceIsRealDataSource="false" DataSourceDocumentPath ="$/ContactManagement/DefaultSystem/Queries/Groups/Committees/Members/Active members" 
               />
        </div>
    </asiweb:PanelTemplateControl2>
    
