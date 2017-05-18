<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/transitionmain.ascx" %>
<%@ Reference Control="~/asicommon/controls/workflowmanagement/design/activitymain.ascx" %>
<%@ Register TagPrefix="GoWeb" Namespace="Northwoods.GoWeb" Assembly="Northwoods.GoWeb" %>
<%@ Register Src="~/asicommon/controls/bsa/objectbrowser2.ascx" TagPrefix="asi" TagName="objectbrowser" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.WorkflowDesigner" Codebehind="WorkflowDesigner.ascx.cs" %>
<table cellSpacing="0" cellPadding="2" width="100%" border="1">
	<tr bgColor="#e2dfd0">
		<td><asp:imagebutton id="NewImageButton" ImageUrl="~/AsiCommon/images/Workflow/new.gif" AlternateText="New"
				Runat="server"></asp:imagebutton><asp:imagebutton id="OpenImageButton" ImageUrl="~/AsiCommon/images/Workflow/open.gif" AlternateText="Open"
				Runat="server"></asp:imagebutton><asp:imagebutton id="SaveImageButton" ImageUrl="~/AsiCommon/images/Workflow/save.gif" AlternateText="Save"
				Runat="server"></asp:imagebutton><asp:imagebutton id="SaveAsImageButton" ImageUrl="~/AsiCommon/images/Workflow/saveas.gif" AlternateText="Save As"
				Runat="server"></asp:imagebutton><asp:imagebutton id="DeleteImageButton" ImageUrl="~/AsiCommon/images/Workflow/delete.gif" AlternateText="Delete"
				Runat="server"></asp:imagebutton><asp:imagebutton id="ZoomInImageButton" ImageUrl="~/AsiCommon/images/Workflow/zoomin.gif" AlternateText="Zoom In"
				Runat="server"></asp:imagebutton><asp:imagebutton id="ZoomOutImageButton" ImageUrl="~/AsiCommon/images/Workflow/zoomout.gif" AlternateText="Zoom Out"
				Runat="server"></asp:imagebutton><asp:imagebutton id="ActualSizeImageButton" ImageUrl="~/AsiCommon/images/Workflow/actualsize.gif"
				AlternateText="Actual Size" Runat="server"></asp:imagebutton><asp:imagebutton id="FitWindowImageButton" ImageUrl="~/AsiCommon/images/Workflow/fitinwindow.gif"
				AlternateText="Fit Window" Runat="server"></asp:imagebutton></td>
	</tr>
	<tr>
		<td bgColor="#ece9d8">
			<table cellSpacing="0" cellPadding="4" border="0" width="100%">
				<tr>
					<td vAlign="top" width="1"><GOWEB:GOVIEW id="MyView" tabIndex="1" runat="Server" AllowDelete="True" AllowCopy="False" EnableViewState="False"
							Height="600px" Width="500px" BorderColor="Transparent" PrimarySelectionColor="Navy" SecondarySelectionColor="Navy"
							BackColor="White" ScrollMarginBackgroundColor="#ece9d8" ScrollMarginForegroundColor="Black" BorderStyle="None" ScrollSmallChange="128, 128"
							AutoPanRegion="64, 64"></GOWEB:GOVIEW></td>
					<td vAlign="top">
						<asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>
						<asp:placeholder id="PlaceHolder2" runat="server"></asp:placeholder>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
