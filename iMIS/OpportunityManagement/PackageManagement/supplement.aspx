<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Insert Editor" %>
<%@ Register TagPrefix="uc1" TagName="Supplement" Src="~/AsiCommon/Controls/PackageManagement/Supplement.ascx" %>
<%@ Register TagPrefix="uc3" TagName="SupplementTop" Src="~/AsiCommon/Controls/PackageManagement/SupplementTop.ascx" %>

<asp:content id="Content1" runat="server" contentplaceholderid="TemplateBody">
	<table id="Table1" border="0" class="Portfolio">

		<tr>
			<td class="WorkSpace">
				<uc1:Supplement id="Supplement1" runat="server"></uc1:Supplement>
			</td>
		</tr>
	</table>
</asp:content>