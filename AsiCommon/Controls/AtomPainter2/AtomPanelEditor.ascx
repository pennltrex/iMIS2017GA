<%@ Control Language="c#" Inherits="AsiCommon_Controls_AtomPainter2_AtomPanelEditor" AutoEventWireup="true" Codebehind="AtomPanelEditor.ascx.cs" %>
<%@ Register TagPrefix="uc2" TagName="AtomExplorer" Src="~/AsiCommon/Controls/AtomPainter2/AtomPanelExplorer.ascx" %>

<script id="EditorScript" type="text/javascript">
    var _editor;
    function SDOnClientLoad(editor) {
        _editor = editor;
        AttachToolbar();

        // Add a custom filter to fix an issue in IE where code (the "asiweb:" tag prefix) 
        // is duplicated with every switch between DESIGN and HTML mode.
        editor.get_filtersManager().add(new DuplicateCodeFilter());
    }
    DuplicateCodeFilter = function () {
        DuplicateCodeFilter.initializeBase(this);
        this.set_isDom(false); // Specify that the content parameter of the getHtmlContent and getDesignContent functions will return a String.
        this.set_enabled(true);
        this.set_name("Duplicate Code Filter");
        this.set_description("Removes extra 'asiweb:' tag prefixes");
    };
    DuplicateCodeFilter.prototype =
    {
        // Called when the editor is moving from some other mode to HTML mode.
        getHtmlContent: function (content) {
            var decodedContent = content;
            // First parameter is a regex to replace all occurrences of duplicate 
            // "asiweb:" tag prefixes with a single "asiweb:" tag prefix.
            decodedContent = decodedContent.replace(/ASIWEB:ASIWEB:/gi, "asiweb:");
            return decodedContent;
        },
        // Called when the editor is moving from some other mode to DESIGN mode.
        getDesignContent: function (content) {
            var decodedContent = content;
            // First parameter is a regex to replace all occurrences of duplicate 
            // "asiweb:" tag prefixes with a single "asiweb:" tag prefix.
            decodedContent = decodedContent.replace(/ASIWEB:ASIWEB:/gi, "asiweb:");
            return decodedContent;
        }
    };
    DuplicateCodeFilter.registerClass('DuplicateCodeFilter', Telerik.Web.UI.Editor.Filter);

    function SDPropertyButtonClick(target) {
        // Check to see if we're inside another property; if so, place the new one before the old.
        var theSelectionObject = _editor.getSelection();
        var theSelectionParent = theSelectionObject.GetParentElement();
        var containingBlock = findAncestorElement(theSelectionParent, [IMIS_TAG_LABEL, IMIS_TAG_HYPERLINK]);
        if (containingBlock != null) {
            containingBlock.parentNode.removeChild(containingBlock);
            _editor.pasteHtml(' ' + target.getAttribute('XMLData') + ' ');
            _editor.pasteHtml(' ' + containingBlock.outerHTML + ' ');
        }
        else
            _editor.pasteHtml(' ' + target.getAttribute('XMLData') + ' ');
        return CancelEvent();
    }
</script>

<style type="text/css">
    .IfBlockStart, .IfBlockEnd
    {
        font-size: larger;
        font-weight: bolder;
        color: Gray;
    }
</style>

<asp:Panel ID="PropertiesPanel" runat="server" Height="70%">
    <asiweb:PanelTemplateControl2 ID="PropertiesPanelControl" runat="server" FieldSet="true" TemplateTitle="Properties">
        <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="10em">
            <asiweb:SmartControl ID="Name" runat="server" BoundPropertyName="Name" DisplayCaption="true" />
            <asiweb:SmartControl ID="SmartControl1" runat="server" BoundPropertyName="Description" DisplayCaption="true" />
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="Column2" runat="server" LabelWidth="10em">
            <%--<asiweb:SmartControl ID="IsPage" runat="server" BoundPropertyName="IsPage" DisplayCaption="true" /><br />--%>
            <asiweb:SmartControl ID="PanelType" runat="server" BoundPropertyName="Type" DisplayCaption="true" OnDataChange="PanelType_DataChange" ListSearchEnabled="false" />
            <asiweb:SmartControl ID="Purpose" runat="server" BoundPropertyName="Purpose" DisplayCaption="true" ListSearchEnabled="false" />
                <asiweb:SmartControl ID="DefaultForPurpose" runat="server" BoundPropertyName="DefaultForPurpose" DisplayCaption="true" PositionCaption="Right" Style="white-space:nowrap;" InputFieldStyle="width:20px" />
        </asiweb:PanelTemplateColumn>
        <div style="clear:both;">
            <asp:Button ID="ParametersButton" runat="server" Text="Parameters" OnClientClick="return CancelEvent();" />
            <asp:Button ID="PreviewButton" runat="server" Text="Preview" OnClientClick="return CancelEvent();" />
            <asp:Button ID="RefreshButton" runat="server" Text="Refresh" OnClick="RefreshButton_Click" />
        </div>
    </asiweb:PanelTemplateControl2>
