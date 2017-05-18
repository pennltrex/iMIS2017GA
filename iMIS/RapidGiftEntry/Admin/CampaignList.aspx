<%@ Page Title="Campaign List" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.CampaignList" Codebehind="CampaignList.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asp:Panel runat="server" translate="yes">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server" Width="98%">
		<Columns>
			<asp:TemplateColumn  HeaderText="Campaign Code">
			    <ItemTemplate>
			      <asp:HyperLink id="link" runat="server" translate="no"></asp:HyperLink>
			    </ItemTemplate>
			</asp:TemplateColumn>					
			<asp:BoundColumn DataField="Value" DataFormatString="{0:c}" HeaderText="Description" SortExpression="Value" />
		</Columns>
	</asiweb:BusinessDataGrid>
     </asp:Panel>
</asp:Content>