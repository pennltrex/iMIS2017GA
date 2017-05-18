<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMResults" Codebehind="RFMResults.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<div class="CommandBar">
    <asiweb:StyledButton ID="btnPurge" runat="server" onclick="btnPurge_ServerClick" />
	<asiweb:StyledButton id="btnCreateQuery" runat="server" />
</div>
								
<asiweb:Lister2 id="ListerRFMResultList" runat="server"
AjaxEnabled="true"
SortingEnabled="true"
PagingEnabled="true"
PagerMode="Advanced"
PageSize="20"
ColumnReorderingEnabled="false"
DataSourceDocumentPath="$/RFMAnalysis/DefaultSystem/Queries/RFMList"
TargetContentCode="RFM.PEConfigurator"
EnableClientSideDelete="false"
EditColumnLocation="None"
SelectColumnLocation="None"
DeleteColumnLocation="None"
AddButtonEnabled="false"
AddButtonLocation="None"
UseUniformKey="false"
ExportButtonLocation="TopRight"    
/>				