</asp:Panel>

<asp:Panel ID="ContentPanel" runat="server">
    
    <asp:Panel ID="EditorPanel" runat="server" CssClass="col-sm-9">
        
        <asp:RadioButtonList ID="CurrentPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CurrentPage_SelectedIndexChanged"
            RepeatLayout="Flow" RepeatDirection="Horizontal" Visible="false"></asp:RadioButtonList>
        <asp:Button ID="AddPageButton" runat="server" Text="Add Page" OnClick="AddPageButton_Click" Visible="false" />
        <asp:Button ID="DeletePageButton" runat="server" Text="Add Page" OnClick="DeletePageButton_Click" Visible="false" />
        
        <asiweb:BusinessHtmlEditor ID="RadEditor1" runat="server" 
            CssClass="ContentHtmlEditor"
            OnClientLoad="SDOnClientLoad" 
            EditModes="Design,Html" 
            UseDefaultToolbarHandlers="true" 
            ToolsFile="~/AsiCommon/Controls/AtomPainter2/ToolsFile_TaggedListFormatEditor.xml"
            DeletePaths="UploadedImages" 
            UploadPaths="~/AsiCommon/Images/UploadedImages" 
            ImagesPaths="~/Images/ImageLibrary,~/Images/UploadedImages"
            Height="500" Width="100%" style="width:100%!important;" AutoResizeHeight="true" />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadEditor1" EnableClientScript="true" Display="Dynamic" ErrorMessage="Format design cannot be empty." />
        
 <script type="text/javascript" id="LinkTool">
     function AttachToolbar() {
         Telerik.Web.UI.Editor.CommandList["iMISLabelTool"] = function (commandName, editor, args) {
             theEditor = null;

             var theSelectionObject = editor.getSelection();
             if (theSelectionObject == null) {
                 alert('Error: Selection is null');
                 return;
             }

             var theSelectionParent = theSelectionObject.GetParentElement();

             // Need an object to pass to the dialog.  
             var theImisLabel = findAncestorElement(theSelectionParent, IMIS_TAG_LABEL);
             if (theImisLabel != null) {
                 args.BoundPropertyName = theImisLabel.getAttribute('BoundPropertyName');
                 args.DisplayValue = theImisLabel.getAttribute('DisplayValue');
                 args.DisplayMask = theImisLabel.getAttribute('DisplayMask');
             }
             else
                 args.DisplayValue = 'true';

             theEditor = editor;
             editor.showExternalDialog(gWebRoot + '/AsiCommon/Controls/AtomPainter2/Dialogs/LabelProperties.aspx?ComponentKey=<%= ComponentExplorer.ComponentKey.ToString() %>&PreserveStatefulBusinessContainer=True&ParentPageInstanceKey=<%= ((Asi.Web.UI.DisplayPageBase)Page).PageInstanceKey %>', args, 600, 400, labelToolCallbackFunction, null, '', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize, false, true);

                };
                Telerik.Web.UI.Editor.CommandList["iMISLinkTool"] = function (commandName, editor, args) {
                    theEditor = null;

                    var theSelectionObject = editor.getSelection();
                    if (theSelectionObject == null) {
                        alert('Error: Selection is null');
                        return;
                    }

                    var theSelectionParent = theSelectionObject.GetParentElement();

                    // Need an object to pass to the dialog.  
                    // First we look for an existing
                    // link that we're editing.  Failing that, we look for an existing label
                    // that we can convert to a link.  Failing that, we create a new empty link.
                    var theImisLink = findAncestorElement(theSelectionParent, IMIS_TAG_HYPERLINK);
                    if (theImisLink == null) {
                        var theImisLabel = findAncestorElement(theSelectionParent, IMIS_TAG_LABEL);
                        if (theImisLabel != null) {
                            args.BoundPropertyName = theImisLabel.getAttribute('BoundPropertyName');
                            args.Text = theImisLabel.getAttribute('Text');
                        }
                        else {
                            args.Text = theSelectionObject.GetText();
                        }
                    }
                    else {
                        args.Text = theImisLink.getAttribute('Text');
                        args.BoundPropertyName = theImisLink.getAttribute('BoundPropertyName');
                        args.DisplayMask = theImisLink.getAttribute('DisplayMask');
                    }

                    theEditor = editor;
                    editor.showExternalDialog(gWebRoot + '/AsiCommon/Controls/AtomPainter2/Dialogs/LinkProperties.aspx?ComponentKey=<%= ComponentExplorer.ComponentKey.ToString() %>&PreserveStatefulBusinessContainer=True&ParentPageInstanceKey=<%= ((Asi.Web.UI.DisplayPageBase)Page).PageInstanceKey %>', args, 600, 400, linkToolCallbackFunction, null, '', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize, false, true);
                };
                Telerik.Web.UI.Editor.CommandList["iMISConditionalDisplayTool"] = function (commandName, editor, args) {
                    theEditor = null;

                    var theSelectionObject = editor.getSelection();
                    if (theSelectionObject == null) {
                        alert('Error: Selection is null');
                        return;
                    }

                    var theSelectionParent = theSelectionObject.GetParentElement();

                    // Need an object to pass to the dialog.  
                    var theIfBlock = findAncestorElement(theSelectionParent, IMIS_TAG_IFBLOCK);
                    if (theSelectionObject.GetHtmlText().length == 0 && theIfBlock == null) {
                        alert('You must select an element or HTML to be conditionally displayed.');
                        return;
                    }

                    // Do not allow selection of partial if blocks. (The number of 'IfBlockStart's must
                    // equal the number of 'IfBlockEnd's in the selection, DT4992.)
                    var selectionHtml = theSelectionObject.GetHtmlText();
                    var numIfBlockStart = 0;
                    var currentIndex = 0;
                    while (true) {
                        currentIndex = selectionHtml.indexOf('class=IfBlockStart', currentIndex);
                        if (currentIndex == -1)
                            break;
                        numIfBlockStart++;
                        currentIndex++;
                    }
                    var numIfBlockEnd = 0;
                    currentIndex = 0;
                    while (true) {
                        currentIndex = selectionHtml.indexOf('class=IfBlockEnd', currentIndex);
                        if (currentIndex == -1)
                            break;
                        numIfBlockEnd++;
                        currentIndex++;
                    }
                    if (numIfBlockStart != numIfBlockEnd) {
                        alert('The selection cannot contain a partial previously configured conditional block.');
                        return;
                    }
                    if (theIfBlock != null) {
                        args.TestCompareValue1 = theIfBlock.getAttribute('TestCompareValue1');
                        args.TestCompareValue2 = theIfBlock.getAttribute('TestCompareValue2');
                        args.TestDataType = theIfBlock.getAttribute('TestDataType');
                        args.TestCompareType = theIfBlock.getAttribute('TestCompareType');
                    }
                    else {
                        // check if any imis element is contained in the selection, if so then we'll
                        // use its settings for the default compare value to the compare dialog
                        var anyScopeElement = getImisScopeElement(theSelectionParent);
                        if (anyScopeElement != null && anyScopeElement.getAttribute('BoundPropertyName') != null) {
                            var compareValueManager = new CompareValueManager();
                            compareValueManager.Source = CVM_SOURCEOPTION_PROPERTY[0];
                            // DT4724 - Get BoundPropertyName from Html rather than anyScopeElement. We need to do this
                            // because the user may have selected multiple elements (like the <BR> next to the Imis element), 
                            // and in this case theSelectionParent may contain Imis elements that weren't actually selected.
                            var propName = anyScopeElement.getAttribute('BoundPropertyName');
                            var selectedHTML = theSelectionObject.GetHtmlText();
                            var searchString = 'BoundPropertyName="';
                            var startIndex = selectedHTML.indexOf(searchString) + searchString.length;
                            if (startIndex != -1) {
                                var endIndex = selectedHTML.indexOf('"', startIndex);
                                if (endIndex != -1)
                                    propName = selectedHTML.slice(startIndex, endIndex);
                            }
                            compareValueManager.Property = propName;
                            compareValueManager.updateStaticValue();

                            args.TestCompareValue1 = compareValueManager.StaticValue;
                            args.TestCompareValue2 = null;
                            args.TestDataType = null;
                            args.TestCompareType = 'NotEmpty';
                        }
                    }

                    theEditor = editor;
                    editor.showExternalDialog(gWebRoot + '/AsiCommon/Controls/AtomPainter2/Dialogs/ConditionalDisplayProperties.aspx?ComponentKey=<%= ComponentExplorer.ComponentKey.ToString() %>&PreserveStatefulBusinessContainer=True&ParentPageInstanceKey=<%= ((Asi.Web.UI.DisplayPageBase)Page).PageInstanceKey %>', args, 600, 400, conditionalDisplayCallbackFunction, null, '', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize, false, true);
                };
                // We have to replace these because the default implementation only bolds the contained text, which isn't displayed at runtime and thus bold/italic/colors/etc get "ignored".
                Telerik.Web.UI.Editor.CommandList["FontName"] = function (commandName, editor, args) {
                    theEditor = null;
                    var selectedValue = args.value;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        imisElement.style.fontFamily = selectedValue;
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = findAncestorElement(theSelectionObject.GetParentElement(), "SPAN");
                        if (element != null)
                            element.style.fontFamily = selectedValue;
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<SPAN STYLE="font-family: ' + selectedValue + ';">' + textRange + '</SPAN>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["FontSize"] = function (commandName, editor, args) {
                    theEditor = null;
                    // .SelectedValue is the *old* value for some reason
                    var selectedValue = [null, 'xx-small', 'x-small', 'small', 'medium', 'large', 'x-large', 'xx-large'][args.value];
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        imisElement.style.fontSize = selectedValue;
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = findAncestorElement(theSelectionObject.GetParentElement(), "SPAN");
                        if (element != null)
                            element.style.fontSize = selectedValue;
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<SPAN STYLE="font-size: ' + selectedValue + ';">' + textRange + '</SPAN>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["Bold"] = function (commandName, editor, args) {
                    theEditor = null;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        if (imisElement.style.fontWeight == "bold")
                            imisElement.style.fontWeight = "normal";
                        else
                            imisElement.style.fontWeight = "bold";
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = findAncestorElement(theSelectionObject.GetParentElement(), "STRONG");
                        if (element != null) {
                            var innerHtml = element.innerHTML;
                            element.parentNode.removeChild(element);
                            editor.pasteHtml(innerHtml);
                        }
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<STRONG>' + textRange + '</STRONG>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["Italic"] = function (commandName, editor, args) {
                    theEditor = null;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        if (imisElement.style.fontStyle == "italic")
                            imisElement.style.fontStyle = "normal";
                        else
                            imisElement.style.fontStyle = "italic";
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = findAncestorElement(theSelectionObject.GetParentElement(), "EM");
                        if (element != null) {
                            var innerHtml = element.innerHTML;
                            element.parentNode.removeChild(element);
                            editor.pasteHtml(innerHtml);
                        }
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<EM>' + textRange + '</EM>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["Underline"] = function (commandName, editor, args) {
                    theEditor = null;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        if (imisElement.style.textDecoration == "underline")
                            imisElement.style.textDecoration = "none";
                        else
                            imisElement.style.textDecoration = "none";
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = findAncestorElement(theSelectionObject.GetParentElement(), "SPAN");
                        if (element != null) {
                            if (element.style.textDecoration == "underline")
                                element.style.textDecoration = "none";
                            else
                                element.style.textDecoration = "none";
                        }
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<SPAN STYLE="text-decoration: underline;">' + textRange + '</SPAN>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["ForeColor"] = function (commandName, editor, args) {
                    theEditor = null;
                    var selectedValue = args.value;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        imisElement.style.color = selectedValue;
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = theSelectionObject.GetParentElement();
                        if (element.nodeName == "SPAN")
                            element.style.color = selectedValue;
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<SPAN STYLE="color: ' + selectedValue + ';">' + textRange + '</SPAN>');
                        }
                    }
                };
                Telerik.Web.UI.Editor.CommandList["BackColor"] = function (commandName, editor, args) {
                    theEditor = null;
                    var selectedValue = args.value;
                    var imisElement = IncludeImisContainerInSelection(editor);
                    if (imisElement != null) {
                        imisElement.style.backgroundColor = selectedValue;
                    }
                    else {
                        var theSelectionObject = editor.getSelection();
                        var element = theSelectionObject.GetParentElement();
                        if (element.nodeName == "SPAN")
                            element.style.backgroundColor = selectedValue;
                        else {
                            var textRange = extendSelectionIfNecessary(editor);
                            if (textRange != null)
                                editor.pasteHtml('<SPAN STYLE="background-color: ' + selectedValue + ';">' + textRange + '</SPAN>');
                        }
                    }
                };
                function IncludeImisContainerInSelection(editor) {
                    var theSelectionObject = editor.getSelection();
                    if (theSelectionObject != null) {
                        var theSelectionParent = theSelectionObject.GetParentElement();
                        if (theSelectionParent != null) {
                            var containingBlock = findAncestorElement(theSelectionParent, [IMIS_TAG_LABEL, IMIS_TAG_HYPERLINK]);
                            if (containingBlock != null) {
                                return containingBlock;
                            }
                        }
                    }
                    return null;
                }
                function createSimpleIfBlock(propertyName, className) {
                    var innerHtml = "<span class='" + className + "'>&nbsp;</span>";
                    var args = new Object();
                    args.TestCompareValue1 = '$(panel.' + propertyName + ')';
                    args.TestCompareValue2 = null;
                    args.TestDataType = 'System.Boolean';
                    args.TestCompareType = 'IsTrue';

                    var ifBlock = createIfBlock(_editor.get_document(), null, args, innerHtml, true);
                    return ifBlock.outerHTML;
                }
                function insertSimpleIfBlock(propertyName, className) {
                    var simpleIfBlock = createSimpleIfBlock(propertyName, className);
                    // Check to see if we're inside another property; if so, place the new one before the old.
                    var theSelectionObject = _editor.getSelection();
                    var theSelectionParent = theSelectionObject.GetParentElement();
                    var containingBlock = findAncestorElement(theSelectionParent, [IMIS_TAG_LABEL, IMIS_TAG_HYPERLINK]);
                    if (containingBlock != null) {
                        containingBlock.parentNode.removeChild(containingBlock);
                        _editor.pasteHtml(' ' + simpleIfBlock + ' ');
                        _editor.pasteHtml(' ' + containingBlock.outerHTML + ' ');
                    }
                    else
                        _editor.pasteHtml(' ' + simpleIfBlock + ' ');
                }
                Telerik.Web.UI.Editor.CommandList["iMISMembersOnlyTool"] = function (commandName, editor, args) {
                    insertSimpleIfBlock('IsMemberOnly', 'MembersOnlyContent');
                }
                Telerik.Web.UI.Editor.CommandList["iMISNewContentTool"] = function (commandName, editor, args) {
                    insertSimpleIfBlock('IsImportant', 'ImportantContent');
                }
            }
        </script>
    </asp:Panel>
    <asp:Panel id="ComponentPanel" runat="server" ScrollBars="Auto" CssClass="col-sm-3">
        <asp:UpdatePanel ID="ComponentUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <uc2:AtomExplorer id="ComponentExplorer" enableviewstate="false" runat="server"></uc2:AtomExplorer>
                <asp:Panel ID="ComponentSelectPanel" runat="server" Visible="false">
                    <asp:Label ID="SelectComponentLabel" runat="server" Text="You must select a Data Component first" AssociatedControlID="Component"></asp:Label><br />
                    <asp:DropDownList ID="Component" runat="server" DataTextField="AtomName" DataValueField="ComponentKey" OnSelectedIndexChanged="Component_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <ajaxToolkit:ListSearchExtender ID="SelectComponentListSearch" runat="server" TargetControlID="Component" PromptPosition="Top"></ajaxToolkit:ListSearchExtender>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Panel>
