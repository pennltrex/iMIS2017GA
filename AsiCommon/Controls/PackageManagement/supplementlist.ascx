<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.PackageManagement.SupplementList" Codebehind="SupplementList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Inserts" Collapsible="false">

    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    
        <asiweb:Lister2 id="ListerSupplementList"
        DisableQueryEdit="true"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/PackageManagement/DefaultSystem/Queries/SupplementList"
        DeleteColumnLocation="End"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowEachLink"
        AddTargetUrl="~/iMIS/ContentManagement/Template.aspx?ContentCode=PM.Supplement&iParent=PackageList&iNewObject=Supplement"
        TargetUrl="~/iMIS/ContentManagement/Template.aspx?ContentCode=PM.Supplement&iParent=PackageList"
        LinkTargetBehavior="NewWindowAllShare"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"
        OnItemDeleted="ListerSupplementList_ItemDeleted"       
        EnableClientSideDelete="false"
        UseUniformKey="true"
        AddButtonText="Add an Insert"                                                     
        />  
      
</asiweb:PanelTemplateControl2>              