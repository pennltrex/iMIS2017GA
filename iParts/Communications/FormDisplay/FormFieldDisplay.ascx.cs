using System;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Soa.ClientServices;
using Asi.Soa.Communications.DataContracts;
using Asi.Soa.Core.DataContracts;
using Asi.Web.UI.WebControls;
using Telerik.Web.UI;
using RequiredFieldValidator = System.Web.UI.WebControls.RequiredFieldValidator;

namespace Asi.Web.iParts.Communications
{
    public partial class FormFieldDisplay : UserControl
    {
        protected const string DefaultValidationGroup = "Asi.Web.iParts.Communications.FormFieldDisplay";
        
        /// <summary>
        /// Gets or sets the specific validation group name to use when creating
        /// the validator for this form field.
        /// </summary>
        /// <remarks>If this value is not set, a default value is used.</remarks>
        public string ValidationGroupName { get; set; }

        /// <summary>
        /// Gets or sets the definition of a particular form item, i.e., 
        /// prompt and response of a given type.
        /// </summary>
        public EntityPropertyDefinitionData FormField { get; set; }

        private WebControl fieldControl;

        /// <summary>
        /// Gets the type-specific value of the particular field that was set up.
        /// </summary>
        public object Value
        {
            get
            {
                object result = null;
                if (fieldControl is NumberBox)
                {
                    var numericTextBox = fieldControl as NumberBox;
                    if (numericTextBox.ID.Contains("intTextBox"))
                    {
                        int intResult;
                        if (int.TryParse(numericTextBox.Text, out intResult))
                            result = intResult;
                    }
                    else
                    {
                        decimal decimalResult;
                        if (decimal.TryParse(numericTextBox.Text, out decimalResult))
                            result = decimalResult;
                    }
                }
                else if (fieldControl is BusinessTextBox)
                    result = ((BusinessTextBox)fieldControl).Text;
                else if (fieldControl is BusinessRadioButtonList)
                {
                    if (((BusinessRadioButtonList)fieldControl).SelectedValue == ResourceManager.GetWord("Yes"))
                        result = true;
                    else if (((BusinessRadioButtonList) fieldControl).SelectedValue == ResourceManager.GetWord("No"))
                        result = false;
                }
                else if (fieldControl is BusinessDropDownList)
                {
                    var dropDown = fieldControl as BusinessDropDownList;
                    result = dropDown.SelectedItem.Value;
                }
                return result;
            }
        }

        /// <summary>
        /// Gets or set the full set of responses, which
        /// should contain one related to 
        /// <see cref="FormField"/>.
        /// </summary>
        public FormResponseData FormResponse;

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            GenerateControl();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            // Don't bother to populate a form field that's been hidden.
            if (FormField.Visible)
            {
                PopulateResponse();
                FormFieldDiv.Visible = true;
            } 
            else
                FormFieldDiv.Visible = false;
        }

        /// <summary>
        /// Add response to FormFieldDisplay's control
        /// </summary>
        private void PopulateResponse()
        {
            var formFieldType = FormField.GetType();
            if (formFieldType == typeof (PropertyTypeStringData))
            {
                if (FormField.Rule != null)
                {
                    var dropDown = (BusinessDropDownList) fieldControl;
                    dropDown.Text = ResponseValue;
                }
                else
                {
                    var textBox = (TextBox)fieldControl;
                    textBox.Text = ResponseValue;
                }
            }
            else if (formFieldType == typeof (PropertyTypeBooleanData))
            {
                var radioButtons = (RadioButtonList) fieldControl;
                if (!string.IsNullOrWhiteSpace(ResponseValue))
                {
                    switch (ResponseValue)
                    {
                        case "True":
                            radioButtons.SelectedIndex = 0;
                            break;
                        case "False":
                            radioButtons.SelectedIndex = 1;
                            break;
                    }
                }
                else
                {
                    radioButtons.SelectedIndex = -1;
                }
            }
            else if (formFieldType == typeof (PropertyTypeIntegerData) ||
                formFieldType == typeof (PropertyTypeDecimalData))
            {
                var integerTextBox = (NumberBox)fieldControl;
                integerTextBox.Text = ResponseValue;
            }
        }

