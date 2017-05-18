<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_AuthorityGroupList" Codebehind="AuthorityGroupList.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="Panel" runat="server" TemplateTitle="Content authority groups" Collapsible="false" ShowBorder="False">    
    <asiweb:Lister2 runat="server" 
        AjaxEnabled="false"
        ID="AuthorityGroupsLister" 
        DataSourceAtomComponentName="ContentManagerAuthorityGroup" 
        DisplayPropertiesList="Name,Description,IsMasterAdmin"
        TargetUrl="~/iMIS/ContentManagement/AuthorityGroupSetup.aspx"
        TargetUrlKeyParameterName="iUniformKey"
        SelectMode="true"
        LinkTargetBehavior="SameWindow"
        UseUniformKey="true"
        AllowGridRowSelectStyle="false"
        DeleteColumnLocation="End"
        DeleteColumnText="Delete" 
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        DeleteColumnButtonType="Image" 
        EnableClientSideDelete="false"
        AddButtonEnabled="true" 
        AddButtonText="Add"
        AddTargetUrl="~/iMIS/ContentManagement/AddAuthorityGroup.aspx" 
        RefreshButtonLocation="None"
        ReloadOnRefresh="true"
        SortPropertiesList="Name"
         />
</asiweb:PanelTemplateControl2>