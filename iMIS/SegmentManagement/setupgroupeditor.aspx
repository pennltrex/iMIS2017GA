<%@ Page language="c#" %>
<%@ Register TagPrefix="uc1" TagName="SetupGroups" Src="~/AsiCommon/Controls/SegmentManagement/SetupGroupEditor.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<HTML>
	<HEAD>
		<title><% Response.Write(Asi.ResourceManager.GetPhrase("SMSetupGroups","Segmentation Setup Groups")); %></title>
       		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        	<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
        	<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
	</HEAD>
	<body>
		<form id="SetupGroups" method="post" runat="server">
			<uc1:SetupGroups id="SetupGroups1" runat="server"></uc1:SetupGroups>
		</form>
	</body>
</HTML>
