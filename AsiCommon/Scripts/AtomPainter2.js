
var IMIS_TAG_LABEL = 'asiweb:BusinessLabel';
var IMIS_TAG_HYPERLINK = 'asiweb:BusinessHyperLink';
var IMIS_TAG_IFBLOCK = 'asiweb:AtomPanelIfBlock';
var IMIS_TAG_IFBLOCK_BODY = 'asiweb:AtomPanelIfBody';
var IMIS_TAG_IFBLOCK_ELSE = 'asiweb:AtomPanelElseBody';
var theEditor;

function setImisAttribute(node, attrName, attrValue) {
    if (attrValue != null && attrValue.toString().length > 0)
        node.setAttribute(attrName, attrValue);
    else if (node.getAttribute(attrName) != null)
        node.removeAttribute(attrName);
}

function getImisScopeElement(node, tagNameToLookFor) {
    if (tagNameToLookFor == null || tagNameToLookFor.toLowerCase() == node.tagName.toLowerCase())
        return node;

    if (node.childNodes == null || node.childNodes.length == 0)
        return null;

    for (var i = 0; i < node.childNodes.length; i++) {
        var iterator = node.childNodes[i];

        var recurseResult = getImisScopeElement(iterator, tagNameToLookFor);
        if (recurseResult != null)
            return recurseResult;
    }

    return null;
}

function isArray(obj) {
    if (obj.constructor.toString().indexOf("Array") == -1)
        return false;
    else
        return true;
}

function extendSelectionIfNecessary(editor) {
    if (editor.getSelectionHtml() == null)
        return null;

    if (editor.get_document().selection == null)
        return editor.getSelectionHtml();

    var textRange = editor.get_document().selection.createRange();
    if (textRange == null)
        return null;

    // If the selection is either the entire element or the entire contents of the element, no need to expand
    var element = textRange.parentElement();
    var elementRange = textRange.duplicate();
    elementRange.moveToElementText(element);
    elementRange.select();

    if (element.childNodes.length == 1) {
        var child = element.childNodes[0];
        if (child.nodeName != "#text")  // Allow partial selection of text.
        {
            textRange.moveToElementText(element);
            textRange.select();
        }
    }
    else if (element.childNodes.length > 1) {
        var i;
        var start;
        var end;

        // Find the first element whose end is inside the selection and whose start is not, and expand the selection so it is.
        for (i = 0; i < element.childNodes.length; ++i) {
            child = element.childNodes[i];
            if (child.nodeName != "#text")  // Allow partial selection of text.
            {
                elementRange = textRange.duplicate();
                elementRange.moveToElementText(child);
                start = textRange.compareEndPoints('StartToStart', elementRange);
                if (start == 1) // Element's start is before the selection
                {
                    // Check to see if the endpoint is after the selection start; if not, nothing to do.
                    end = textRange.compareEndPoints('StartToEnd', elementRange);
                    if (end < 1)
                        textRange.setEndPoint('StartToStart', elementRange);
                }
                else    // Element's start is inside the selection, we're done.
                    break;
            }
        }
        // Find the first element whose start is inside the selection and whose end is not.
        for (i = 0; i < element.childNodes.length; ++i) {
            child = element.childNodes[i];
            if (child.nodeName != "#text")  // Allow partial selection of text.
            {
                elementRange = textRange.duplicate();
                elementRange.moveToElementText(child);
                start = textRange.compareEndPoints('EndToStart', elementRange);
                if (start == 1) // Element's start is before the selection's end
                {
                    // Check to see if the endpoint is after the selection end; if not, nothing to do.
                    end = textRange.compareEndPoints('EndToEnd', elementRange);
                    if (end == -1)
                        textRange.setEndPoint('EndToEnd', elementRange);
                }
                else    // Element's end is inside the selection, we're done.
                    break;
            }
        }

        textRange.select();
    }
    return textRange;
}

function findAncestorElement(node, tagNameToLookFor) {
    var checkFunction;
    if (isArray(tagNameToLookFor)) {
        for (var i = 0; i < tagNameToLookFor.length; ++i)
            tagNameToLookFor[i] = tagNameToLookFor[i].toLowerCase();
        checkFunction = function (tagName) { return jQuery.inArray(tagName, tagNameToLookFor) > -1; };
    }
    else
        checkFunction = function (tagName) { return tagNameToLookFor == null || tagNameToLookFor.toLowerCase() == iterator.tagName.toLowerCase(); };

    var iterator = node;
    while (iterator != null) {
        if (iterator.tagName == null)
            break;
        if (checkFunction(iterator.tagName.toLowerCase()))
            return iterator;
        iterator = iterator.parentNode;
    }

    return null;
}

