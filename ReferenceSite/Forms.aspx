<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.DisplayPageBase" Title="Forms Reference" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
 	    base.OnInit(e);

        MultiSelectControl.AddValue("Austin", "Austin", false);
        MultiSelectControl.AddValue("Alexandria", "Alexandria", false);
        MultiSelectControl.AddValue("Long Island", "LongIsland", false);
        MultiSelectControl.AddValue("Toronto", "Toronto", false);
        MultiSelectControl.AddValue("Shoreham-by-Sea", "ShorehamBySea", false);
        MultiSelectControl.AddValue("Melbourne", "Melbourne", false);
        MultiSelectControl.AddValue("Christchurch", "Christchurch", false);

        CssLink.Attributes["href"] = Asi.Web.Utilities.GetTildeExpansion() + "/ReferenceSite/Assets/ReferenceGuide.css";

    }
</script>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="Server">
    <link rel="stylesheet" type="text/css" runat="server" ID="CssLink" />
</asp:Content>

<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" runat="Server">

    <div class="RefPage">

        <div class="RefContent">

            <h1>Forms</h1>
            <p>
                This page demonstrates HTML elements and CSS commonly used in iMIS forms. We recommend using this page as a reference if you are involved 
                in building Dynamic Content Items (iParts) for iMIS. The examples on this page are in ASP.NET for developer reference. You can see the 
                HTML output of any example by using your browser's developer tools to inspect any element.
            </p>

            <h2 id="PanelFields" class="RefHeader">Panel Fields</h2>
                
            <p>
                All form fields in iMIS should be wrapped in the PanelField structure outlined below, so that our forms have a consistent display. You can do this in two ways:
            </p>
            <ul>
                <li>Set <code>RenderPanelField="True"</code> on an asiweb control to automatically render the correct PanelField divs and classes <em>(this is the preferred method)</em></li>
                <li>Manually create the PanelField divs and classes if you cannot set <code>RenderPanelField="True"</code> (for example, if you need to add a custom validator)</li>
            </ul>
            
            <h3>Set RenderPanelField="True" on an asiweb control</h3>
            <p>
                To have asiweb controls automatically render the PanelField structure (recommended), set the <code>RenderPanelField</code> and <code>DisplayCaption</code>
                attributes to true. Use the <code>Caption</code> attribute to set the text of the label and the <code>PositionCaption</code> attribute to set
                the placement of the label relative to the input. The available positions are Left (this is the default), Right, Top and Bottom.
            </p>
            <div class="RefExample">
                <asiweb:StyledLabel RenderPanelField="True" runat="server" ID="Email1" DisplayCaption="True" Caption="Email address" Text="hello@imisdemo.com" PositionCaption="Left" />
                <asiweb:BusinessTextBox RenderPanelField="True" runat="server" ID="Phone1" DisplayCaption="True" Caption="Phone number" Required="True" />
                <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;asiweb:StyledLabel RenderPanelField="True" runat="server" ID="Email1" DisplayCaption="True" Caption="Email address" Text="hello@imisdemo.com" PositionCaption="Left" /&gt;

