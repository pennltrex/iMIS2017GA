<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls, Version=1.0.2.226, Culture=neutral" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ProcessMain" Codebehind="ProcessMain.ascx.cs" %>
<div align=left>
	<asp:Label id="SectionTitleLabel" runat="server" Font-Name="tahoma" Font-Size="14pt" Font-Bold="True"></asp:Label>
</div>
<div class="SpacerB"><img height="3" width="1" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif"></div>
<iewc:TabStrip id="SubSectionTabStrip" runat="server" width="100%" autopostback="true" font-size="10pt"
	SepDefaultStyle="border-bottom:solid 1px #94A6CE;" TabSelectedStyle="border-right:#94a6ce 1px solid;padding-right:4px;border-top:#94a6ce 3px solid;padding-left:4px;font-weight:bold;border-left:#94a6ce 1px solid;color:black;border-bottom:medium none;height:12px;text-decoration:none;"
	TabDefaultStyle="border-right:#94a6ce 1px solid;padding-right:4px;border-top:#94a6ce 1px solid;padding-left:4px;border-left:#94a6ce 1px solid;color:black;border-bottom:#94a6ce 1px solid;font-family:tahoma;height:12px;background-color:#efefe7;text-align:center;text-decoration:none;"
	TabHoverStyle="color:black;text-decoration:none;" onselectedindexchange="SubSectionTabStrip_SelectedIndexChange">
	<iewc:Tab Text="xGeneral"></iewc:Tab>
	<iewc:TabSeparator></iewc:TabSeparator>
	<iewc:Tab Text="xApplications"></iewc:Tab>
	<iewc:TabSeparator></iewc:TabSeparator>
	<iewc:Tab Text="xDataFields"></iewc:Tab>
	<iewc:TabSeparator></iewc:TabSeparator>
	<iewc:Tab Text="xParameters"></iewc:Tab>
	<iewc:TabSeparator></iewc:TabSeparator>
	<iewc:Tab Text="xParticipants"></iewc:Tab>
	<iewc:TabSeparator DefaultStyle="width:100%;"></iewc:TabSeparator>
</iewc:TabStrip>
<div align="left">
	<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
	<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
</div>
