<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataShowcaseConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Common.DataShowcase.DataShowcaseConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="showcase" TagName="ShowcaseDataSources" Src="DataShowcaseDataSources.ascx" %>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" Collapsible="False"
    ShowHeader="False" BorderStyle="None">
    
    <div class="AutoWidth">
        <asiweb:SmartControl 
        ID="HideOnError" runat="server" 
        BoundPropertyName="HideOnError" DisplayCaption="true" 
        PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>

    <div class="PanelField">
        <label>Data sources</label>
        <div class="PanelField Bottom">
            <showcase:ShowcaseDataSources runat="server" ID="DataSourcesControl" />
        </div>
    </div>

    <div style="clear: both;"></div>

</asiweb:PanelTemplateControl>

<asiweb:BusinessHtmlEditor ID="ContentHtmlEditor" runat="server"
    CssClass="ContentHtmlEditor" OnClientLoad="RadEditorSetSize" EnableInsertContentLinkButton="true" style="width:95%;" />

<script type="text/javascript">
    //<![CDATA[
    var contentHtmlEditor = null;

    jQuery(function () { OnLoad(); });

    function OnLoad() {
        jQuery(window).resize(Window_OnResize);
    }

    function Window_OnResize() {
        if (contentHtmlEditor == null) return;
            //RadEditorSetSize(contentHtmlEditor);
    }

    // Set the size of the RadEditor so that it fills the available space.
    function RadEditorSetSize(editor) {
       
        contentHtmlEditor = editor;
        var rwindow = GetRadWindow();
        if (rwindow == null) {
            alert('no window');
            return;
        }
        var width = rwindow.get_width() - 50;
        height = 400;
        editor.setSize(width, height);

        // Add a custom filter to change the encoded brackets ("%5B" and "%5D") back into brackets ("[" and "]").
        // This is needed so that the 'iMIS variables' (e.g. "[Website]") get resolved (e.g. to "http://localhost/imis/MBR").
        // It is specific to IE (no idea why IE encodes those).
        editor.get_filtersManager().add(new BracketFilter());
    }

    BracketFilter = function () {
        BracketFilter.initializeBase(this);
        this.set_isDom(false); // Specify that the content parameter of the getHtmlContent and getDesignContent functions will return a String.
        this.set_enabled(true);
        this.set_name("Content Html filter");
        this.set_description("Converts encoded brackets back into brackets");
    };
    BracketFilter.prototype =
    {
        // Called when the editor is moving from some other mode to HTML mode.
        getHtmlContent: function (content) {
            var decodedContent = content;
            // First parameter is a regex to replace all occurrences.
            decodedContent = decodedContent.replace(/%5B/g, "[");
            decodedContent = decodedContent.replace(/%5D/g, "]");
            return decodedContent;
        },
        // Called when the editor is moving from some other mode to DESIGN mode.
        getDesignContent: function (content) {
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
