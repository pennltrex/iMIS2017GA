<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_WebPartLayout" Codebehind="WebPartLayout.ascx.cs" %>
<%@ Import Namespace="Asi" %>
<%@ Register Namespace="Asi.Web" TagPrefix="asiweb" %>
<%@ Register Src="~/AsiCommon/Controls/ContentManagement/SubjectControlTester.ascx" TagName="SubjectControl" TagPrefix="uc1" %>
<asp:PlaceHolder id='PlaceHolder_editlink' runat='server'/>
<script type="text/javascript">
    //<![CDATA[
    function OpenLayoutDialog() {
        var list = document.getElementById('<%= LayoutDocumentVersionKey.PrincipalControlClientID %>');
        if (list != null) {
            ShowDialog('<%= Utilities.GetTildeExpansion() %>/iMIS/ContentManagement/ContentLayoutSelector.aspx?LayoutType=Content&LayoutKey=' + list.value, null, 525, 400, 'Select layout', null, null, ChangeLayout, null, false, true, null);
        } 
    }
    function ChangeLayout(dialogWin) {
        if (!dialogWin.result)
            return;
        var list = document.getElementById('<%= LayoutDocumentVersionKey.PrincipalControlClientID %>');
        if (list == null) {
            list = document.getElementById('<%= WebsiteLayoutDocumentVersionKey.PrincipalControlClientID %>');
        }

        list.value = dialogWin.result;
        __doPostBack('__Page'); //DT6268 - changed list.onchange() to a postback, avoiding error from null event
    }
    function ContentItemEdit_Callback(dialogWin) {
        if (dialogWin.IsDirty)
            InitiateControlEventWithArgument('<%= RefreshButton.ClientID %>', '');
    }
//]]>
</script>