&lt;asiweb:BusinessTextBox RenderPanelField="True" runat="server" ID="Phone1" DisplayCaption="True" Caption="Phone number" Required="True" /&gt;
            </pre>

            <h3>Manually create the PanelField divs and classes</h3>
            <p>Note: If needed, you can use the <code>.Required</code> class on a label to show when a field is required and the <code>.Label</code> class
                to style text to look like a label.
            </p>
            <div class="RefExample">
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="EmailLabel2" CssClass="Label" Text="Email address" />
                    <div class="PanelFieldValue">
                        <asiweb:StyledLabel runat="server" ID="EmailReadOnly2" Text="hello@imisdemo.com" />
                    </div>
                </div>

                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="PhoneLabel2" AssociatedControlID="Phone2" Text="Phone number" CssClass="Required" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="Phone2" />
                        <asiweb:AsiRequiredFieldValidator id="TextBoxValidator" runat="server" ControlToValidate="Phone2" CssClass="Important"></asiweb:AsiRequiredFieldValidator>
                    </div>
                </div>

                <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="EmailLabel" CssClass="Label" Text="Email address" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:StyledLabel runat="server" ID="EmailReadOnly" Text="hello@imisdemo.com" /&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="PhoneLabel2" AssociatedControlID="Phone2" Text="Phone number" CssClass="Required" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="Phone2" /&gt;
        &lt;asiweb:AsiRequiredFieldValidator id="TextBoxValidator" runat="server" ControlToValidate="Phone2" CssClass="Important"&gt;&lt;/asiweb:AsiRequiredFieldValidator&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h2 id="FormClasses" class="RefHeader">Form classes</h2>
            <p>The classes described in this section can be used to adjust the styles of form elements.</p>

            <h3>Required class</h3>
            <p>
                Add the <code>.Required</code> class to the label of any required field.
            </p>

                <div class="RefExample">

                    <div class="PanelField Left">
                        <asiweb:StyledLabel runat="server" ID="Phone3Label" Text="Phone number" AssociatedControlID="Phone3" CssClass="Required" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="Phone3"/>
                        </div>
                    </div>

                    <div style="clear: both"></div>

                    </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="Phone3Label" Text="Phone number" AssociatedControlID="Phone3" CssClass="Required" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="Phone3"/&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h3>Label</h3>
            <p>
                All of the input elements within a form <em>must</em> have an associated <code>&lt;label&gt;</code>. However, when you need to display
                a label for a plain text field, you can use the <code>.Label</code> class on a control that renders a <code>&lt;span&gt;</code> tag, 
                so that it looks like a label.
            </p>

            <div class="RefExample">
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="Email3Label" Text="Email address" CssClass="Label" />
                    <div class="PanelFieldValue">
                        <asiweb:StyledLabel runat="server" ID="Email3" Text="hello@imisdemo.com" />
                    </div>
                </div>
            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="Email3Label" Text="Email address" CssClass="Label" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:StyledLabel runat="server" ID="Email3" Text="hello@imisdemo.com" /&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h3>Label positions: Top, Left, Right, Bottom</h3>
            <p>
                When you use a control with <code>RenderPanelField="True"</code> you can define where the label is displayed by
                setting the <code>PositionCaption</code> attribute to Top, Left, Right or Bottom.
                When manually applying the PanelField structure, you can use these same positions as CSS classes to achieve the same results.
            </p>
            <p>
                Note: If no position class is used, the label will display on the left.
            </p>

            <div class="RefExample">

                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="TextBoxLabelLeftLabel" AssociatedControlID="TextBoxLabelLeft" Text="Label on left" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="TextBoxLabelLeft" />
                    </div>
                </div>
                
                <div class="PanelField Right">
                    <div class="PanelFieldValue">
                        <asiweb:BusinessCheckBox runat="server" ID="CheckBoxLabelRight" />
                    </div>
                    <asiweb:StyledLabel runat="server" ID="CheckBoxLabelRightLabel" AssociatedControlID="CheckBoxLabelRight" Text="Label on right" />
                </div>
                    
                
                <div class="PanelField Top">
                    <asiweb:StyledLabel runat="server" ID="TextBoxLabelTopLabel" AssociatedControlID="TextBoxLabelTop" Text="Label on top" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="TextBoxLabelTop" />
                    </div>
                </div>

            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="TextBoxLabelLeftLabel" AssociatedControlID="TextBoxLabelLeft" Text="Label on left" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="TextBoxLabelLeft" /&gt;
    &lt;/div&gt;
&lt;/div&gt;
                
&lt;div class="PanelField Right"&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessCheckBox runat="server" ID="CheckBoxLabelRight" /&gt;
    &lt;/div&gt;
    &lt;asiweb:StyledLabel runat="server" ID="CheckBoxLabelRightLabel" AssociatedControlID="CheckBoxLabelRight" Text="Label on right" /&gt;
