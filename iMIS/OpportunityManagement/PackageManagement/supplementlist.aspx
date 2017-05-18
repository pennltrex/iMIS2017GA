<%@ Page language="c#" %>
<%@ Register TagPrefix="uc1" TagName="List" Src="~/AsiCommon/Controls/PackageManagement/SupplementList.ascx" %>
<%@ Register TagPrefix="uc2" TagName="MainMenu" Src="~/AsiCommon/Controls/Main/MainMenu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="SecondaryMenu" Src="~/AsiCommon/Controls/Main/SecondaryMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!-- #Include virtual="~/iMIS/Main/SetRole.inc" -->	
<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
<HTML>
	<HEAD>
		<title><% Response.Write(Asi.ResourceManager.GetPhrase("iMIS","iMIS")); %></title>
       	<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
        <script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script> 
	</HEAD>

<body topmargin="0" leftmargin="0" class="iMISBody">

<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="1" width="800">
	<tr><td style="HEIGHT:5px"></td></tr>     
    <tr><form id="InsertList" method="post" runat="server">
      <td valign="top" align="center" class="StandardPanelLegacy">
		<uc1:List id="List1" runat="server"></uc1:List>
	  </td></form></tr></table>
	  </div></center>	
	</body>
</html>
