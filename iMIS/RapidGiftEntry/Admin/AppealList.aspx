<%@ Page Language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.AppealList" Title="Appeal List" CodeBehind="AppealList.aspx.cs" %>

<asp:content id="AppealListContent" runat="server" contentplaceholderid="TemplateBody">
    <asp:Panel runat="server" translate="yes">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server" Width="98%">
		<Columns>
			<asp:TemplateColumn  HeaderText="Appeal Code">
			    <ItemTemplate>
			      <asp:HyperLink id="link" runat="server" translate="no"></asp:HyperLink>
			    </ItemTemplate>
			</asp:TemplateColumn>	
			<asp:BoundColumn DataField="Value" DataFormatString="{0:c}" HeaderText="Description" SortExpression="Value" />
	
		</Columns>
	</asiweb:BusinessDataGrid>
    </asp:Panel>
</asp:content>
