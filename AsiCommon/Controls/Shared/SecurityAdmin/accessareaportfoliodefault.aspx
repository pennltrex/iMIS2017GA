<%@ Page language="c#" Inherits="Asi.WebRoot.AsiCommon.Controls.Shared.SecurityAdmin.AccessAreaPortfolioDefault" Codebehind="AccessAreaPortfolioDefault.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="AccessAreaPortfolio" Src="AccessAreaPortfolio.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<html>
	<head>
		<title>
		<% Response.Write(Asi.ResourceManager.GetPhrase("AccessList","Access List")); %>
		</title>
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
			<uc1:AccessAreaPortfolio id="AccessAreaPortfolio" runat="server"></uc1:AccessAreaPortfolio>
		</form>
	</body>
</html>
