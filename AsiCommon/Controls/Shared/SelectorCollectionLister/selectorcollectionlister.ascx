<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SelectorCollectionLister.SelectorCollectionLister" Codebehind="SelectorCollectionLister.ascx.cs" %>
<asp:datagrid id="DataGrid1" runat="server" CssClass="ListTable" CellPadding="3" BorderWidth="0px" BorderStyle="None" GridLines="None" HorizontalAlign="Left" AutoGenerateColumns="False">
	<AlternatingItemStyle CssClass="ListEven"></AlternatingItemStyle>
	<ItemStyle CssClass="ListOdd"></ItemStyle>
	<HeaderStyle CssClass="ListHeader"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="Source" HeaderText="Source"></asp:BoundColumn>
		<asp:BoundColumn DataField="Type" HeaderText="Type"></asp:BoundColumn>
		<asp:BoundColumn Visible="False" DataField="Index" HeaderText="Index"></asp:BoundColumn>
		<asp:TemplateColumn FooterStyle-HorizontalAlign="Right">
			<ItemTemplate>
				<asp:LinkButton id="Select" runat="server" Visible="True" CommandName="Select" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Index").ToString() %>'>
					<asp:Image ImageUrl="~/AsiCommon/Images/1x1.gif" border="0" align="right" width="13" height="1"><asp:Image ImageUrl="~/AsiCommon/Images/icon_remove.gif" border="0" align="right" alt="<%# Caption %>">
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>