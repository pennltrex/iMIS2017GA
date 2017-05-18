<%@ Control Language="C#"
    Inherits="AsiCommon_Controls_ContentManagement_NavigationItemProperties" Codebehind="NavigationItemProperties.ascx.cs" %>
                  
    <telerik:dialogopener runat="server" id="DialogOpener1"/> 
        
    <asiweb:SmartControl ID="NavigationTitle" runat="server" BoundPropertyName="NavigationTitle" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl ID="NavigationFolderName" runat="server" BoundPropertyName="NavigationName" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper"/>
    <asiweb:SmartControl ID="ToolTipControl" runat="server" BoundPropertyName="Description" DisplayCaption="true" PositionCaption="Top" TextBoxWidth="26.5em"/>
    <asiweb:SmartControl ID="PrePublishURLControl" runat="server" BoundPropertyName="PrePublishURL" DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
    
    <asiweb:SmartControl ID="ParameterListControl" runat="server" BoundPropertyName="ParameterList" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl ID="BreadcrumbControl" runat="server" BoundPropertyName="BreadCrumbName" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
    <div class="SubItems AutoWidth">
        <asiweb:SmartControl ID="IsBreadCrumbHiddenControl" runat="server" BoundPropertyName="IsBreadCrumbHidden"
            DisplayCaption="true" PositionCaption="Right" />
    </div>
 
    <asiweb:SmartControl ID="OverrideContentTitleControl" runat="server" BoundPropertyName="OverrideContentTitle" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />    
    <asiweb:SmartControl ID="NavigationCodeControl" runat="server" BoundPropertyName="NavigationCode" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputLargeWrapper" />
    <asiweb:SmartControl ID="Attributes" runat="server" BoundPropertyName="NavigationAttributes" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputLargeWrapper" />
     
    <div style="clear: both;"></div> 
                              
    <div id="ImageManagerDiv" style="white-space:nowrap; display:inline-block; max-width:26.5em">
        <asiweb:SmartControl ID="ImageURL" runat="server" BoundPropertyName="ImageURL" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper"/>
        <a href="#" class="MarginLeft" onclick="$find('<%= DialogOpener1.ClientID %>').open('ImageManager', {CssClasses: []});return false;" style="margin-top:2em;display:inline-block"><%#GetTranslatedPhrase("select")%></a>
    </div> 
                
    <asiweb:SmartControl ID="CssClass" runat="server" BoundPropertyName="CssClass" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputLargeWrapper" />
    <div class="PanelField Top">
        <div class="PanelFieldLabel">
            <asiweb:BusinessLabel ID="ContentAreaFolderLabel" runat="server" AssociatedControlID="ContentAreaFolderControl"></asiweb:BusinessLabel>
        </div>
        <div class="PanelFieldValue FloatNone">
            <div class="SubItems">
                <%--<asp:UpdatePanel ID="ContentAreaFolderUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>--%>
                        <div style="clear:both;">
                            <asp:CheckBox ID="InheritContentAreaFolderFromParent" runat="server" Text="Inherit from parent" TextAlign="Right" 
                                AutoPostBack="true" OnCheckedChanged="InheritContentFolderFromParent_CheckedChanged" />
                        </div>
                        <asiweb:SmartControl ID="ContentAreaFolderControl" runat="server" BoundPropertyName="ContentAreaFolderPath" DisplayCaption="false" InputFieldCssClass="InputLargeWrapper" />
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
        </div>
    </div>

<asp:PlaceHolder id='PlaceHolder_editlink' runat='server'/>
<script type="text/javascript">
    //<![CDATA[
    var matchFolderNameToTitle = new AsiWebControls.MatchTextBehavior('<%= NavigationFolderName.ClientID %>_TextField', '<%= NavigationTitle.ClientID %>_TextField', "<%# string.IsNullOrEmpty(Navigation.NavigationName) %>" == "True", '<%# Asi.Business.ContentManagement.Navigation.FolderNameConvertRegularExpression %>');
    matchFolderNameToTitle.initialize();
    var matchBreadCrumbToTitle = new AsiWebControls.MatchTextBehavior('<%= BreadcrumbControl.ClientID %>_TextField', '<%= NavigationTitle.ClientID %>_TextField', "<%# string.IsNullOrEmpty(Navigation.BreadCrumbName) %>" == "True", null);
    matchBreadCrumbToTitle.initialize();

    function ImageManagerFunction(sender, args) {
        //If no file selected
        if (!args) {
            return false;
        }
        var webRoot = '<%= Asi.Web.Utilities.GetTildeExpansion() %>';       
        var selectedItem = args.get_value();
        var txt = $get('<%#ImageURL.ClientID%>_TextField');
        //Image manager gets handled differently for IE
        if ($telerik.isIE) {
            var path = selectedItem[0].outerHTML.replace('<img src="', '').replace('">', '').toLowerCase(); //this is the selected IMG tag element
            if (path.toLowerCase().indexOf("http") == -1) {
                txt.value = path.replace(webRoot, '~');
            } else {
                txt.value = path;
            }
            //Desktop sometimes need more cleanup
            if (txt.value.toLowerCase().indexOf('<img src="') > -1)
                txt.value = txt.value.replace('<img src="', '').replace('">', '');            
        } else {
            var path = args.value[0].getAttribute("src", 2).toLowerCase();
            if (path.toLowerCase().indexOf("http") == -1) {
                txt.value = path.replace(webRoot, '~');
            } else {
                txt.value = path;
            }
        }
        return true;
    }
    //]]>
</script>