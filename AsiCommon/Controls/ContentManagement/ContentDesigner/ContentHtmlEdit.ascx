<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentHtmlEdit" Codebehind="ContentHtmlEdit.ascx.cs" %>

<asiweb:PanelTemplateControl ID="HtmlFields" runat="server" ShowHeader="false" FieldSet="true" BorderStyle="None">
    <div class="AutoWidth">
        <div class="Section" id="ShowBorderControlDiv">
            <asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" PositionCaption="Right"/>
        </div>
        <div runat="server" id="ErrorMessageDiv" class="Error">
            <asiweb:BusinessLabel runat="server" ID="LabelErrorMessage"></asiweb:BusinessLabel>
            <a runat="server" ID="MessageLink"></a>
        </div>
        <asiweb:BusinessHtmlEditor ID="BodyInput" runat="server" BoundPropertyName="Body" CssClass="ContentHtmlEditor" EnableFullScreenToggle="true"  
           OnClientLoad="InitializeRadEditor" EnableInsertContentLinkButton="true" style="display:block;margin-left:auto;margin-right:auto;width:100%;"/>
    </div>        
</asiweb:PanelTemplateControl>

<script type="text/javascript">
    //<![CDATA[
    document.styleSheets[0].insertRule('.reResizeCell{display:none!important;}', 0);
    document.styleSheets[0].insertRule('.PanelField label{width:5em!important;}', 0);
    jQuery(".reLayoutWrapper").height(GetViewportHeight() - 250);
    jQuery(".ContentHtmlEditor").height(jQuery(".reLayoutWrapper").height());
     
    function InitializeRadEditor(editor) {
        // Add a custom filter to change the encoded brackets ("%5B" and "%5D") back into brackets ("[" and "]").
        // This is needed so that the 'iMIS variables' (e.g. "[Website]") get resolved (e.g. to "http://localhost/imis/MBR").
        // It is specific to IE (no idea why IE encodes those).
        editor.get_filtersManager().add(new BracketFilter());
    }
    BracketFilter = function ()
    {
        BracketFilter.initializeBase(this);
        this.set_isDom(false); // Specify that the content parameter of the getHtmlContent and getDesignContent functions will return a String.
        this.set_enabled(true);
        this.set_name("Content Html filter");
        this.set_description("Converts encoded brackets back into brackets");
    };
    BracketFilter.prototype =
    {
        // Called when the editor is moving from some other mode to HTML mode.
        getHtmlContent: function (content)
        {
            var decodedContent = content;
            // First parameter is a regex to replace all occurrences.
            decodedContent = decodedContent.replace(/%5B/g, "[");
            decodedContent = decodedContent.replace(/%5D/g, "]");
            return decodedContent;
        },
        // Called when the editor is moving from some other mode to DESIGN mode.
        getDesignContent: function (content)
        {
            var decodedContent = content;
            // First parameter is a regex to replace all occurrences.
            decodedContent = decodedContent.replace(/%5B/g, "[");
            decodedContent = decodedContent.replace(/%5D/g, "]");
            return decodedContent;
        }
    };
    BracketFilter.registerClass('BracketFilter', Telerik.Web.UI.Editor.Filter);
    //]]>
</script>