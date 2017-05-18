<%@ Control language="c#" EnableViewState="true" Inherits="Asi.Web.UI.Common.BOA.BOAPropertiesDisplay" Codebehind="BOAPropertiesDisplay.ascx.cs" %>
<%@ Import Namespace="System.Globalization" %>

<script type="text/javascript">
    function ShowHideForHIControl(select)
    {
        HideAllHIAttributes();
        ShowHideAttributes(select.value);
    }
    function HideAllHIAttributes() 
    {
        var container = document.getElementById('ShowHideAttributeList');
        var attributes = container.getElementsByTagName('DIV');
        for (i=0;i<attributes.length;i++)
        {
            if (attributes[i].id.substring(0,8) == 'ShowHide')
                attributes[i].style.display = 'none';
        }
    }
    function StartingPathBrowseClick(object)
    {
        OpenObjectBrowser('iTypeFilter=FOL', SetStartingPathObject);
    }

    function SetStartingPathObject(dialogWindow)
    {
        if (!dialogWindow.result)
            return;
        var result = dialogWindow.result;
        var startingPathDocumentKey = document.getElementById('<%= StartingPathDocumentVersionKey.ClientID %>');
        startingPathDocumentKey.value = result;

        var startingPathSourceLabel = document.getElementById('<%= StartingPathSourceLabel.ClientID %>');
        if (dialogWindow.SelectedDocumentName != null && dialogWindow.SelectedDocumentName.length > 0)
            startingPathSourceLabel.innerText = dialogWindow.SelectedDocumentName;
        else
            startingPathSourceLabel.innerText = "Name not specified";
    }
