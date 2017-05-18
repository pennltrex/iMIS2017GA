<%@ Control language="c#" Inherits="Asi.Web.UI.Common.Contact.Group.GroupTypeEditScreen" Codebehind="GroupTypeEditScreen.ascx.cs" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<script language="javascript">
function BrowseForObject(documentType, returnFunction, folderKey)
{
	var queryStringParams = "mode=dialog&RootHierarchyKey=055F322A-0924-492D-807A-6A4BB5DB146E&DocumentTypeCode=" + documentType;
	if (folderKey)
		queryStringParams += "&iFolderHierarchyKey=" + folderKey;
	CMOpenDialog ("BSA.ObjectBrowser", false, 700, 500, queryStringParams, null, returnFunction)
}

function QueryBrowseClick()
{
	BrowseForObject('Query', SetQueryObject, '9C4A4E39-9CAF-4751-9FB1-57B66773A7F2');
}

function SetQueryObject(documentKey, documentName)
{
	var displayLabel = document.getElementById('<%=MemberQueryFolderNameLabel.ClientID%>');
	displayLabel.innerText = documentName;
	
	var keyTextBox = document.getElementById('<%=MemberQueryFolderKeyTextBox.ClientID%>');
	keyTextBox.value = documentKey;
}
</script>
<table width="100%" border="0">
	<tbody>
		<tr>
			<td>
				<asi:paneltemplatecontrol id="DetailsTemplate" runat="server" TemplateTitle="Details" AtomPanelTemplateTypeCode="5">
					<TABLE>
						<TR>
							<TD colSpan="2">
								<asp:placeholder id="DetailsPlaceholder" Runat="server"></asp:placeholder></TD>
						</TR>
						<!--TR>
							<TD class="PanelTablePrompt">
								<asi:BusinessLabel id="MemberQueryFolderCaption" Runat="server" BoundPropertyName="MemberQueryFolderKey"
									BusinessObjectName="GroupTypeRef"></asi:BusinessLabel></TD>
							<TD class="PanelTableValue">
								<asp:Label id="MemberQueryFolderNameLabel" Runat="server"></asp:Label><A href="javascript:QueryBrowseClick()">
									<asp:Image id="findImage" Runat="server" ImageUrl="~/Images/ImageLibrary/find.gif"></asp:Image></A>
								<asp:Image id="MemberQueryFolderInfo" Runat="server" ImageUrl="~/AsiCommon/Images/icon_info.gif"
									AlternateText="Avoid queries that can return more than 1000 members"></asp:Image>
								<asp:TextBox id="MemberQueryFolderKeyTextBox" Runat="server"></asp:TextBox></TD>
						</TR-->
					</TABLE>
				</asi:paneltemplatecontrol>
			</td>
		</tr>
		<tr>
			<td>
				<asi:paneltemplatecontrol id="MemberStatusValuesTemplate" runat="server" TemplateTitle="Member Status Values"
					AtomPanelTemplateTypeCode="5">
					<asp:PlaceHolder id="MemberStatusValuesPlaceholder" runat="server"></asp:PlaceHolder>
				</asi:paneltemplatecontrol>
			</td>
		</tr>
		<tr>
			<td>
				<asi:paneltemplatecontrol id="RolesTemplate" runat="server" TemplateTitle="Roles" AtomPanelTemplateTypeCode="5">
					<asp:PlaceHolder id="RolesPlaceholder" runat="server"></asp:PlaceHolder>
				</asi:paneltemplatecontrol>
			</td>
		</tr>
	</tbody>
</table>
