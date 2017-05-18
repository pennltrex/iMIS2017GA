<%@ Page language="c#" %>
<%@ Register TagPrefix="workflow" TagName="WorkflowDesigner" Src="~/AsiCommon/Controls/WorkflowManagement/WorkflowDesigner.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Workflow Designer</title>
		
		<link type="text/css" rel="stylesheet" href="<%= Asi.Web.Utilities.GetTildeExpansion() %>/Templates/BSA/StyleSheets/BSA.css">
		
      <script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<workflow:WorkflowDesigner id="WorkflowDesigner1" runat="server"></workflow:WorkflowDesigner>
		</form>
	</body>
</html>