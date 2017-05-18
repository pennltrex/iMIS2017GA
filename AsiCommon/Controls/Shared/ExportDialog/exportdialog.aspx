<%@ Page language="c#" %>
<%@ Register TagPrefix="uc1" TagName="ExportDialog" Src="~/AsiCommon/Controls/Shared/ExportDialog/ExportDialog.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title> <% Response.Write(Asi.ResourceManager.GetPhrase("OptionsDialog","Options Dialog")); %>
		</title>
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
        <script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
</head>
	<body>
		<form id="ExportDialog" method="post" runat="server">
			<uc1:ExportDialog id="ExportDialog1" runat="server"></uc1:ExportDialog>
		</form>
	</body>
</html>
