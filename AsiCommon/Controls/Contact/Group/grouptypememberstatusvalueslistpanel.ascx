<%@ Control language="c#" Inherits="Asi.Web.UI.Common.Contact.Group.GroupTypeMemberStatusValuesListPanel" Codebehind="GroupTypeMemberStatusValuesListPanel.ascx.cs" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<table width="100%" border="0">
	<tbody>
		<tr>
			<td>
				<asi:BusinessDataGrid id="MemberStatusValuesDataGrid" runat="server" AutoGenerateColumns="False" ShowFooter="True">
					<COLUMNS>
						<asi:StyledTemplateColumn HeaderText="Member Status">
							<ItemTemplate>
								<asi:SmartControl id="MemberStatusValueInputControl" runat="server" RefBusinessObjectType="GroupMemberStatusRef"
									BoundPropertyName="GroupMemberStatusCode" UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewMemberStatusValueInputControl" runat="server" BusinessObjectName="GroupTypeMemberStatus"
									BoundPropertyName="GroupMemberStatusCode" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Active">
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<FooterStyle HorizontalAlign="Center"></FooterStyle>
							<ItemTemplate>
								<asi:SmartControl id="MemberStatusActiveInputControl" runat="server" BoundPropertyName="IsActiveStatus"
									UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewMemberStatusActiveInputControl" runat="server" BusinessObjectName="GroupTypeMemberStatus"
									BoundPropertyName="IsActiveStatus" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledTemplateColumn HeaderText="Priority">
							<ItemTemplate>
								<asi:SmartControl id="MemberStatusPriorityInputControl" runat="server" BoundPropertyName="Priority"
									UseParentControlBusinessItem="False"></asi:SmartControl>
							</ItemTemplate>
							<FooterTemplate>
								<asi:SmartControl id="NewMemberStatusPriorityInputControl" runat="server" BusinessObjectName="GroupTypeMemberStatus"
									BoundPropertyName="Priority" UseParentControlBusinessItem="False" DisplayValidator="False"></asi:SmartControl>
							</FooterTemplate>
						</asi:StyledTemplateColumn>
						<asi:StyledDeleteColumn>
							<FooterTemplate>
								<asi:StyledImageButton ID="NewMemberStatusSaveButton" Runat="server" CommandName="SaveNewMemberStatus"
									ImageUrl='~/AsiCommon/Images/enter.gif'></asi:StyledImageButton>
							</FooterTemplate>
						</asi:StyledDeleteColumn>
					</COLUMNS>
				</asi:BusinessDataGrid>
			</td>
		</tr>
	</tbody>
</table>