&lt;/div&gt;
                    
                
&lt;div class="PanelField Top"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="TextBoxLabelTopLabel" AssociatedControlID="TextBoxLabelTop" Text="Label on top" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="TextBoxLabelTop" /&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h3>AutoWidth</h3>
            <p>
                By default, labels that display to the left of their controls have a specific defined width. This width can be overridden by using
                the <code>.AutoWidth</code> class either on a particular label or as a wrapper around a form or form element. When applied, the element's width
                is determined by its contents.
            </p>

            <div class="RefExample">
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="LongLabel" AssociatedControlID="LongLabelTextBox" Text="A long label without the AutoWidth class" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="LongLabelTextBox" />
                    </div>
                </div>

                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="LongLabel2" CssClass="AutoWidth" AssociatedControlID="LongLabelTextBox2" Text="A long label with the AutoWidth class" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="LongLabelTextBox2" />
                    </div>
                </div>
            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="LongLabel" AssociatedControlID="LongLabelTextBox" Text="A long label without the AutoWidth class" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="LongLabelTextBox" /&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="LongLabel2" CssClass="AutoWidth" AssociatedControlID="LongLabelTextBox2" Text="A long label with the AutoWidth class" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="LongLabelTextBox2" /&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h3>SubItems</h3>
            <p>
                When you want to display a visual hierarchy of form elements, you can use the <code>.SubItems</code> class to
                indent sub-elements of another element.
            </p>

            <div class="RefExample">
                <div class="Section">
                    <span class="Label">A header for a list of checkboxes</span>
                    <div class="SubItems CheckBoxList">
                        <asiweb:BusinessCheckBox ID="Option1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 1" />
                        <asiweb:BusinessCheckBox ID="Option2" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 2" />
                        <asiweb:BusinessCheckBox ID="Option3" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 3" />
                    </div>
                </div>

                <asiweb:BusinessCheckBox ID="PetCheckBox" runat="server" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" 
                    Caption="I have a pet" onclick="toggleHasPet()" />
                <div ID="PetOptions" class="SubItems">
                    <asiweb:BusinessDropDownList ID="TypeOfPet" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Type of pet">
                        <asp:ListItem Value="dog" Text="Dog" />
                        <asp:ListItem Value="cat" Text="Cat" />
                        <asp:ListItem Value="fish" Text="Fish" />
                    </asiweb:BusinessDropDownList>
                </div>
            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="Section"&gt;
    &lt;span class="Label"&gt;A header for a list of checkboxes&lt;/span&gt;
    &lt;div class="SubItems CheckBoxList"&gt;
        &lt;asiweb:BusinessCheckBox ID="Option1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 1" /&gt;
        &lt;asiweb:BusinessCheckBox ID="Option2" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 2" /&gt;
        &lt;asiweb:BusinessCheckBox ID="Option3" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 3" /&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;asiweb:BusinessCheckBox ID="PetCheckBox" runat="server" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" 
    Caption="I have a pet" onclick="toggleHasPet()" /&gt;
&lt;div ID="PetOptions" class="SubItems"&gt;
    &lt;asiweb:BusinessDropDownList ID="TypeOfPet" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Type of pet"&gt;
        &lt;asp:ListItem Value="dog" Text="Dog" /&gt;
        &lt;asp:ListItem Value="cat" Text="Cat" /&gt;
        &lt;asp:ListItem Value="fish" Text="Fish" /&gt;
    &lt;/asiweb:BusinessDropDownList&gt;
&lt;/div&gt;</pre>
            <p>Note: Be sure to add some JavaScript to enable/disable sub-options when their parent option is toggled.</p>

            <h3>Info</h3>
            <p>
                The <code>.Info</code> class can be used to style field-level help.
            </p>

            <div class="RefExample">
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="InfoExampleLabel" AssociatedControlID="InfoExampleTextBox" Text="A confusing option" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="InfoExampleTextBox" />
                        <p class="Info">Here's some helpful info</p>
                    </div>
                </div>
            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="InfoExampleLabel" AssociatedControlID="InfoExampleTextBox" Text="A confusing option" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="InfoExampleTextBox" /&gt;
        &lt;p class="Info"&gt;Here's some helpful info&lt;/p&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

            <h3>CheckBoxList</h3>
            <p>
                The <code>.CheckBoxList</code> class can be used to group checkbox options that are related. It displays labels in normal weight
                and reduces space between items.
            </p>

            <div class="RefExample">
                <div class="CheckBoxList">
                    <asiweb:BusinessCheckBox ID="BusinessCheckBox1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 1" />
                    <asiweb:BusinessCheckBox ID="BusinessCheckBox2" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 2" />
                    <asiweb:BusinessCheckBox ID="BusinessCheckBox3" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 3" />
                </div>
                <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="CheckBoxList"&gt;
    &lt;asiweb:BusinessCheckBox ID="BusinessCheckBox1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 1" /&gt;
    &lt;asiweb:BusinessCheckBox ID="BusinessCheckBox2" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 2" /&gt;
    &lt;asiweb:BusinessCheckBox ID="BusinessCheckBox3" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Option 3" /&gt;