</script>
<asiweb:PanelTemplateControl2 ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="20em">
        <div class="PanelField" runat="server">
            <asp:label id="AvailableToUILabel" runat="server" Text="Available to UI?" AssociatedControlID="AvailableToUI" />
            <asp:RadioButtonList ID="AvailableToUI" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="PanelFieldValue AutoWidth">
                <asp:ListItem Text="Yes" Selected="True" />
                <asp:ListItem Text="No" />
            </asp:RadioButtonList>
        </div>
        <div class="PanelField">
            <asp:label id="PromptForFieldLabel" runat="server" Text="Prompt for field" AssociatedControlID="Caption" />
            <asp:textbox id="Caption" runat="server" Columns="30" Text="<%# Property.Property.Caption %>" />
        </div>
        <div class="PanelField">
            <asp:label id="CaptionResourceKeyLabel" runat="server" Text="Prompt resource key" AssociatedControlID="CaptionResourceKey" />
            <asp:textbox id="CaptionResourceKey" runat="server" Columns="30" Text="<%# Property.CaptionResourceKey %>" />
        </div>
        <div class="PanelField">
            <asp:label id="ToolTipLabel" runat="server" Text="Tool tip/verbose prompt" AssociatedControlID="ToolTip" />
            <asp:textbox id="ToolTip" runat="server" Columns="60" Text="<%# Property.ToolTip %>" />
        </div>
        <div class="PanelField">
            <asp:label id="ToolTipResourceKeyLabel" runat="server" Text="Tool tip resource key" AssociatedControlID="ToolTipResourceKey" />
            <asp:textbox id="ToolTipResourceKey" runat="server" Columns="30" Text="<%# Property.ToolTipResourceKey %>" />
        </div>
        <div class="PanelField">
            <asp:label id="HintLabel" runat="server" Text="Hint" AssociatedControlID="Hint" />
            <asp:textbox id="Hint" runat="server" Columns="30" Text="<%# Property.Hint %>" />
        </div>
        <div class="PanelField">
            <asp:label id="HintResourceKeyLabel" runat="server" Text="Hint resource key" AssociatedControlID="HintResourceKey" />
            <asp:textbox id="HintResourceKey" runat="server" Columns="30" Text="<%# Property.HintResourceKey %>" />
        </div>
        <div class="PanelField">
            <asp:label id="HelpTextLabel" runat="server" Text="Pop-up help" AssociatedControlID="HelpText" />
            <asp:textbox id="HelpText" runat="server" Columns="60" Rows="4" TextMode="MultiLine" Text="<%# HttpContext.Current.Server.HtmlDecode(Property.HelpText) %>" ValidateRequestMode="Disabled"/>
        </div>
        <div class="PanelField">
            <asp:label id="HelpTextResourceKeyLabel" runat="server" Text="Pop-up help resource key" AssociatedControlID="HelpTextResourceKey" />
            <asp:textbox id="HelpTextResourceKey" runat="server" Columns="30" Text="<%# Property.HelpTextResourceKey %>" />
        </div>
        <div class="PanelField">
            <asp:label id="KeyboardShortcutLabel" runat="server" Text="Keyboard shortcut" AssociatedControlID="KeyboardShortcut" />
            <asp:textbox id="KeyboardShortcut" runat="server" Columns="2" Text="<%# Property.KeyboardShortcut %>" />
        </div>
        <div class="PanelField">
            <asp:label id="DisplayControlLabel" runat="server" Text="Display control" AssociatedControlID="HIControl" />
            <asp:DropDownList id="HIControl" runat="server">
                <asp:ListItem Value="19">Auto Complete</asp:ListItem>
                <asp:ListItem Value="11">Calendar</asp:ListItem>
                <asp:ListItem Value="18">Cascading Drop Down List</asp:ListItem>
                <asp:ListItem Value="22">Chart/Graph</asp:ListItem>
                <asp:ListItem Value="0">Check Box(es)</asp:ListItem>
                <asp:ListItem Value="13">Combo Box</asp:ListItem>
                <asp:ListItem Value="10">Currency</asp:ListItem>
                <asp:ListItem Value="21">Document Path Selector</asp:ListItem>
                <asp:ListItem Value="1">Drop Down List</asp:ListItem>
                <asp:ListItem Value="15">Email Address</asp:ListItem>
                <asp:ListItem Value="24">Web Address</asp:ListItem>
                <asp:ListItem Value="2">File Upload</asp:ListItem>
                <asp:ListItem Value="20">Filtered Text Box</asp:ListItem>
                <asp:ListItem Value="3">Hidden</asp:ListItem>
                <asp:ListItem Value="17">HTML Editor</asp:ListItem>
                <asp:ListItem Value="25">Image</asp:ListItem>
                <asp:ListItem Value="4">List Box</asp:ListItem>
                <asp:ListItem Value="14">Number</asp:ListItem>
                <asp:ListItem Value="23">Numeric Up/Down</asp:ListItem>
                <asp:ListItem Value="8">Password</asp:ListItem>
                <asp:ListItem Value="9">Radio Buttons</asp:ListItem>
                <asp:ListItem Value="5">Table</asp:ListItem>
                <asp:ListItem Value="16">Telephone Number</asp:ListItem>
                <asp:ListItem Value="7">Text Area</asp:ListItem>
                <asp:ListItem Value="6">Text Field</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div id="ShowHideAttributeList">
            <div class="PanelField" id="ShowHideWidth">
                <asp:label id="WidthLabel" runat="server" Text="Display width" AssociatedControlID="HIControlWidth" />
                <asp:textbox id="HIControlWidth" runat="server" Columns="4" Text="<%# Property.HIControlWidth > 0 ? Property.HIControlWidth.ToString(CultureInfo.InvariantCulture) : string.Empty %>" />
            </div>
            <div class="PanelField" id="ShowHideHeight">
                <asp:label id="HeightLabel" runat="server" Text="Display height" AssociatedControlID="HIControlHeight" />
                <asp:textbox id="HIControlHeight" runat="server" Columns="4" Text="<%# Property.HIControlHeight > 0 ? Property.HIControlHeight.ToString(CultureInfo.InvariantCulture) : string.Empty %>" />
            </div>
            <div class="PanelField" id="ShowHideMultiSelect">              
                <asp:CheckBox id="MultipleSelect" runat="server" Checked="<%# Property.MultipleSelect %>" TextAlign="Right" CssClass="PanelFieldValue" />
                <asp:label id="MultipleSelectLabel" runat="server" Text="Allow multiple selection?" AssociatedControlID="MultipleSelect" />
            </div>
            <div class="PanelField" id="ShowHideAutoCapitalization">
                <asp:CheckBox id="UseAutoCapitalization" runat="server" Checked="<%# Property.UseAutoCapitalization %>" TextAlign="Right" CssClass="PanelFieldValue" />
                <asp:label id="UseAutoCapitalizationLabel" runat="server" Text="Use auto capitalization?" AssociatedControlID="UseAutoCapitalization" />              
            </div>
            <div class="PanelField" id="ShowHideDisplayMask">
                <asp:label id="DisplayMaskLabel" runat="server" Text="Display mask" AssociatedControlID="DisplayMask" />
                <asp:DropDownList id="DisplayMask" runat="server" />
            </div>
            <div class="PanelField" id="ShowHideRegularExpressionFormatter">
                <asp:label id="RegularExpressionFormatLabel" runat="server" Text="Format regular expression" AssociatedControlID="RegularExpressionFormat" />
                <asp:textbox id="RegularExpressionFormat" runat="server" Columns="60" Text="<%# Property.RegularExpressionFormat %>" />
            </div>
            <div class="PanelField">
                <asp:label id="FormatSpecificationLabel" runat="server" Text="Format Specification" AssociatedControlID="FormatSpecification" />
                <asp:DropDownList id="FormatSpecification" runat="server">
                    <asp:ListItem Value=""></asp:ListItem>
                    <asp:ListItem Value="ucase">Upper case</asp:ListItem>
                    <asp:ListItem Value="lcase">Lower case</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="ShowHideWatermarkText">
                <div class="PanelField">
                    <asp:label id="WatermarkTextLabel" runat="server" Text="Watermark text" AssociatedControlID="WatermarkText" />
                    <asp:textbox id="WatermarkText" runat="server" Columns="40" Text="<%# Property.WatermarkText %>" />
                </div>
                <div class="PanelField">
                    <asp:label id="WatermarkResourceKeyLabel" runat="server" Text="Watermark resource key" AssociatedControlID="WatermarkResourceKey" />
                    <asp:textbox id="WatermarkResourceKey" runat="server" Columns="30" Text="<%# Property.WatermarkResourceKey %>" />
                </div>
            </div>
            <div class="PanelField" id="ShowHideUserDefinedMask">
                <asp:label id="UserDefinedMaskLabel" runat="server" Text="User defined mask" AssociatedControlID="UserDefinedMask" />
                <div class="PanelFieldValue">
                    <asp:textbox id="UserDefinedMask" runat="server" Columns="30" />
                    <asiweb:InfoControl ID="UserDefinedMaskInfo" runat="server" Text="User-defined mask information." />
                </div>
            </div>
            <div class="PanelField" id="ShowHideRepeatDirection">
                <asp:label id="OrientationLabel" runat="server" Text="Display orientation" AssociatedControlID="Orientation" />
                <asp:RadioButtonList ID="Orientation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="PanelFieldValue AutoWidth">
                    <asp:ListItem Text="Horizontal" Selected="True" />
                    <asp:ListItem Text="Vertical" />
                </asp:RadioButtonList>
            </div>
            <div class="PanelField" id="ShowHideRepeatColumns">
                <asp:label id="RepeatColumnsLabel" runat="server" Text="Display columns" AssociatedControlID="RepeatColumns" />
                <asp:textbox id="RepeatColumns" runat="server" Columns="2" Text="<%# Property.HIControlRepeatColumns > 0 ? Property.HIControlRepeatColumns.ToString(CultureInfo.InvariantCulture) : string.Empty %>" />
            </div>
            <div class="PanelField" id="ShowHideRelatedProperty">
                <asp:label id="RelatedPropertyKeyLabel" runat="server" Text="Related property" AssociatedControlID="RelatedPropertyKey" />
                <asp:dropdownlist id="RelatedPropertyKey" runat="server" />
            </div>
            <div class="PanelField" id="ShowHideSurfToEditButton">
                <asp:label id="ShowSurfToEditButtonLabel" runat="server" Text="Show Surf-to-Edit?" AssociatedControlID="ShowSurfToEditButton" />
                <asp:checkbox id="ShowSurfToEditButton" runat="server" Checked="<%# Property.ShowSurfToEditButton %>" />
            </div>
            <div id="ShowHideWebService">
                <div class="PanelField">
                    <asp:label id="WebServicePathLabel" runat="server" Text="Path to web service" AssociatedControlID="WebServicePath" />
                    <asp:textbox id="WebServicePath" runat="server" Columns="60" Text="<%# Property.WebServicePath %>" />
                </div>
                <div class="PanelField">
                    <asp:label id="WebServiceMethodNameLabel" runat="server" Text="Web service method name" AssociatedControlID="WebServiceMethodName" />
                    <asp:textbox id="WebServiceMethodName" runat="server" Columns="30" Text="<%# Property.WebServiceMethodName %>" />
                </div>
            </div>
            <div class="PanelField" id="ShowHideValidCharacters">
                <asp:label id="ValidCharactersLabel" runat="server" Text="Valid characters" AssociatedControlID="ValidCharacters" />
                <asp:textbox id="ValidCharacters" runat="server" Columns="30" Text="<%# Property.ValidCharacters %>" />
            </div>
            <div class="PanelField" id="ShowHidePasswordStrength">
                <asp:label id="ShowPasswordStrengthLabel" runat="server" Text="Show password strength?" AssociatedControlID="ShowPasswordStrength" />
                <asp:checkbox id="ShowPasswordStrength" runat="server" Checked="<%# Property.ShowPasswordStrength %>" />
            </div>
            <div class="PanelField" id="ShowHideStartingPath">
                <asp:label id="StartingPathDocumentVersionKeyLabel" runat="server" Text="Starting path" AssociatedControlID="StartingPathDocumentVersionKey" />
                <div class="PanelFieldValue AutoWidth">
                    <asp:HiddenField id="StartingPathDocumentVersionKey" runat="server" Value="<%# Property.StartingPathDocumentVersionKey %>" />
                    <asp:label id="StartingPathSourceLabel" CssClass="BSAText" style="white-space:nowrap; font-style:italic;" runat="server" />
                    <asiweb:StyledButton Text="Browse" id="StartingPathBrowseButton" AutoPostBack="false" onclientclick="StartingPathBrowseClick(this);" runat="server" />
                </div>
            </div>
            <div class="PanelField" id="ShowHideRegularExpressionValidator">
                <asp:label id="RegularExpressionValidatorLabel" runat="server" Text="Validation regular expression" AssociatedControlID="RegularExpressionValidator" />
                <asp:textbox id="RegularExpressionValidator" runat="server" Columns="60" Text="<%# Property.RegularExpressionValidator %>" />
            </div>
            <div id="ShowHideValidationMessage">
                <div class="PanelField">
                    <asp:label id="ValidationMessageLabel" runat="server" Text="Validation message" AssociatedControlID="ValidationMessage" />
                    <asp:textbox id="ValidationMessage" runat="server" Columns="60" Text="<%# Property.ValidationMessage %>" />
                </div>
                <div class="PanelField">
                    <asp:label id="ValidationMessageResourceKeyLabel" runat="server" Text="Validation message resource key" AssociatedControlID="ValidationMessageResourceKey" />
                    <asp:textbox id="ValidationMessageResourceKey" runat="server" Columns="30" Text="<%# Property.ValidationMessageResourceKey %>" />
                </div>
            </div>
            <div class="PanelField" id="ShowHideRange">
                <asp:label id="RangeStartLabel" runat="server" Text="Validation range start/end" AssociatedControlID="RangeStart" />
                <div class="PanelFieldValue">
                    <asp:textbox id="RangeStart" runat="server" Columns="15" Text="<%# Property.RangeStart %>" />
                    <%--<ajaxToolkit:TextBoxWatermarkExtender ID="RangeStartWatermark" runat="server" TargetControlID="RangeStart" WatermarkText="range start"></ajaxToolkit:TextBoxWatermarkExtender>--%>
                    <asp:textbox id="RangeEnd" runat="server" Columns="15" Text="<%# Property.RangeEnd %>" style="margin-left:2em;" />
                    <%--<ajaxToolkit:TextBoxWatermarkExtender ID="RangeEndWartermark" runat="server" TargetControlID="RangeEnd" WatermarkText="range end"></ajaxToolkit:TextBoxWatermarkExtender>--%>
                </div>
            </div>
        </div>
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="20em">                  
        <div class="AsiMessage">
            <ul>
                <li class="AsiInformation"><asp:label id="Label1" runat="server" Text="The following are normally left blank unless overriding the defaults" /></li>
            </ul>
        </div>        
        <div class="PanelField">
            <asp:label id="CssClassLabel" runat="server" Text="Override overall CSS class" AssociatedControlID="PropertyCssClass" />
            <asp:textbox id="PropertyCssClass" runat="server" Columns="30" Text="<%# Property.CssClass %>" />
        </div>
        <div class="PanelField">
            <asp:label id="InputFieldCssClassLabel" runat="server" Text="Override input field CSS class" AssociatedControlID="InputFieldCssClass" />
            <asp:textbox id="InputFieldCssClass" runat="server" Columns="30" Text="<%# Property.InputFieldCssClass %>" />
        </div>
        <div class="PanelField">
            <asp:label id="CaptionCssClassLabel" runat="server" Text="Override caption CSS class" AssociatedControlID="CaptionCssClass" />
            <asp:textbox id="CaptionCssClass" runat="server" Columns="30" Text="<%# Property.CaptionCssClass %>" />
        </div>
        <div class="PanelField">
            <asp:label id="ValidatorCssClassLabel" runat="server" Text="Override validator CSS class" AssociatedControlID="ValidatorCssClass" />
            <asp:textbox id="ValidatorCssClass" runat="server" Columns="30" Text="<%# Property.ValidatorCssClass %>" />
        </div>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>
