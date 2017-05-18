using System;
using System.Linq;
using Asi.Soa.ClientServices;
using Asi.Soa.Communications.DataContracts;
using Asi.Soa.Core.DataContracts;
using Asi.Soa.Core.ServiceContracts;
using Asi.Web.UI.WebControls;

namespace Asi.Web.iParts.Communications
{
    /// <summary>
    /// Dynamically generate the caption/value pairs assocated with a particular
    /// set of <see cref="FormDefinitionSectionData"/> objects.
    /// </summary>
    /// <remarks>
    /// At load time, this class depends upon the <see cref="FormDefinition"/>,
    ///  <see cref="FormSections"/>, and
    /// <see cref="ContactKey"/> properties having been set already.  It will then
    /// create the appropriate prompts and input fields along with any existing responses
    /// When the responses are submitted, it updates the appropriate 
    /// <see cref="FormResponseData"/> entity via SOA.
    /// </remarks>
    public partial class FormDisplayDisplay : iPartDisplayBase
    {
        #region Event Handlers

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            ShowPanelHeader = false;
            ShowBorder = false;
            Collapsible = false;

            GenerateControls();
        }

        protected override void OnPreRender(EventArgs e)
        {
            // Check FormSections, since it may have been reset between load time and now.
            // Hide any FormSectionDisplay that is no longer in form section.
            // See EventDisplayDisplay.OnPreRender for an example of why this might occur.
            foreach (var control in FormDisplayPlaceholder.Controls)
            {
                var formSectionControl = control as FormSectionDisplay;
                if (formSectionControl != null)
                {
                    formSectionControl.Visible =
                        FormSections.Any(section =>section.FormDefinitionSectionId.Equals(formSectionControl.FormDefinitionSectionId));
                }

            }
            base.OnPreRender(e);
            PopulateResponses();

            SaveMessageLabel.Text = SavedMessage.Value;

            if (!string.IsNullOrEmpty(SavedMessage.Value))
                SavedMessage.Value = string.Empty;

            var totalFieldCount = FormSections.SelectMany(section => section.Fields).Count(field => field.Visible);

            // Hide the save button if all questions are hidden
            SaveResponses.Visible = totalFieldCount > 0;

            if (AtLeastOneResponseExists())
            {
               SaveResponses.Text = totalFieldCount > 1
                ? ResourceManager.GetPhrase("FormSectionDisplayUpdateMultiple", "Update Responses")
                : ResourceManager.GetPhrase("FormSectionDisplayUpdateSingle", "Update Response"); 
            }
            else
            {
                SaveResponses.Text = totalFieldCount > 1
                ? ResourceManager.GetPhrase("FormSectionDisplaySaveMultiple", "Save Responses")
                : ResourceManager.GetPhrase("FormSectionDisplaySaveSingle", "Save Response");
            }
        }

        /// <summary>
        /// Return true if the current Form Display contains at least one already answered question
        /// </summary>
        /// <returns></returns>
        private bool AtLeastOneResponseExists()
        {
            var response = GetResponseData(EntityManager, FormDefinition.FormDefinitionId, ContactKey);
            foreach (var responseField in response.Fields) // Iterate through each already answered response
            {
                var responseFieldName = responseField.Name;
                foreach (var formSection in FormSections)
                {
                    foreach (var formSectionField in formSection.Fields) // Iterate through each question in the form display
                    {
                        var formSectionFieldName = formSectionField.PropertyId;
                        if (formSectionFieldName == responseFieldName) // We found a match, return true
                            return true;
                    }
                }
            }
            return false;

        }

        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets the specific validation group name to use when creating
        /// the validator for this set of form display sections.
        /// </summary>
        /// <remarks>This value is passed on to the objects created this control.</remarks>
        public string ValidationGroupName { get; set; }

        /// <summary>
        /// Gets or sets the set of form definitions that are to be displayed
        /// </summary>
        public FormDefinitionSectionDataCollection FormSections { get; set; }

        /// <summary>
        /// Gets or sets the unique identifier of the contact with which form responses
        /// may be associated.
        /// </summary>
        public string ContactKey { get; set; }

        /// <summary>
        /// Gets or sets the full description
        /// of all the prompts and values, of which we are only concerned
        /// with the subset defined by <see cref="FormSections"/>.
        /// </summary>
        public FormDefinitionData FormDefinition { get; set; }

        /// <summary>
        /// Gets the save responses button for this control.
        /// </summary>
        /// <remark>This can be used by a parent control to, e.g., set OnClientClick</remark>
        public StyledButton SaveButton
        {
            get { return SaveResponses; }
        }
        #endregion

        #region Methods

        private void GenerateControls()
        {
            FormDisplayPlaceholder.Controls.Clear();

            if (FormSections == null || FormSections.Count == 0)
                return;

            var totalFieldCount = FormSections.SelectMany(s => s.Fields).Count();

            if (totalFieldCount == 0)
                return;

            foreach (var section in FormSections)
            {
                var formSection = (FormSectionDisplay)LoadControl(Utilities.GetTildeExpansion() + "/iParts/Communications/FormDisplay/FormSectionDisplay.ascx");
                formSection.FormDefinition = FormDefinition;
                formSection.FormDefinitionSectionId = section.FormDefinitionSectionId;
                formSection.ValidationGroupName = ValidationGroupName;
                FormDisplayPlaceholder.Controls.Add(formSection);
            }
        }

