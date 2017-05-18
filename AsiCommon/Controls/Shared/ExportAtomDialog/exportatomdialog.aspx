<%@ Page Language="c#" %>

<%@ Register TagPrefix="uc1" TagName="ExportAtomDialog" Src="~/AsiCommon/Controls/Shared/ExportAtomDialog/ExportAtomDialog.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
<head>
    <title>
        <% Response.Write(Asi.ResourceManager.GetPhrase("OptionsDialog", "Options Dialog")); %>
    </title>
    <!-- #Include virtual="~/AsiCommon/Includes/Page_OnInit.inc" -->
    <!-- #Include virtual="~/AsiCommon/Includes/Document_Head_BaseUri.inc" -->
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <!-- #Include virtual="~/AsiCommon/Includes/Document_Head_Script.inc" -->
</head>
<body>
    <form id="ExportDialog" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/AsiCommon/Scripts/Jquery/jquery.min.js" />
        </Scripts>
    </asp:ScriptManager>
    <uc1:ExportAtomDialog ID="ExportAtomDialog1" runat="server"></uc1:ExportAtomDialog>
    </form>
    <script language="javascript" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Scripts/Asi.js"></script>
    <script language="javascript">
        putPopupOnTop();

        function putPopupOnTop() {
            var parentiFrame = parent.document; //returns the iFrame above this one containing popup
            if (typeof (parentiFrame) == "undefined" || parentiFrame.length < 1) {
                return;
            }
            var targetForm = parentiFrame.forms["aspnetForm"]; //returns the form whose division needs to be on top
            if (typeof (targetForm) == "undefined" || targetForm.length < 1) {
                return;
            }
            var targetDiv = jQuery(targetForm).find(".RadWindow"); //returns the div of the rad window
            if (typeof (targetDiv) == "undefined" || targetDiv.length < 1) {
                return;
            }
            jQuery(targetDiv).css("z-index", 99999);
        }
            
    </script>
</body>
</html>
