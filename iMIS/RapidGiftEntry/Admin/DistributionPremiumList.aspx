<%@ Page Title="Distribution List" Language="C#" AutoEventWireup="true" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.DistributionPremiumList" CodeBehind="DistributionPremiumList.aspx.cs" %>

<asp:content id="MainContent" runat="server" contentplaceholderid="TemplateBody">
    <asp:Panel runat="server" translate="yes">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server" Width="98%">
		<Columns>
			<asp:TemplateColumn  HeaderText="Distribution Code">
			    <ItemTemplate>
			      <asp:HyperLink id="link" runat="server" translate="no"></asp:HyperLink>
			    </ItemTemplate>
			</asp:TemplateColumn>
			
			<asp:BoundColumn DataField="Value" DataFormatString="{0:c}" HeaderText="Description" SortExpression="Value" />
		</Columns>
	</asiweb:BusinessDataGrid>
    </asp:Panel>
</asp:content>