        /// <summary>
        /// Adds responses to FormFieldDisplay's controls.
        /// </summary>
        public void PopulateResponses()
        {
            if (FormDefinition == null) return;
            var response = GetResponseData(EntityManager, FormDefinition.FormDefinitionId, ContactKey);
            foreach (var control in FormDisplayPlaceholder.Controls)
            {
                var formSection = (FormSectionDisplay)control;
                formSection.FormResponse = response;
            }
        }

        /// <summary>
        /// Process responses as a result of a button click.
        /// </summary>
        /// <param name="sender">The control sending the event.  Unused.</param>
        /// <param name="e">Event arguments. Unused.</param>
        protected void SaveResponseButtonClick(object sender, EventArgs e)
        {
            var responseData = GetResponseData(EntityManager, FormDefinition.FormDefinitionId, ContactKey);

            // Look at each of the sections we're showing.
            // For each field in the section, update the response
            // data with the value of the field.
            foreach (var control in FormDisplayPlaceholder.Controls)
            {
                var formSectionDisplay = control as FormSectionDisplay;
                if (formSectionDisplay != null && formSectionDisplay.Visible) // Might be the save button or it might have been hidden
                {
                    formSectionDisplay.UpdateResponse(responseData);
                }
            }
            ValidateResultsData<FormResponseData> result;
            if (string.IsNullOrWhiteSpace(responseData.FormResponseId))
                result = EntityManager.Add(responseData);
            else
                result = EntityManager.Update(responseData);
            if (result.IsValid)
            {
                var totalFieldCount = FormSections.SelectMany(s => s.Fields).Count();
                if (totalFieldCount == 1)
                    SavedMessage.Value = ResourceManager.GetPhrase("ResponseSaved", "Your response has been saved");
                else
                    SavedMessage.Value = ResourceManager.GetPhrase("ResponsesSaved", "Your responses have been saved");
            }
            else
                SavedMessage.Value = ResourceManager.GetPhrase("ErrorSavingResponses",
                                    "There was an error saving the data in one or more responses.  Please contact the site administrator or try again.");

        }

        /// <summary>
        /// Obtain an existing set of responses or build a new empty response set.
        /// </summary>
        /// <param name="entityManager">The instance to use to converse with SOA.</param>
        /// <param name="formDefinitionId">The unique identifier of the associated question definitions.</param>
        /// <param name="contactKey">The unique identifier of the contact for whom there may be associated responses.</param>
        /// <returns>An object consisting of the currently saved responses, or a &quot;new&quot; object, with no
        /// responses, i.e., one ready for filling out and updating.
        /// </returns>
        public static FormResponseData GetResponseData(EntityManager entityManager, string formDefinitionId, string contactKey)
        {
            if (entityManager == null)
                return null;
            var result = entityManager.FindSingle<FormResponseData>(
                CriteriaData.Equal("FormDefinitionId", formDefinitionId),
                CriteriaData.Equal("ParticipantPartyId", contactKey));
            return result ?? new FormResponseData
            {
                FormDefinitionId = formDefinitionId,
                ParticipantPartyId = contactKey,
                Fields = new GenericPropertyDataCollection()
            };
        }

        public void ClearSaveMessage()
        {
            SaveMessageLabel.Text = string.Empty;
        }
        #endregion


        #region Method Overrides

        /// <summary>
        /// Create the appropriate object
        /// </summary>
        /// <returns></returns>
        public override Business.ContentManagement.ContentItem CreateContentItem()
        {
            var item = new FormDisplayCommon { ContentItemKey = ContentItemKey };
            return item;
        }

        /// <summary>
        /// Called on the connection consumer. This method will act on the object passed in from
        /// the connection provider.
        /// </summary>
        /// <param name="providerObject">Object passed in from the connection provider.</param>
        public override void SetObjectProviderData(Object providerObject)
        {
            // TODO: If this iPart is to be a connection consumer, add code here to act on the
            // object passed in from the connection provider. Note that other connection types 
            // are available, see SetAtomObjectProviderData, SetUniformKeyProviderData, 
            // SetStringKeyProviderData.
        }

        /// <summary>
        /// Called on the connection provider. 
        /// </summary>
        /// <returns>An object that will be acted on by the connection consumer.</returns>
        public override Object GetObjectProviderData()
        {
            // TODO: If this iPart is to be a connection provider, add code here to return
            // an object that will be acted on by the connection consumer. Note that other connection 
            // types are available, see GetAtomObjectProviderData, GetUniformKeyProviderData, 
            // GetStringKeyProviderData.
            return null;
        }

        #endregion Method Overrides

        #region Static Methods

        #endregion
    }
}