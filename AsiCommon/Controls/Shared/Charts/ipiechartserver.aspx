<%@ Page EnableTheming="false" language="c#" Inherits="Asi.Web.UI.Common.Charts.iPieChartServer" Codebehind="iPieChartServer.aspx.cs" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<html>
	<head>
		<title>
			<% Response.Write(Asi.ResourceManager.GetPhrase("ChartServer","Chart Server")); %>
		</title>
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
		<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</head>
	<body>
		<form method="post" runat="server">
		</form>
	</body>
</html>
