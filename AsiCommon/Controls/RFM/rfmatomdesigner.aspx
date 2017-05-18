<%@ Page language="c#" %>
<%@ Register TagPrefix="uc1" TagName="RFMAtomDesigner" Src="RFMAtomDesigner.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>
			<% Response.Write(Asi.ResourceManager.GetPhrase("RFMDesigner","RFM Analytics Designer")); %>
		</title>
		<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
		<script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/StyleSheet.js"></script>
		<script language="JavaScript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/System.js"></script>
	</HEAD>
	<body>
		<form id="RFMPEDesigner" method="post" runat="server">
			<uc1:RFMAtomDesigner id="RFMAtomDesigner1" runat="server"></uc1:RFMAtomDesigner>
		</form>
	</body>
</HTML>
