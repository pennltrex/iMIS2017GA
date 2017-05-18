<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Print Preview" Inherits="Asi.Web.UI.DisplayPageBase" %>

<script runat="server">
    public override Asi.Web.UI.TemplateType TemplateType
    {
        get
        {
            return Asi.Web.UI.TemplateType.P;
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
    <style type="text/css">
        .NotPrinted
        {
            display: none !important;
        }
        @media print
        {
        	#CloseButton
        	{
        		display: none;
        	}
        }
    </style>
</asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <div style="float: right; white-space: nowrap; padding-right: 30px;">
        <input type="button" value="Close" onclick="window.close();" id="CloseButton" />
    </div>
    <div style="clear: both;" />
    <div id="PrintArea"></div>
    <script type="text/javascript" language="javascript">
        var printArea = document.getElementById('PrintArea');
        
        // Wherever the source HTML came from, we want to fix up any relative images and links to be absolute and correct.
        var baseUrl = window.opener.location.href;
        baseUrl = baseUrl.substring(0, baseUrl.lastIndexOf('/') + 1);
        var re = new RegExp('(href|src)=\\"(?!(\\w+://|/))', "g");
        printArea.innerHTML = window.opener.document.getElementById('MainPanel').innerHTML.replace(re, "$1=\"" + baseUrl);
        window.print();
    </script>
</asp:Content>