&lt;/div&gt;</pre>

            <h3>ShowFieldset</h3>
            <p>
                By default, fieldsets within panels do not display their borders or legends. Use the <code>.ShowFieldset</code> class directly on or
                as a wrapper around a fieldset to make it display.
            </p>

            <div class="RefExample">
                <asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl" Title="This is a panel" collapsible="false">
                    <fieldset class="ShowFieldset">
                        <legend>This is a visible fieldset</legend>
                        <asiweb:BusinessDropDownList ID="BusinessDropDownList1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Type of pet">
                            <asp:ListItem Value="dog" Text="Dog" />
                            <asp:ListItem Value="cat" Text="Cat" />
                            <asp:ListItem Value="fish" Text="Fish" />
                        </asiweb:BusinessDropDownList>
                    </fieldset>
                </asiweb:PanelTemplateControl2>

                <div style="clear: both"></div>
            </div>

            <pre class="prettyprint RefCode">
&lt;asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl" Title="This is a panel" collapsible="false"&gt;
    &lt;fieldset class="ShowFieldset"&gt;
        &lt;legend&gt;This is a visible fieldset&lt;/legend&gt;
        &lt;asiweb:BusinessDropDownList ID="BusinessDropDownList1" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Type of pet"&gt;
            &lt;asp:ListItem Value="dog" Text="Dog" /&gt;
            &lt;asp:ListItem Value="cat" Text="Cat" /&gt;
            &lt;asp:ListItem Value="fish" Text="Fish" /&gt;
        &lt;/asiweb:BusinessDropDownList&gt;
    &lt;/fieldset&gt;
&lt;/asiweb:PanelTemplateControl2&gt;</pre>

            <h3>[disabled] and aspNetDisabled</h3>
            <p>
                Set the attribute <code>disabled="true"</code> on form controls to disable them from user input.
            </p>
            <p>
                Certain elements do not support the <code>disabled</code> attribute, such as <code>&lt;label&gt;</code>s and <code>&lt;span&gt;</code>s.
                For these elements, you can instead use the CSS class <code>.aspNetDisabled</code>. This class is automatically applied to certain 
                ASP.NET controls with the attribute <code>Enabled="False"</code>.
            </p>

            <div class="RefExample">
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="DisabledTextBoxLabel" AssociatedControlID="DisabledTextBox" Text="A disabled textbox" Enabled="False" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="DisabledTextBox" Enabled="False" />
                    </div>
                </div>
                
                <div class="PanelField Right">
                    <div class="PanelFieldValue">
                        <asiweb:BusinessCheckBox runat="server" ID="DisabledCheckBox" Enabled="False" />
                    </div>
                    <asiweb:StyledLabel runat="server" ID="DisabledCheckBoxLabel" AssociatedControlID="DisabledCheckBox" Text="A disabled checkbox" Enabled="False" />
                </div>

            <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;div class="PanelField Left"&gt;
    &lt;asiweb:StyledLabel runat="server" ID="DisabledTextBoxLabel" AssociatedControlID="DisabledTextBox" Text="A disabled textbox" Enabled="False" /&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessTextBox runat="server" ID="DisabledTextBox" Enabled="False" /&gt;
    &lt;/div&gt;
&lt;/div&gt;
                
&lt;div class="PanelField Right"&gt;
    &lt;div class="PanelFieldValue"&gt;
        &lt;asiweb:BusinessCheckBox runat="server" ID="DisabledCheckBox" Enabled="False" /&gt;
    &lt;/div&gt;
    &lt;asiweb:StyledLabel runat="server" ID="DisabledCheckBoxLabel" AssociatedControlID="DisabledCheckBox" Text="A disabled checkbox" Enabled="False" /&gt;
&lt;/div&gt;</pre>

            
            <!-- end Form classes -->

            <h2 id="InputSizes" class="RefHeader">Input sizes</h2>
            <p>
                If the standard input width is either too small or too wide for your needs, then you can use the following CSS classes 
                    to create shorter or longer input fields. 
            </p>

            <div class="RefExample">

                <asiweb:BusinessTextBox CssClass="InputXXSmall" DisplayCaption="True" ID="InputXXSmall" runat="server" Caption="InputXXSmall" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="True" ID="InputXSmall" runat="server" Caption="InputXSmall" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="InputSmall" runat="server" Caption="InputSmall" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="InputMedium" runat="server" Caption="InputMedium" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="InputLarge" runat="server" Caption="InputLarge" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" ID="InputXLarge" runat="server" Caption="InputXLarge" RenderPanelField="True" />
                <asiweb:BusinessTextBox CssClass="InputXXLarge" DisplayCaption="True" ID="InputXXLarge" runat="server" Caption="InputXXLarge" RenderPanelField="True" />

                <div style="clear: both"></div>

            </div>

            <pre class="prettyprint RefCode">
