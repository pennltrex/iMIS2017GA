<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.UserControlBase" %>
<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" TemplateTitle="Providers" ShowBorder="False">

    <asiweb:Lister2 
        ID="lstProviders"
        runat="server"
        AjaxEnabled="false"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/ContactListerQueryForLocations/Providers"
        DeleteColumnLocation="None"
        UseUniformKey="false"
        DataKeyNames="code_id"	        
        LinkTargetBehavior="NewWindowAllShare"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowAllShare"
        AddTargetUrl="~/iMIS/ExperienceManagement/ProviderEdit.aspx"
        AddButtonText="Add a provider" 
        DisableQueryEdit="true"       
        />

</asiweb:PanelTemplateControl2>