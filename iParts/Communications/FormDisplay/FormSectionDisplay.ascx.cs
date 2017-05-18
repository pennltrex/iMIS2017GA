using System;
using Asi.Soa.Core.DataContracts;
using Asi.Soa.Communications.DataContracts;
using Asi.Web.UI;
using System.Linq;

namespace Asi.Web.iParts.Communications
{
    /// <summary>
    /// This class will generate the appropriate prompts and input fields
    /// for a given <see cref="FormDefinitionSectionData"/> set of data.
    /// </summary>
    /// <remarks>
    /// At load time, this class depends on the <see cref="FormDefinition"/> and 
    /// <see cref="FormResponse"/> properties having been set already.
    /// </remarks>
    public partial class FormSectionDisplay : UserControlBase
    {

        #region Properties

        /// <summary>
        /// Gets or sets the specific validation group name to use when creating
        /// the validator for this section.
        /// </summary>
        /// <remarks>This value is passed on to the <see cref="FormFieldDisplay"/> objects created for this section.</remarks>
        public string ValidationGroupName { get; set; }

        /// <summary>
        /// Gets or sets the sections to be displayed.
        /// </summary>
        public string FormDefinitionSectionId { get; set; }

        /// <summary>
        /// Gets or sets the full definition of prompts and values, of which
        /// we are concerned with the section identified by 
        /// </summary>
        public FormDefinitionData FormDefinition { get; set; }

        /// <summary>
        /// Gets or sets the response information associated with the form being used.
        /// </summary>
        public FormResponseData FormResponse { get; set; }

        #endregion

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PopulateResponses();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            GenerateControls();
        }

        /// <summary>
        /// Update the form response information based on 
        /// the values held by the controls created by this control.
        /// </summary>
        /// <param name="responseData">The form response information to update.</param>
        public void UpdateResponse(FormResponseData responseData)
        {
            var sectionData = FormDefinition.Sections.FirstOrDefault(
                section => section.FormDefinitionSectionId.Equals(FormDefinitionSectionId));
            if (sectionData != null)
            {
                foreach (var control in SectionPlaceholder.Controls)
                {
                    var formFieldDisplay = control as FormFieldDisplay;
                    if (formFieldDisplay != null)
                    {
                        // Find the proper response field and update it with the 
                        // formFieldDisplay.Value.
                        UpdateResponseFieldForFormField(responseData, formFieldDisplay);
                    }
                }
            }

        }

        // Method asssumes that responseData and responseData.Fields are not null.
        private static void UpdateResponseFieldForFormField(FormResponseData responseData, FormFieldDisplay formFieldDisplay)
        {
            // If the form field itself is not visible, that means the control is not visible, and any
            // existing response for this field should not be touched.
            if (!formFieldDisplay.FormField.Visible)
                return;

            var fieldId = formFieldDisplay.FormField.PropertyId;
            var responseField = responseData.Fields.FirstOrDefault(field => field.Name.Equals(fieldId));
            // There may not be a response field (i.e., this is a new response).  In that case,
            // add a new one.
            if (responseField == null)
            {
                responseField = new GenericPropertyData(fieldId, formFieldDisplay.Value);
                responseData.Fields.Add(responseField);
            }
            else
            {
                responseField.Value = formFieldDisplay.Value;
            }
        }

        private void GenerateControls()
        {
            SectionPlaceholder.Controls.Clear();
            
            if (FormDefinition == null || FormDefinition.Sections == null || FormDefinition.Sections.Count == 0)
                return;

            if (string.IsNullOrWhiteSpace(FormDefinitionSectionId))
                return;

            var sectionData = FormDefinition.Sections.FirstOrDefault(
                    section => section.FormDefinitionSectionId.Equals(FormDefinitionSectionId));

            if (sectionData == null)
                return;

            foreach (var field in sectionData.Fields)
            {
                var formField = (FormFieldDisplay)LoadControl(Utilities.GetTildeExpansion() + "/iParts/Communications/FormDisplay/FormFieldDisplay.ascx");
                formField.FormField = field;
                formField.ValidationGroupName = ValidationGroupName;
                SectionPlaceholder.Controls.Add(formField);
            }
        }

        /// <summary>
        /// Added responses to FormSectionDisplay's controls.
        /// </summary>
        private void PopulateResponses()
        {
            foreach (var control in SectionPlaceholder.Controls)
            {
                var formField = (FormFieldDisplay) control;
                formField.FormResponse = FormResponse;
            }
        }
    }
}