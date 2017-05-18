<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.ActivityList" Codebehind="ActivityList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />

<asiweb:Lister2 id="ListerOppActivities" runat="server"
    AjaxEnabled="true"
    SortingEnabled="true"
    PagingEnabled="true"
    PagerMode="Advanced"
    PageSize="10"
    ColumnReorderingEnabled="false"
    DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/ActivityList"       
    EnableClientSideDelete="false"
    EditColumnLocation="None"
    SelectColumnLocation="None"
    DeleteColumnLocation="None"                                     
    AddButtonEnabled="false"
    AddButtonLocation="None"
    LinkTargetBehavior="NewWindowEachLink"
    UseUniformKey="true"                  
    ExportButtonLocation="TopRight"
    Width="100%"                                                                                                       
/>