        private void GenerateControl()
        {
            if (FormField == null)
                return;

            var validationGroup = string.IsNullOrWhiteSpace(ValidationGroupName)
                                      ? DefaultValidationGroup
                                      : ValidationGroupName;
            var controlId = string.Empty;
            var label = new Label();
            label.Text = FormField.Caption;
            label.CssClass = "Label";
            FieldCaptionDiv.Controls.Clear();
            FieldCaptionDiv.Controls.Add(label);

            FieldValueDiv.Controls.Clear();

            var formFieldType = FormField.GetType();

            if (formFieldType == typeof (PropertyTypeStringData))
            {
                if (FormField.Rule != null) // Is Drop down answer type?
                {
                    if (FormField.Rule is PropertyRuleQueryData) // Is query based?
                    {
                        var ruleQueryData = FormField.Rule as PropertyRuleQueryData;
                        var dropDown = new BusinessDropDownList();
                        FieldValueDiv.Controls.Add(dropDown);
                        dropDown.ID = label.AssociatedControlID = controlId = FormField.PropertyId.Replace('-', '_');
                        fieldControl = dropDown;

                        // Populate drop down with all values of the query
                        var entityManager = new EntityManager(AppContext.CurrentIdentity.UserId);
                        var queryResults = FormDisplayCommon.GetValueListQueryResults(ruleQueryData, entityManager);
                        dropDown.AddNullItem();

                        if (queryResults != null)
                        {
                            foreach (var item in queryResults)
                            {
                                var listItem = new ListItem(item.Value, item.Key);
                                dropDown.Items.Add(listItem);
                            }
                        }
                    }
                    else if (FormField.Rule is PropertyRuleValueListData) // Is explicit list based?
                    {
                        var ruleValueListData = FormField.Rule as PropertyRuleValueListData;
                        var dropDown = new BusinessDropDownList();
                        FieldValueDiv.Controls.Add(dropDown);
                        dropDown.ID =
                            label.AssociatedControlID =
                            controlId =
                            FormField.PropertyId.Replace('-', '_') + "explicitValueDropDownList";
                        fieldControl = dropDown;
                        fieldControl.Attributes.Add("translate", "no");

                        //Populate drop down with values from the explicit list
                        var valueList = ruleValueListData.ValueList;
                        dropDown.AddNullItem();

                        foreach (var item in valueList)
                        {
                            var listItem = new ListItem(item.Name, item.Value.ToString());
                            dropDown.Items.Add(listItem);
                        }                        
                    }
                }
                else // Is not drop down answer type
                {  
                    var isMultiLine = FormField.RenderingInformation != null
                                      &&
                                      FormField.RenderingInformation.ControlType ==
                                      PropertyRenderingControlType.TextArea;
                    var textBox = new BusinessTextBox();

                    if (isMultiLine)
                    {
                        textBox.TextMode = (TextBoxMode) InputMode.MultiLine;
                    }
                    else
                    {
                        textBox.TextMode = (TextBoxMode) InputMode.SingleLine;
                    }
                    textBox.ID = label.AssociatedControlID = controlId = FormField.PropertyId.Replace('-', '_');
                    FieldValueDiv.Controls.Add(textBox);
                    fieldControl = textBox;

                    // Add maximum length validator, if necessary
                    var maxLength = ((PropertyTypeStringData) FormField).MaxLength;
                    if (maxLength != 0)
                    {
                        var validationExpression = string.Format(CultureInfo.InvariantCulture, "^[\\s\\S]{{0,{0}}}$",
                                                                 maxLength.ToString(CultureInfo.InvariantCulture));
                        var errorMessage = string.Format(CultureInfo.InvariantCulture,
                                                         ResourceManager.GetPhrase("ResposeLengthError",
                                                                                   "Limit response to {0} characters"),
                                                         maxLength.ToString(CultureInfo.InvariantCulture));

                        var validator = new RegularExpressionValidator
                            {
                                ControlToValidate = fieldControl.ID,
                                ID = "MaxLengthValidator_" + fieldControl.ID,
                                ErrorMessage = errorMessage,
                                ValidationExpression = validationExpression,
                                ValidationGroup = validationGroup,
                                CssClass = "Important",
                                Display = ValidatorDisplay.Dynamic
                            };

                        FieldValueDiv.Controls.Add(validator);
                    }
                }
            }
            else if (formFieldType == typeof (PropertyTypeBooleanData))
            {
                var radioButtons = new BusinessRadioButtonList();
                radioButtons.RepeatDirection = RepeatDirection.Horizontal;
                radioButtons.Items.Add(ResourceManager.GetWord("Yes"));
                radioButtons.Items.Add(ResourceManager.GetWord("No"));
                radioButtons.Attributes.Add("class", "AutoWidth");
                
                FieldValueDiv.Controls.Add(radioButtons);
                radioButtons.ID = controlId = FormField.PropertyId.Replace('-', '_') + "radioButtonList";       // Javascript looks for this suffix;
                fieldControl = radioButtons;
            }
            else if (formFieldType == typeof(PropertyTypeIntegerData))
            {
                var integerTextBox = new NumberBox();
                
                FieldValueDiv.Controls.Add(integerTextBox);
                integerTextBox.ID = label.AssociatedControlID = controlId = FormField.PropertyId.Replace('-', '_') + "intTextBox";
                integerTextBox.MaxLength = 9;
                
                var integerTextBoxValidator = new RangeValidator
                    {
                        ControlToValidate = integerTextBox.ID,
                        MinimumValue = int.MinValue.ToString(CultureInfo.CurrentCulture),
                        MaximumValue = int.MaxValue.ToString(CultureInfo.CurrentCulture),
                        ErrorMessage = String.Format(CultureInfo.CurrentCulture, ResourceManager.GetPhrase
                                        ("Asi.Web.iParts.Communications.FormDisplay.IntegerTextBoxValidator",
                                        "Enter a whole number")),
                        Type = ValidationDataType.Integer,
                        ValidationGroup = validationGroup,
                        CssClass = "Important",
                        Display = ValidatorDisplay.Dynamic
                    };

                FieldValueDiv.Controls.Add(integerTextBoxValidator);
                
                fieldControl = integerTextBox;
            }
            else if (formFieldType == typeof(PropertyTypeDecimalData))
            {
                var doubleTextBox = new NumberBox();
                FieldValueDiv.Controls.Add(doubleTextBox);
                doubleTextBox.ID = label.AssociatedControlID = controlId = FormField.PropertyId.Replace('-', '_') + "doubleTextBox";
                doubleTextBox.MaxLength = 14;

                var decimalTextBoxValidator = new RangeValidator
                    {
                        ControlToValidate = doubleTextBox.ID,
                        MaximumValue = "99999999999999",
                        MinimumValue = "-9999999999999",
                        ErrorMessage = String.Format(CultureInfo.CurrentCulture, ResourceManager.GetPhrase
                                        ("Asi.Web.iParts.Communications.FormDisplay.DecimalTextBoxValidator",
                                        "Enter numbers only")),
                        Type = ValidationDataType.Double,
                        ValidationGroup = validationGroup,
                        CssClass = "Important",
                        Display = ValidatorDisplay.Dynamic
                    };

                FieldValueDiv.Controls.Add(decimalTextBoxValidator);

                fieldControl = doubleTextBox;
            }
            


            // Set up the control so that when the user clicks the control (radio buttons) or clicks
            // away from the control (the other textbox-based controls),
            // the form field's property id and the control are passed to a JS function
            // which will add the property id and appropriate value to a collection of items to be processed on a save
            // This is always done, but the collection is only utilized when this control is created as part of 
            // a function display, since it is currently created at PreRender time, and the form display button is
            // therefore not wired up to process the responses.  See corresponding .js file and related code in
            // EventProgramDisplayDisplay.  Ick.
            var whichEvent = fieldControl is BusinessRadioButtonList ? "onclick" : "onblur";
            fieldControl.Attributes.Add(whichEvent,
                string.Format(CultureInfo.InvariantCulture,
                    "javascript:SaveFormFieldValue(this, '{0}');",
                    FormField.PropertyId));
            // Belt & Suspenders:  Validators are disabled if controls are hidden, but don't bother
            // adding a required validator if we know the control won't be displayed.
            if (FormField.Visible && FormField.Required)
            {
                var validator = new RequiredFieldValidator
                    {
                        ID = string.Format(CultureInfo.InvariantCulture, "{0}RequiredValidator", label.AssociatedControlID),
                        ControlToValidate = controlId,
                        ErrorMessage = ResourceManager.GetWord("Required"),
                        CssClass = "Error",
                        ValidationGroup = validationGroup,
                        Display = ValidatorDisplay.Dynamic
                    };
                FieldValueDiv.Controls.Add(validator);
                label.CssClass = "Required Label";
            }
        }

        private string ResponseValue
        {
            get 
            {
                var result = string.Empty;
                if (FormField != null
                    && FormResponse != null
                    && FormResponse.Fields != null
                    && FormResponse.Fields.Count > 0)
                {
                    var responseField =
                        FormResponse.Fields.FirstOrDefault(field => field.Name.Equals(FormField.PropertyId));
                    if (responseField != null && responseField.Value != null)
                        result = responseField.Value.ToString();
                }
                return result;
            }
        }
    }
}
