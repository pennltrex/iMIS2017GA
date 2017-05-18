<%@ Page language="c#"%>
<%@ Register TagPrefix="uc1" TagName="ReportingServicesPreview" Src="~/AsiCommon/Controls/ReportingServices/ReportingServicesPreview.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<html>
	<head>
	<title>
	<% Response.Write(Asi.ResourceManager.GetPhrase("ReportingServicesPreview","ReportingServices Preview")); %>
	</title>
		 <!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
		<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</head>
	<body MS_POSITIONING="GridLayout">
		<form id="ReportingServicesPreview" method="post" runat="server">
		<uc1:ReportingServicesPreview id="ReportingServicesPreview1" runat="server"></uc1:ReportingServicesPreview>
		</form>
	</body>
</html>
