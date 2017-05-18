<%@ Page Title="Check/CC List" Language="C#" AutoEventWireup="true" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.CheckCCList" Codebehind="CheckCCList.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server">
		<Columns>
			<asp:HyperLinkColumn DataTextField="Key" HeaderText="Check/CC Code" DataNavigateUrlField="Key" DataNavigateUrlFormatString="javascript:window.opener.PopupReturn('{0}');self.close();"
				SortExpression="Key" />
			<asp:BoundColumn DataField="Value" DataFormatString="{0:c}" HeaderText="Description" SortExpression="Value" />
		</Columns>
	</asiweb:BusinessDataGrid>
</asp:Content>