function createImisScopeElement(doc, nodeName, nodeId) {
    var result = doc.createElement(nodeName);
    var resultId = "defaultId";
    if (nodeId != null && nodeId.length > 0) {
        resultId = nodeId;
    }
    else {
        for (var i = 1; i < 200; i++) {
            resultId = nodeName + (doc.getElementsByTagName(nodeName).length + i);
            // we often get names like asiweb:something - if we use that as an ID we get failures, so change the colons
            resultId = resultId.replace(/:/gi, "_");
            var idIsUnique = doc.getElementById(resultId) == null ? true : false;
            if (idIsUnique) break;
        }
    }
    result.id = resultId;
    result.setAttribute('runat', 'server');
    return result;
}

function createLabelElement(doc, labelID, args) {
    var result = createImisScopeElement(doc, IMIS_TAG_LABEL, labelID);
    updateLabelElement(result, args);
    return result;
}
function updateLabelElement(label, args) {
    setImisAttribute(label, 'BoundPropertyName', args.BoundPropertyName);
    setImisAttribute(label, 'DisplayMask', args.DisplayMask);
    setImisAttribute(label, 'DisplayValue', args.DisplayValue);
    label.innerHTML = '[' + args.BoundPropertyCaption + ']';
}
function labelToolCallbackFunction(dialog, returnArgs) {
    if (returnArgs == null)
        return;

    var theSelectionObject = theEditor.getSelection();
    var theSelectionParent = theSelectionObject.GetParentElement();

    // First we look for an existing
    // label that we're editing.  Failing that, we create a new label.
    var theImisLabel = findAncestorElement(theSelectionParent, IMIS_TAG_LABEL);
    if (theImisLabel == null) {
        theImisLabel = createLabelElement(theEditor.get_document(), null, returnArgs);
        theEditor.pasteHtml(' ' + theImisLabel.outerHTML + ' ');
    }
    else {
        updateLabelElement(theImisLabel, returnArgs);
    }
}

function createLinkElement(doc, linkID, args) {
    var result = createImisScopeElement(doc, IMIS_TAG_HYPERLINK, linkID);
    result.setAttribute('NavigateAutomatically', 'true');
    result.setAttribute('IgnoreChildren', 'true');

    updateLinkElement(result, args);

    return result;
}
function updateLinkElement(link, args) {
    setImisAttribute(link, 'BoundPropertyName', args.BoundPropertyName);
    setImisAttribute(link, 'Text', args.Text);
    setImisAttribute(link, 'DisplayMask', args.DisplayMask);

    var innerHtml = (args.Text != null && args.Text.length > 0) ? args.Text : '[' + args.BoundPropertyCaption + ']';
    link.innerHTML = "<a href=''>" + innerHtml + "</a>";
}

function linkToolCallbackFunction(dialog, returnArgs) {
    if (returnArgs == null)
        return;

    var theSelectionObject = theEditor.getSelection();
    var theSelectionParent = theSelectionObject.GetParentElement();

    // First we look for an existing
    // link that we're editing.  Failing that, we look for an existing label
    // that we can convert to a link.  Failing that, we create a new empty link.
    var theImisLink = findAncestorElement(theSelectionParent, IMIS_TAG_HYPERLINK);
    if (theImisLink == null) {
        var theImisLabel = findAncestorElement(theSelectionParent, IMIS_TAG_LABEL);
        if (theImisLabel != null) {
            // if user has selected a label, then we'll just convert it into a link
            theImisLink = createLinkElement(theEditor.get_document(), null, returnArgs);
            theImisLabel.parentNode.replaceChild(theImisLink, theImisLabel);
        }
        else {
            theImisLink = createLinkElement(theEditor.get_document(), null, returnArgs);
            theEditor.pasteHtml(' ' + theImisLink.outerHTML + ' ');
        }
    }
    else {
        updateLinkElement(theImisLink, returnArgs);
    }
}

//
//
//
function createIfBlock(doc, ifBlockID, args, innerHtml, excludeCurlyBraces) {
    var result = createImisScopeElement(doc, IMIS_TAG_IFBLOCK, ifBlockID);

    var htmlStart = '';
    if (excludeCurlyBraces == null || !excludeCurlyBraces)
        htmlStart += "<span class='IfBlockStart'>{</span>";
    htmlStart += "<" + IMIS_TAG_IFBLOCK_BODY + " runat='server'>";

    var htmlEnd = "</" + IMIS_TAG_IFBLOCK_BODY + ">";
    if (excludeCurlyBraces == null || !excludeCurlyBraces)
        htmlEnd += "<span class='IfBlockEnd'>}</span>";
    result.innerHTML = htmlStart + innerHtml + htmlEnd;

    updateIfBlock(result, args);

    return result;
}
//
//
//
function updateIfBlock(ifBlock, args) {
    setImisAttribute(ifBlock, 'TestCompareValue1', args.TestCompareValue1);
    setImisAttribute(ifBlock, 'TestCompareValue2', args.TestCompareValue2);
    setImisAttribute(ifBlock, 'TestCompareType', args.TestCompareType);
    setImisAttribute(ifBlock, 'TestDataType', args.TestDataType);
}
//
// Call back from the Conditional Display properties dialog
//
function conditionalDisplayCallbackFunction(dialog, returnArgs) {
    if (returnArgs == null)
        return;

    var theSelectionObject = theEditor.getSelection();
    var theSelectionParent = theSelectionObject.GetParentElement();

    var theIfBlock = findAncestorElement(theSelectionParent, IMIS_TAG_IFBLOCK);
    if (theIfBlock == null) {
        theIfBlock = createIfBlock(theEditor.get_document(), null, returnArgs, theSelectionObject.GetHtmlText());
        theEditor.pasteHtml(' ' + theIfBlock.outerHTML + ' ');
    }
    else {
        updateIfBlock(theIfBlock, returnArgs);
    }
}

