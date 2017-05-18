<%@ Page Title="Request List" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.RequestList" Codebehind="RequestList.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server">
		<Columns>
			<asp:HyperLinkColumn DataTextField="SequenceNumber" HeaderText="Key" DataNavigateUrlField="SequenceNumber" DataNavigateUrlFormatString="javascript:(function (window) {{ window.Argument = ['PopupReturn','{0}']; window.close(); }})(GetRadWindow());"
				SortExpression="SequenceNumber" />
			<asp:BoundColumn DataField="UserField2" DataFormatString="{0:c}" HeaderText="Type" SortExpression="UserField2" />
			<asp:BoundColumn DataField="TransactionDate" DataFormatString="{0:d}" HeaderText="Requested" SortExpression="TransactionDate" />
			<asp:BoundColumn DataField="ThruDate" DataFormatString="{0:d}" HeaderText="End Date" SortExpression="ThruDate" />
			<asp:BoundColumn DataField="ProductCode" DataFormatString="{0:c}" HeaderText="Distribution" SortExpression="ProductCode" />
			<asp:BoundColumn DataField="SourceCode" DataFormatString="{0:c}" HeaderText="Appeal" SortExpression="SourceCode" />
			<asp:BoundColumn DataField="FinancialEntityCode" DataFormatString="{0:c}" HeaderText="Fund" SortExpression="FinancialEntityCode" />
			<asp:BoundColumn DataField="StatusCode" DataFormatString="{0:c}" HeaderText="Status" SortExpression="StatusCode" />
			<asp:BoundColumn DataField="Amount" DataFormatString="{0:c}" HeaderText="Amount" SortExpression="Amount" />
		</Columns>
	</asiweb:BusinessDataGrid>
</asp:Content>