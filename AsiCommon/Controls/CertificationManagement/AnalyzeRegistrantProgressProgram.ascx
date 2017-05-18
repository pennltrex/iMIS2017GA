<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.AnalyzeRegistrantProgressProgram" Codebehind="AnalyzeRegistrantProgressProgram.ascx.cs" %>

<script type="text/javascript">
    function ProgramDetails_Callback(oWindow)
    {
        var hiddenField = jQuery('input[id$="hiddenForceRedraw"]');
        if (hiddenField != undefined)
            hiddenField.val("1");
       
        document.forms[0].submit();
    }
</script>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" ShowHeader="false" BorderStyle="None" />
<input type="hidden" id="hiddenForceRedraw" runat="server" />    