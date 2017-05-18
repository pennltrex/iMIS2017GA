<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SetupGroups" Codebehind="SetupGroupEditor.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table style="width:100%;" cellspacing="2" cellpadding="2">
	<tr>
		<td class="CommandBar">
		    <asiweb:StyledButton ID="btnDelete" runat="server" />
		    <asiweb:StyledButton ID="btnSave" runat="server" CommandButtonType="Save" />
		    <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" />
	    </td>
    </tr>
    <tr>
        <td>
			<table cellspacing="0" cellpadding="0" class="HTabTable">
				<tr class="HTabTR">
					<td>
					    <iewc:tabstrip id="SubTabStrip" runat="server" autopostback="True" width="100%" SkinID="HorizontalTabStrip">
							<iewc:tab text="xGroup"></iewc:tab>
							<iewc:tabseparator defaultstyle="width:100%;"></iewc:tabseparator>
						</iewc:tabstrip>
					</td>
				</tr>
				<tr>
					<td class="HTabBody" valign="top">
						<table cellspacing="0">
							<tr>
								<td class="PanelTablePrompt"><asp:Label id="lblName" runat="server"></asp:Label></td>
								<td class="PanelTableValue"><asp:TextBox id="txtName" runat="server"></asp:TextBox></td>
							</tr>
							<tr>
								<td class="PanelTablePrompt"><asp:Label id="lblDescription" runat="server"></asp:Label></td>
								<td class="PanelTableValue"><asp:TextBox id="txtDescription" runat="server"></asp:TextBox></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
