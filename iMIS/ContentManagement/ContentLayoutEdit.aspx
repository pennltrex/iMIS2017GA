<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ContentLayoutEdit" Title="Edit layout" Codebehind="ContentLayoutEdit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
<style type="text/css">
#bd { border: 1px solid black; padding: 0px 2px 2px 2px; }
#bd p { text-align: center; padding-top: 4.5em; color: white; font-weight: bold;}
.layout {width: 50em; *width: 53em; padding: 10px 10px 10px 10px;}
#rightcontent { float: right; width:50%; }   
#leftcontent { float: left; width: 40%;}
.shade {background-color: gray; margin-top: 2px; min-height: 10em;}
/*.yui-gb .yui-u {padding-left: 2.95em; padding-right: 2.95em;}*/
#toolBoxHolder { text-align: left; }
#toolBoxHolder fieldset { border: 1px solid #ccc; padding: .5em; margin: .5em 0; width: 25em; clear: both; }
#toolBoxHolder p { padding-bottom: .25em }
/* Adjusts the display of the Bootstrap grid columns and rows only when they are shown within the GridBuilder. */
div[id*="gridBuilder"] div[class^="col"] {
    padding-left: 0 !important;
    padding-right: 0 !important;
    margin: 1px 0 -1px;
    border: 1px solid #fff;
    background-color: gray;
    min-height: 5em;
}
div[id*="gridBuilder"] .row {
    margin-left: 0;
    margin-right: 0;
}
</style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Placeholder ID="ContantLayoutHolder" runat="server"></asp:Placeholder>
</asp:Content>

