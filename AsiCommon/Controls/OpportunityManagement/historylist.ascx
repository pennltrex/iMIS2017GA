<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.HistoryList" Codebehind="HistoryList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server" />

<asiweb:Lister2 id="ListerOppHistory" PagingEnabled="True" AddLinkTargetBehavior="NewWindowEachLink"
PageSize="10" TargetContentCode="OM.History" runat="server" 
DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/HistoryList" ExportButtonLocation="TopRight"/>