<asp:Panel id="Panel1" runat="server">
    
    <asiweb:AsiWebPartManager id="WebPartManager1" runat="server" />
       
    <asiweb:PanelTemplateControl2 BorderStyle="none" Collapsed="false" DisplayCollapseText="true" CollapsedText="View details" DistinguishHeader="false" ExpandedText="Hide details" FieldSet="false" ID="FieldsPanel" runat="server">
     
        <asp:Panel runat="server" ID="ThemeSelectDiv" CssClass="FloatRight" Visible="False">
            <asp:Label runat="server" AssociatedControlID="ThemeListDropDown" CssClass="AddPadding"><%# ResourceManager.GetPhrase("PreviewTheme","Preview theme") %></asp:Label> <asiweb:BusinessDropDownList AutoPostBack="true" id="ThemeListDropDown" IncludeNullItem="false" runat="server" />
        </asp:Panel>

        <asiweb:PanelTemplateColumn runat="server" >
            <asiweb:SmartControl ID="ContentTitle" runat="server" OnNeedBoundAtom="ContentTitle_NeedBoundAtom" UseParentControlBusinessItem="false" BoundPropertyName="ContentTitle" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        </asiweb:PanelTemplateColumn> 

        <asiweb:PanelTemplateColumn runat="server">
            <div class="AutoWidth">
                <asiweb:SmartControl ID="UseDynamicPageTitle" runat="server" OnNeedBoundAtom="UseDynamicPageTitle_NeedBoundAtom" UseParentControlBusinessItem="false" BoundPropertyName="UseDynamicPageTitle" DisplayCaption="True" PositionCaption="Right" />
            </div>
        </asiweb:PanelTemplateColumn>
        
        <asiweb:SmartControl ID="PublishFileName" runat="server" OnNeedBoundAtom="PublishFileName_NeedBoundAtom" UseParentControlBusinessItem="false" BoundPropertyName="ContentName" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
        
        <div id="PublishFileNameMessage" class="PanelField Left" style="display:none;">
            <div class="PanelFieldLabel" translate="no"><label>&nbsp;</label></div>
            <div class="PanelFieldValue Important ValidationError" translate="yes">
                Another website template or master page with this publish file name already exists.
            </div>
        </div>
        
        <asp:panel id="WebsiteLayoutPanel" runat="server" class="PanelField Left" Visible="false">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelLayoutDocumentVersionKey" Text="Layout" AssociatedControlID="WebsiteLayoutDocumentVersionKey"/>
            </div>  
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList id="WebsiteLayoutDocumentVersionKey" runat="server" AutoPostBack="true" DisplayCaption="false"/>
            </div>         
        </asp:panel>

        <asp:panel id="PublishDetailsPanel" runat="server" >
                       
            <asiweb:SmartControl ID="LayoutDocumentVersionKey" runat="server" OnNeedBoundAtom="LayoutDocumentVersionKey_NeedBoundAtom" UseParentControlBusinessItem="false" AutoPostBack="true" BoundPropertyName="LayoutDocumentVersionKey" DisplayCaption="true" PositionCaption="Left" style="white-space:nowrap;" >
                &nbsp;<asp:Image id="LayoutButton" runat="server" ImageUrl="~/AsiCommon/images/16/16_page_layout.gif" ToolTip="Select layout visually" onclick="OpenLayoutDialog();" ImageAlign="AbsMiddle"/>
            </asiweb:SmartControl>

            <div class="PanelField Left" style="clear:both;padding-top:3px;">     
                <div style="display: inline;">
                    <asp:Label ID="PublishLocationCaption" runat="server" AssociatedControlID="PublishLocationLink" />
                </div>
                <div class="PanelFieldValue">   
            
                    <div id="LinkButtons" style="float:left; clear: both;">
                
                        <asp:HyperLink ID="PublishLocationLink" runat="server" Target="_blank"/>
                        <br /><asiweb:StyledLabel ID="lblCopyInfo" runat="server"/>
                        <div>
                            <asiweb:StyledButton ID="CopyURLbutton" runat="server" style="float:none;"  />
                            <asiweb:StyledButton ID="CopyFreelinkButton" runat="server" style="float:none;" />
                            <asiweb:BusinessTextBox ID="TexttoCopyControl" ReadOnly="true" runat="server" style="width: 25em;float:none; vertical-align:middle;"/>
                        </div>

                    </div>

                </div>
            </div>
        </asp:panel>
       
        <div id="ContentCreateNavigationEditableControls" runat="server" style="display:none">
            <asiweb:SmartControl ID="CreateNavigationItemInput" runat="server" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true"
                OnDataChange="CreateNavigationItemInput_DataChange"
                OnNeedBoundAtom="CreateNavigationItemInput_NeedBoundAtom" BoundPropertyName="CreateNavigationOnPublish" RenderPanelField="true" />
            <div class="SubItems">
                <asiweb:SmartControl ID="NavigationLinkTextInput" runat="server" RenderPanelField="true" DisplayCaption="True" 
                    OnNeedBoundAtom="NavigationLinkTextInput_NeedBoundAtom" BoundPropertyName="NavigationLinkText" />
                <asiweb:SmartControl ID="NavigationLocationInput" runat="server" DisplayCaption="true" AutoPostBack="true" InputFieldCssClass="InputXLargeWrapper"
                    OnNeedBoundAtom="NavigationLocationInput_NeedBoundAtom" BoundPropertyName="NavigationLocation" OnDataChange="NavigationLocationInput_DataChange" />        
            </div>
        </div>
        <div id="ContentCreateNavigationReadonlyControls" runat="server" style="display:none">
            <h6>Navigation to be created upon publish</h6>
            <div class="SubItems">
                <asiweb:BusinessLabel runat="server" ID="NavigationLinkTextCaption" RenderPanelField="True" DisplayCaption="True" 
                    OnNeedBoundAtom="NavigationLinkTextCaption_NeedBoundAtom" BoundPropertyName="NavigationLinkText"  />
                <asiweb:BusinessLabel runat="server" ID="NavigationLocationCaption" RenderPanelField="True" DisplayCaption="True"
                    OnNeedBoundAtom="NavigationLocationCaption_NeedBoundAtom" BoundPropertyName="NavigationLocation"  />
            </div>
        </div>
    </asiweb:PanelTemplateControl2> 
    
    <asp:Panel ID="MessageControlPanel" runat="server"></asp:Panel>

    <div id="Div1" style="width:30em;" runat="server" visible="false">
        <asiweb:AsiWebPartZone ID="SubjectControlZone" runat="server" AllowLayoutChange="false" BorderStyle="None" EditVerb-Visible="false" WebPartVerbRenderMode="TitleBar">
            <ZoneTemplate>
                <uc1:SubjectControl ID="SubjectControl" runat="server" Title="Subject" UseKeyFromURL="false" />
            </ZoneTemplate>
        </asiweb:AsiWebPartZone>
    </div>
   
    <div style="clear:both;"></div>

    <asp:UpdatePanel ID="LayoutUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="LayoutDocumentVersionKeyId" runat="server" />
            <asp:HiddenField ID="CurrentLayoutKey" runat="server" />
            <asiweb:AsiWebPartConnectionsZone ID="ConnectionZone1" runat="server" CloseVerb-Visible="false" />
            <asiweb:AsiWebPartEditorZone ID="EditorZone1" runat="server">
                <ZoneTemplate>
                    <asp:PropertyGridEditorPart ID="PropertyGridEditor" runat="server" />
                </ZoneTemplate>
            </asiweb:AsiWebPartEditorZone>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ConnectionZone1" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Panel>    

