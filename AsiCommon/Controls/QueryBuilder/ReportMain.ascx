<%@ Reference Control="~/asicommon/controls/querybuilder/designshell.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.ReportMain" Codebehind="ReportMain.ascx.cs" %>
<%@ Register TagPrefix="rsweb" Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"  Namespace="Microsoft.Reporting.WebForms"  %>

<script language="javascript" type="text/javascript">
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserCallback(radWindow)
    {
        if (!radWindow.result)
            return;
		document.getElementById(FolderHierarchyKeyID).value = radWindow.result;
		document.getElementById(SaveAsFilenameID).value = radWindow.Filename;
		submitForm(document.getElementById(FolderHierarchyKeyID));
    }
    
</script>
<input type="hidden" id="FolderHierarchyKey" runat="server" onserverchange="SaveRdlToiMis" name="FolderHierarchyKey" />
<input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" />
<asp:PlaceHolder ID="MainMessagePlaceHolder" Runat="server"></asp:PlaceHolder>
<asp:Label id="ErrorMsgLabel" runat="server"></asp:Label>
<asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server"></asp:PlaceHolder>