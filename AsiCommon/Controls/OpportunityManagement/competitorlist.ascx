<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.CompetitorList" Codebehind="CompetitorList.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    <div align="right">
        <asiweb:StyledButton runat="server" id="btnAddCompetitor" value="btnAddCompetitor" />
	</div>
	<br />
        <asiweb:Lister2 id="ListerOppCompetitors" PagingEnabled="True" AddLinkTargetBehavior="NewWindowEachLink" PageSize="10" TargetContentCode="OM.Competitor" cssclassnorecords="ListResultsEmptyShort" runat="server" DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/CompetitorList" TargetUrlKeyParameterName="iCompetitorKey" ExportButtonLocation="TopRight" Width="99%"></asiweb:Lister2>



