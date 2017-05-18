<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Control language="c#" Inherits="Asi.Web.UI.Common.Contact.Group.GroupTypeRolesListPanel" Codebehind="GroupTypeRolesListPanel.ascx.cs" %>
<table width="100%" border="0">
	<tbody>
		<tr>
			<td>
				<asi:SmartControl id="IsSingleRoleInputControl" runat="server" BoundPropertyName="IsSingleRole"></asi:SmartControl><asi:BusinessLabel id="IsSingleRoleCaption" runat="server" InputControlId="IsSingleRoleInputControl" BusinessObjectName="GroupTypeRef"></asi:BusinessLabel>
				<asp:Image id="MemberQueryFolderInfo" Runat="server" ImageUrl="~/AsiCommon/Images/icon_info.gif"
					AlternateText="Each member can participate in only one active role"></asp:Image>
			</td>
		</tr>
		<tr>
			<td>
				<asi:BusinessDataGrid id="RolesDataGrid" runat="server" AutoGenerateColumns="False" ShowFooter="True">
					<COLUMNS>
						<asi:StyledTemplateColumn HeaderText="Role">
							<ItemTemplate>
								<asi:SmartControl id="RoleInputControl" runat="server" RefBusinessObjectType="GroupRoleRef" BoundPropertyName="GroupRoleKey"
									UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewRoleInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="GroupRoleKey" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Sort Rank">
							<ItemTemplate>
								<asi:SmartControl id="SortRankInputControl" runat="server" BoundPropertyName="SortRank" UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewSortRankInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="SortRank" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Default">
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<FooterStyle HorizontalAlign="Center"></FooterStyle>
							<ItemTemplate>
								<asi:SmartControl id="IsDefaultInputControl" runat="server" BoundPropertyName="IsDefault" UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewIsDefaultInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="IsDefault" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Required">
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<FooterStyle HorizontalAlign="Center"></FooterStyle>
							<ItemTemplate>
								<asi:SmartControl id="IsRequiredInputControl" runat="server" BoundPropertyName="IsRequired" UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewIsRequiredInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="IsRequired" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Unique">
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<FooterStyle HorizontalAlign="Center"></FooterStyle>
							<ItemTemplate>
								<asi:SmartControl id="IsUniqueInputControl" runat="server" BoundPropertyName="IsUnique" UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewIsUniqueInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="IsUnique" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Initial Member Status">
							<ItemTemplate>
								<asi:SmartControl id="DefaultMemberStatusInputControl" runat="server" BoundPropertyName="DefaultMemberStatusCode"
									UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewDefaultMemberStatusInputControl" runat="server" BusinessObjectName="GroupTypeRole"
									BoundPropertyName="DefaultMemberStatusCode" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledDeleteColumn>
							<FooterTemplate>
								<asi:StyledImageButton ID="NewGroupTypeRoleSaveButton" Runat="server" CommandName="SaveNewGroupTypeRole"
									ImageUrl='~/AsiCommon/Images/enter.gif'></asi:StyledImageButton>
							</FooterTemplate>
						</asi:StyledDeleteColumn>
					</COLUMNS>
				</asi:BusinessDataGrid>
			</td>
		</tr>
	</tbody>
</table>
