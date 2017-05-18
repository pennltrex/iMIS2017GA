<%@ Page Title="Fund List" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.FundList" Codebehind="FundList.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asp:Panel runat="server" translate="yes">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server" Width="98%" OnItemDataBound="FindResults_OnItemDataBound">
		<Columns>
			<asp:HyperLinkColumn DataTextField="FinancialEntityCode" HeaderText="Fund Code" DataNavigateUrlField="FinancialEntityCode" DataNavigateUrlFormatString="javascript:(function (window) {{ window.Argument = ['PopupReturn','{0}']; window.close(); }})(GetRadWindow());"
				SortExpression="FinancialEntityCode" />
			<asp:BoundColumn DataField="FinancialEntityName" DataFormatString="{0:c}" HeaderText="Fund Name" SortExpression="FinancialEntityName" />
		</Columns>
	</asiweb:BusinessDataGrid>
    </asp:Panel>
</asp:Content>