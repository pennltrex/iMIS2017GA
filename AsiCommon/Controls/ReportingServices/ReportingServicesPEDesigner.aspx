<%@ Register TagPrefix="uc1" TagName="ReportingServicesPEDesigner" Src="~/AsiCommon/Controls/ReportingServices/ReportingServicesPEDesigner.ascx" %>
<%@ Page language="c#"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
		<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<html>
	<head>
	<title>
	<% Response.Write(Asi.ResourceManager.GetPhrase("ReportingServicesDesigner","ReportingServices Designer")); %>
	</title>

		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
		<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</head>
	<body>
		<form id="ReportingServicesPEDesigner" method="post" runat="server">
			<uc1:ReportingServicesPEDesigner id="ReportingServicesPEDesigner1" runat="server"></uc1:ReportingServicesPEDesigner>
		</form>
	</body>
</html>