// This is needed so that script is properly registered on an async postback
if (typeof (Sys) !== "undefined") Sys.Application.notifyScriptLoaded();


var CVM_SOURCEOPTION_LITERAL = new Array('literal', 'None (Static Text)');
var CVM_SOURCEOPTION_PROPERTY = new Array('panel', 'Property');
var CVM_SOURCEOPTION_CONTEXT = new Array('currentcontext', 'Current Context');
var CVM_SOURCEOPTION_REQUEST = new Array('request', 'Current Request');
var CVM_SOURCEOPTION_SESSION = new Array('session', 'Current Session');
var CVM_SOURCEOPTION_SYSTEMCONFIG = new Array('systemconfig', 'System Configuration');
var CVM_SOURCEOPTIONS = new Array(CVM_SOURCEOPTION_LITERAL, CVM_SOURCEOPTION_PROPERTY, CVM_SOURCEOPTION_CONTEXT, CVM_SOURCEOPTION_REQUEST, CVM_SOURCEOPTION_SESSION, CVM_SOURCEOPTION_SYSTEMCONFIG);

function CompareValueManager(parseString, staticValueControlId) {
    this.Source = 'literal';
    this.Property = null;
    this.Value = null;
    this.StaticValue = parseString != null ? parseString : '';

    if (staticValueControlId != null) {
        this.StaticValueControlID = staticValueControlId;
        this.StaticValueControl = $get(staticValueControlId);
        this.SourceControl = $get(staticValueControlId + 'Source');
        this.PropertyControl = $get(staticValueControlId + 'PropertySelect');
        this.ValueControl = $get(staticValueControlId + 'Text');
    }

    if (parseString != null && parseString.length > 0 && parseString.substr(0, 2) == '$(') {
        var valueSplit = parseString.substring(2, parseString.length - 1).split('.');
        this.Source = valueSplit[0];

        if (valueSplit[0] == 'panel')
            this.Property = valueSplit[1];
        else
            this.Value = valueSplit[1];
    }

    //
    // Call on initial load of the page
    //
    this.initialize = function () {
        // initialize source options
        for (var i = 0; i < CVM_SOURCEOPTIONS.length; i++) {
            var sourceOption = this.SourceControl.ownerDocument.createElement('option');
            sourceOption.value = CVM_SOURCEOPTIONS[i][0];
            sourceOption.text = CVM_SOURCEOPTIONS[i][1];

            try {
                this.SourceControl.add(sourceOption, null); //Standards compliant
            }
            catch (ex) {
                this.SourceControl.add(sourceOption); //IE only
            }
        }

        this.StaticValueControl.value = this.StaticValue;
        this.SourceControl.value = this.Source;
        this.PropertyControl.value = this.Property;
        this.ValueControl.value = this.Value != null ? this.Value : '';

        this.SourceControl.onchange = Anything_Changed;
        this.SourceControl.CompareValueManager = this;

        this.PropertyControl.onchange = Anything_Changed;
        this.PropertyControl.CompareValueManager = this;

        this.ValueControl.onkeyup = Anything_Changed;
        this.ValueControl.CompareValueManager = this;

        this.updateDisplay();
    };

    //
    // Call by initialize and udpate
    //
    this.updateDisplay = function () {

        this.StaticValueControl.style.display = 'none';
        this.PropertyControl.style.display = 'none';
        this.ValueControl.style.display = 'none';

        switch (this.Source) {
            case 'literal':
                this.StaticValueControl.style.display = 'inline';
                break;
            case 'panel':
                this.PropertyControl.style.display = 'inline';
                break;
            default:
                this.ValueControl.style.display = 'inline';
                break;
        }
    };

    //
    //
    //
    this.updateStaticValue = function () {
        var staticValue = '';
        if (this.Source != 'literal') {
            staticValue = '$(' + this.Source + '.';
            if (this.Source == 'panel')
                staticValue += this.Property;
            else
                staticValue += this.Value;

            staticValue += ')';
        }

        this.StaticValue = staticValue;
    };

    //
    // Call whenever a field changes value
    //
    this.update = function () {

        this.StaticValue = this.StaticValueControl.value;
        this.Source = this.SourceControl.value;
        this.Property = this.PropertyControl.value;
        this.Value = this.ValueControl.value;

        this.updateStaticValue();

        this.StaticValueControl.value = this.StaticValue;

        this.updateDisplay();
    };
}
function Anything_Changed(e) {
    var srcElement = eventSource(e);
    srcElement.CompareValueManager.update();
    return false;
}