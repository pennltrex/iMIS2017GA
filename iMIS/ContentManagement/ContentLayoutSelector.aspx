<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ContenLayoutSelector" Title="Select layout" Codebehind="ContentLayoutSelector.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
    <style type="text/css">
    .Row {clear: both;}
    .LayoutBorder {padding: 2px 2px 2px 2px; }
    .LayoutSelector, .LayoutSelectorOver { padding: .5em .5em .5em .5em; float: left; font-size: 85%; width:8em; text-align: center; border: solid 1px white;}
    .LayoutSelectorOver { background-color: #CCCCCC; border: dotted 1px #888888; }
    #bd { border: 1px solid black; padding: 2px 2px 2px 2px; min-height: 6em; width: 7em;}
    #bd p { border: solid 1px white; text-align: center; background-color: Gray; font-weight: bold;}
    .shade {margin-top: 1px; min-height: 2em;}
    /*.yui-gb .yui-u {padding-left: .95em; padding-right: .95em;}*/
    
    /* Adjusts the display of the Bootstrap grid columns and rows when shown within the LayoutSelector */
    #layout div[class^="col"] {
        padding-left: 1px;
        padding-right: 1px;
    }
    #layout div[class^="col"] p {
        border: solid 1px white;
        text-align: center;
        background-color: gray;
    }
    #layout .row {
        margin-left: 0;
        margin-right: 0;
    }
    </style>
    <script type="text/javascript">
    function HighlightLayout(layout,on)
    {
        if (on)
            layout.className = 'LayoutSelectorOver';
        else if (layout.getAttribute('selected') == null)
                layout.className = 'LayoutSelector';
    }
    function SelectLayout(layout)
    {
        <asp:Literal id="oWindowDefinition" runat="server" />
        oWindow.result = layout.id;
        oWindow.Close();
        
    }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <div id="layout" class="no-mqs">
        <asp:Literal ID="Preview" runat="server"></asp:Literal>
    </div>
</asp:Content>

