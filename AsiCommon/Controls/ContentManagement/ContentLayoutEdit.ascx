<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_ContentLayoutEdit" Codebehind="ContentLayoutEdit.ascx.cs" %>

<input type="hidden" id="RowSplitList" name="RowSplitList" />
<input type="hidden" id="SourceCode" name="SourceCode" />

<script type="text/javascript">
    function init() 
    { 
        YAHOO.CSSGridBuilder.init();
        SetupExisting();
        YAHOO.CSSGridBuilder.splitBody();   // Get the default code in case the user just hits Save.
    } 
    function saveCode() 
    {
        $get('SourceCode').value = YAHOO.CSSGridBuilder.getCode(); 
        $get('RowSplitList').value = YAHOO.CSSGridBuilder.getSplitList(); 
    }
</script>
<asiweb:PanelTemplateControl ID="LayoutEditorPanel" runat="server" ShowHeader="false" FieldSet="true" CssClass="layout" BorderStyle="None">
    <div id="leftcontent">
        <asiweb:SmartControl ID="LayoutTitle" runat="server" BoundPropertyName="Title" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
        <asiweb:SmartControl ID="LayoutDescription" runat="server" BoundPropertyName="Description" TextMode="MultiLine" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
        <div id="toolBoxHolder">
            <fieldset ID="fieldset" runat="server" >
                <legend style="display:inline !important;">Tool Box</legend>
                <div>
                    <p>Row:<br />
                        <select id="splitBody0">
                            <option value="1">1 Column (100)</option>
                            <option value="2">2 Column (50/50)</option>
                            <option value="7">2 Column (66/33)</option>
                            <option value="8">2 Column (33/66)</option>
                            <option value="9">2 Column (75/25)</option>
                            <option value="10">2 Column (25/75)</option>
                            <option value="3">3 Column (33/33/33)</option>
                            <option value="5">3 Column (50/25/25)</option>
                            <option value="6">3 Column (25/25/50)</option>
                            <option value="4">4 Column (25/25/25/25)</option>
                        </select>
                    </p>
                </div>
                <button type="button" id="addRow" class="TextButton">Add Row</button>
            </fieldset>
        </div>
    </div>
    <div id="rightcontent" class="no-mqs">
        <asp:PlaceHolder id="CodePlaceHolder" runat="server">
            <div id="bd">
                <p>&nbsp;</p>
            </div>
        </asp:PlaceHolder>
        <asp:HyperLink ID="CustomLink" runat="server" Text="Create custom layout"></asp:HyperLink>
    </div>
</asiweb:PanelTemplateControl>