&lt;asiweb:BusinessTextBox CssClass="InputXXSmall" DisplayCaption="True" ID="InputXXSmall" runat="server" Caption="InputXXSmall" RenderPanelField="True" /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="True" ID="InputXSmall" runat="server" Caption="InputXSmall" RenderPanelField="True"  /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="InputSmall" runat="server" Caption="InputSmall" RenderPanelField="True" /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="True" ID="InputMedium" runat="server" Caption="InputMedium" RenderPanelField="True" /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="InputLarge" runat="server" Caption="InputLarge" RenderPanelField="True" /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" ID="InputXLarge" runat="server" Caption="InputXLarge" RenderPanelField="True" /&gt;
&lt;asiweb:BusinessTextBox CssClass="InputXXLarge" DisplayCaption="True" ID="InputXXLarge" runat="server" Caption="InputXXLarge" RenderPanelField="True" /&gt;
            </pre>

            <!-- end Input sizes -->

            <!-- MultiSelect -->

            <h2 id="MultiSelect" class="RefHeader">MultiSelect</h2>
            
            <p>
                Use the <code>asiweb:MultilSelectControl2</code> to allow users to select multiple options from a filterable pre-defined list.
            </p>

            <div class="RefExample">
                <asiweb:MultiSelectControl2 ID="MultiSelectControl" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Locations" />
                <div style="clear:both"></div>
            </div>

            <pre class="prettyprint RefCode">
&lt;asiweb:MultiSelectControl2 ID="MultiSelectControl" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Locations" /&gt;

&lt;!-- The following should be placed in the code behind --&gt;
MultiSelectControl.AddValue("Austin", "Austin", false);
MultiSelectControl.AddValue("Alexandria", "Alexandria", false);
MultiSelectControl.AddValue("Long Island", "LongIsland", false);
MultiSelectControl.AddValue("Toronto", "Toronto", false);
MultiSelectControl.AddValue("Shoreham-by-Sea", "ShorehamBySea", false);
MultiSelectControl.AddValue("Melbourne", "Melbourne", false);
MultiSelectControl.AddValue("Christchurch", "Christchurch", false);</pre>

            <!-- end MultiSelect -->

            
            <%--<!-- ComboBox -->

            <h2 id="ComboBox" class="RefHeader">Combo Box</h2>

            <p>
                The <code>asiweb:BusinessComboBox</code> control has lots of useful functionality. It can allow both 
                selection from a filterable, pre-defined list and free-form entry in the same control, and can be configured
                to load on demand. 
            </p>
            <p>
                One example of this control is the primary organization selector in the Create Account and Mini Profile dynamic content items.
            </p>
            
            <div class="RefExample">
                <asiweb:BusinessComboBox  ID="BusinessComboBox" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Location" EmptyMessage="Select your location" />

                <div style="clear:both"></div>
            </div>

            <pre class="prettyprint RefCode"></pre>

            <!-- end ComboBox -->--%>

            <!--  -->

            <%--<h2 id="" class="RefHeader"></h2>

            <p></p>
            
            <div class="RefExample">

                <div style="clear:both"></div>
            </div>

            <pre class="prettyprint RefCode"></pre>--%>

            <!-- end  -->


        </div>  <!-- end RefContent div -->

    </div> <!-- end RefPage div -->







     <%-- This is to generate the page's TOC --%>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            var ToC =
                "<nav role='navigation' class='RefTOC'>" +
                    "<ul>";
            var newLine, el, title, link;
            jQuery("h2.RefHeader").each(function () {
                el = jQuery(this);
                title = el.text();
                link = "#" + el.attr("id");
                newLine =
                    "<li>" +
                        "<a href='" + link + "'>" +
                        title +
                        "</a>" +
                        "</li>";
                ToC += newLine;
            });
            ToC +=
                "</ul>" +
                    "</nav>";
            jQuery(".RefPage").prepend(ToC);

            toggleHasPet();
        });

        var toggleHasPet = function () {
            if (jQuery('#' + '<%= PetCheckBox.ClientID %>') != null && jQuery('#' + '<%= TypeOfPet.ClientID %>') != null) {
                if (!jQuery('#' + '<%= PetCheckBox.ClientID %>').is(':checked')) {
                    jQuery('#PetOptions :input').attr('disabled', true);
                    jQuery('#PetOptions label').addClass('aspNetDisabled');
                } else {
                    jQuery('#PetOptions :input').removeAttr('disabled');
                    jQuery('#PetOptions label').removeClass('aspNetDisabled');
                }
            }
        }
    </script>
    
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

</asp:Content>