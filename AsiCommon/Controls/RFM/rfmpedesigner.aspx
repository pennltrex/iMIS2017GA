<%@ Page language="c#"%>
<%@ Register TagPrefix="uc1" TagName="RFMPEDesigner" Src="RFMPEDesigner.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>
			<% Response.Write(Asi.ResourceManager.GetPhrase("RFMDesigner","RFM Analytics Designer")); %>
		</title>
		<!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
		<!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
		
        <script type="text/javascript" language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
	</head>
	<body>
		<form id="RFMPEDesigner" method="post" runat="server">
			<uc1:RFMPEDesigner id="RFMPEDesigner1" runat="server"></uc1:RFMPEDesigner>
		</form>
	</body>
</html>
