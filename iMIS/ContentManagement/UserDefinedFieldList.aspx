<%@ Page Language="C#" Title="User Defined Fields" Inherits="Asi.Web.UI.ContentManagement.UserDefinedFieldList" Codebehind="UserDefinedFieldList.aspx.cs" %>

<asp:Content id="Content1" runat="server" ContentPlaceHolderId="TemplateBody">
    <script type="text/javascript">
        function AddCallBackFunction(radwindow) {
            if (radwindow != null) {
                InitiateControlEventWithArgument('<%= addTrigger.ClientID %>', "");
            }
        }
    </script>
    <asiweb:PanelTemplateControl2 ID="Panel" runat="server" ShowHeader="true" TemplateTitle="User defined fields" Collapsible="false" ScrollBars="None" ShowBorder="False">    
        <asiweb:Lister2
            AddButtonText="Add"            
            AddButtonLocation="TopRight" 
            AddButtonToolTip="Add a new UD Field definition" 
            AddTargetUrlParameters="iOperation=New" 
            AjaxEnabled="false" 
            ColumnReorderingEnabled="false" 
            DataSourceAtomComponentName="UserDefinedField" 
            DeleteColumnLocation="End" 
            DeleteColumnToolTip="Permanently delete this UD Field" 
            DeleteConfirmText="Are you sure you wish to delete this user defined field? Any values for this field associated with existing content will be deleted as well." 
            DisplayPropertiesList="Name,IsRequired,UseInSearchFlag,SortOrder" 
            EnableClientSideDelete="False" 
            ExportButtonLocation="None" 
            GroupingEnabled="false" 
            ID="UserDefinedFields" 
            LinkTargetBehavior="NewWindowAllShare" 
            DialogWindowCallback="AddCallBackFunction"
            OnItemDeleted="UserDefinedFieldsItemDeleted" 
            PagingEnabled="true" 
            runat="server" 
            SelectColumnLocation="Beginning" 
            SelectColumnToolTip="Edit the properties for this UD Field" 
            SortingEnabled="true" 
            TargetUrl="~/iMIS/ContentManagement/UserDefinedFieldEdit.aspx" 
            TargetUrlKeyParameterName="UserDefinedFieldKey" 
            UseUniformKey="true"/>
            <asp:Button runat="server" id="addTrigger" style="display:none" Text=""></asp:Button>
    </asiweb:PanelTemplateControl2>
</asp:Content>