<asp:HiddenField ID="CurrentHolder" runat="server" />
<asp:PlaceHolder ID="ContentPlaceholderA" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="ContentPlaceholderB" runat="server" Visible="false"></asp:PlaceHolder>
<asp:Button runat="server" id="RefreshButton" style="display:none" CausesValidation="False" Text=""></asp:Button>

<script type="text/javascript">
    //<![CDATA[
    //Get text to copy.
    function copyController(isFreeLink) {

        if (isFreeLink) {
            // If the content record has a content code, that makes a better freelink target.
            var text = '<%= ContentRecord.ContentCode %>';
            if (text.length == 0)
                text = "[[" + document.getElementById("<%=PublishFileName.PrincipalControlClientID%>").value + "]]";
            else
                text = '[[' + text + ']]';
            setClipBoardText(text);
        }
        else {

            var text = document.getElementById("<%=PublishLocationLink.ClientID%>").innerHTML;
            setClipBoardText(text);
        }
    }

    // Sets and selects text to copy.
    function setClipBoardText(text) {
        var elm = document.getElementById("<%=TexttoCopyControl.PrincipalControlClientID%>");
        if (elm != null) {
            elm.value = text;
            elm.focus();
            elm.select();
        }
    }

    function masterPageNameExists(fileName) {
        if (fileName == null) return;
        var obj = {};
        obj.filename = fileName;
        jQuery.ajax({
            type: "POST",
            url: gWebRoot + "/WebMethodUtilities.aspx/MasterPageFileNameExists",
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                var buttonsDisabled = false;
                var display = "none";
                if (result.d === true) {
                    buttonsDisabled = true;
                    display = "block";
                } 
                jQuery("#PublishFileNameMessage").css("display", display);
                jQuery(".SaveAndClose").prop("disabled", buttonsDisabled);
                jQuery(".Save").prop("disabled", buttonsDisabled);
            },
            async: true
        });
    }

    // Script that allows us to match the title and the publish folder name text fields
    var matchPublishFileNameToTitle = new AsiWebControls.MatchTextBehavior('<%= PublishFileName.ClientID %>_TextField', '<%= ContentTitle.ClientID %>_TextField', "<%# string.IsNullOrEmpty(ContentRecord.ContentName) %>" == "True", '<%# Asi.Business.ContentManagement.Navigation.FolderNameConvertRegularExpression %>');

    jQuery(document).ready(function () {
        var findMasterWrapper = jQuery("#masterWrapper");
        if (findMasterWrapper.length > 0) {
            if (findMasterWrapper.find(".col-secondary.cs-left").length > 0) {
                findMasterWrapper.addClass("has-secondary-col col-on-left");
            }
            if (findMasterWrapper.find(".col-secondary.cs-right").length > 0) {
                findMasterWrapper.addClass("has-secondary-col col-on-right");
            }
        }
    });
    //]]> 
</script>