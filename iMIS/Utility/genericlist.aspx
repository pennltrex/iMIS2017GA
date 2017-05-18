<%@ Page language="c#" Inherits="Asi.WebRoot.iMIS.Utility.GenericList" Codebehind="GenericList.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="List" Src="~/AsiCommon/Controls/Shared/Utility/GenericList.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<HTML>
	<HEAD>
		<title><% Response.Write(Asi.ResourceManager.GetPhrase("CodesList","Codes List")); %></title>
       	<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
        <script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</HEAD>
	<body class="iMISPanelBody">
		<form method="post" runat="server">
			<uc1:List id="List1" runat="server"></uc1:List>
		</form>
	</body>
</HTML>
