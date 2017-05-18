<%@ Page language="c#" %>
<%@ Register TagPrefix="workflow" TagName="WorkItemConsole" Src="~/AsiCommon/Controls/WorkflowManagement/WorkItemConsole.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<html>
	<head>
		<title>Work Item Console</title>
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
		<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<workflow:WorkItemConsole id="WorkItemConsole1" runat="server"></workflow:WorkItemConsole>
		</form>
	</body>
</html>