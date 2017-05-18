<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.UserRoles" Codebehind="UserRoles.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table>
	<tr>
		<td>
		    <asiweb:PanelTemplateControl2 ID="SelectedRolesPanel" runat="server">
		        <asiweb:TemplateTitle runat="server">
		            <asp:label id="lblSelected" runat="server"></asp:label>
		        </asiweb:TemplateTitle>
		        <asp:placeholder id="phSelected" runat="server"></asp:placeholder>
		    </asiweb:PanelTemplateControl2>
		</td>
	</tr>
	<tr>
	    <td>
		    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server">
		        <asiweb:TemplateTitle ID="TemplateTitle1" runat="server">
		            <asp:label id="lblAvailable" runat="server"></asp:label>
		        </asiweb:TemplateTitle>
		        <asiweb:lister id="ListerSecurityList" runat="server" DocumentPath="$/Common/Queries/SecurityAdministration/RoleGroupList" 
		            navigatenavmarker="PM.Package" pagesize="10" ShowExportButton="false" LinkTargetBehavior="RaiseEvent"
		            allowpaging="True"></asiweb:lister>
		    </asiweb:PanelTemplateControl2>
	    </td>
	</tr>
</table>
