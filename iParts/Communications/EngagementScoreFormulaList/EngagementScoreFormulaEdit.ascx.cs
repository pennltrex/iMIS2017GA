using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using Asi.Soa.ClientServices;
using Asi.Soa.Communications.DataContracts;
using Asi.Soa.Core.DataContracts;
using Asi.Web.UI;
using Asi.Web.UI.WebControls;
using Telerik.Web.UI;
using Asi.Soa.Core.ServiceContracts;

namespace Asi.Web.iParts.Communications.EngagementScoreFormulaList
{
    public partial class EngagementScoreFormulaEdit : UserControlBase
    {
        #region Properties

        private const string enableCheckboxIcon = "&#x2713;";
        private bool RadGridLost { get; set; }
        private EntityManager entityManager;
        private string engagementScoreId = string.Empty;
        private string insertedComponentId = string.Empty;
        private string insertedCategoryId = string.Empty;
        protected const string DocumentHierarchyPath = "$/Common/Engagement/Queries";

        [ExcludeFromCodeCoverage]
        private EntityManager EntityManager
        {
            get { return entityManager ?? (entityManager = new EntityManager()); }
        }

        [ExcludeFromCodeCoverage]
        protected string EngagementScoreId
        {
            get
            {
                if (string.IsNullOrEmpty(engagementScoreId))
                {
                    if (!string.IsNullOrEmpty(Page.Request.QueryString["EngagementScoreId"]))
                        engagementScoreId = Page.Request.QueryString["EngagementScoreId"];
                }
                return engagementScoreId;
            }
            set { engagementScoreId = value; }
        }
        
        [ExcludeFromCodeCoverage]
        private string CurrentComponentId
        {
            get { return (string)ViewState["CurrentComponentId"]; }
            set { ViewState["CurrentComponentId"] = value.Trim().ToUpperInvariant(); }
        }

        [ExcludeFromCodeCoverage]
        private ScoreComponentData EditedScoreComponent
        {
            get { return (ScoreComponentData) ViewState["EditedScoreComponent"]; }
            set { ViewState["EditedScoreComponent"] = value; }
        }

        [ExcludeFromCodeCoverage]
        private EngagementCategoryData EditedCategory
        {
            get { return (EngagementCategoryData)ViewState["EditedCategory"]; }
            set { ViewState["EditedCategory"] = value; }
        }

        [ExcludeFromCodeCoverage]
        private EngagementCategoryData SavedCategoryInCaseOfCancel
        {
            get { return (EngagementCategoryData)ViewState["SavedCategoryInCaseOfCancel"]; }
            set { ViewState["SavedCategoryInCaseOfCancel"] = value; }
        }

        [ExcludeFromCodeCoverage]
        private CategoryCriteriaDataCollection CriteriaDefinedBeforeInitialSave
        {
            get { return (CategoryCriteriaDataCollection)ViewState["CriteriaDefinedBeforeInitialSave"]; }
            set { ViewState["CriteriaDefinedBeforeInitialSave"] = value; }

        }

        [ExcludeFromCodeCoverage]
        private bool InsertingCriterion
        {
            get
            {
                if (ViewState["InsertingCriterion"] == null)
                    return false;
                return (bool)ViewState["InsertingCriterion"];
            }
            set { ViewState["InsertingCriterion"] = value; }
        }

        [ExcludeFromCodeCoverage]
        protected  EngagementScoreData EngagementScoreFormula  
        {
            get
            {
                if (ViewState["EngagementScoreFormula"] == null)
                {
                    if (!string.IsNullOrEmpty(EngagementScoreId))
                    {
                        ViewState["EngagementScoreFormula"] = EntityManager.FindByIdentity<EngagementScoreData>(new[] { EngagementScoreId });
                    }
                }
                return (EngagementScoreData)ViewState["EngagementScoreFormula"];
            }
            set { ViewState["EngagementScoreFormula"] = value; }
        }

        [ExcludeFromCodeCoverage]
        private string ReturnUrl
        {
            get { return (string)ViewState["ReturnUrl"]; }
            set { ViewState["ReturnUrl"] = value; }
        }

        [ExcludeFromCodeCoverage]
        private bool IsEditingCategory
        {
            get { return EditedCategory != null; }
        }

       
        [ExcludeFromCodeCoverage]
        private bool IsEditingComponent
        {
            get
            {
                var result = ViewState["IsEditingComponent"];
                return result != null && (bool)ViewState["IsEditingComponent"];
            }
            set { ViewState["IsEditingComponent"] = value; }
        }

        /// <summary>
        /// Warning message in response to recalculate historical scores button
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string RecalculateWarning
        {
            get
            {
                return HttpUtility.JavaScriptStringEncode(GetTranslatedPhrase(ResourceManager.GetPhrase("Asi.Web.iParts.EngagementScoreFormulaList.RecalculateWarning",
                    "Warning: Recalculating scores will purge all historical scores based on this formula and re-calculate them based on any changes. Are you sure you want to do this?")));
            }
        }

        /// <summary>
        /// Warning message in response to copy request
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string CloneWarning
        {
            get
            {
                return HttpUtility.JavaScriptStringEncode(GetTranslatedPhrase(ResourceManager.GetPhrase("Asi.Web.iParts.EngagementScoreFormulaList.CloneWarning",
                    "Do you want to duplicate this engagement score formula?")));
            }
        }

        /// <summary>
        /// "Cancel" phrase for color picker javascript
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string ColorPickerPhraseCancel
        {
            get
            {
                return GetTranslatedPhraseEncodedForJavaScript(ResourceManager.GetPhrase("cancel", "cancel"));
            }
        }

        /// <summary>
        /// "Choose" phrase for color picker javascript
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string ColorPickerPhraseChoose
        {
            get
            {
                return GetTranslatedPhraseEncodedForJavaScript(ResourceManager.GetPhrase("choose", "choose"));
            }
        }

        /// <summary>
        /// "Clear color selection" phrase for color picker javascript
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string ColorPickerPhraseClearColorSelection
        {
            get
            {
                return GetTranslatedPhraseEncodedForJavaScript(ResourceManager.GetPhrase("ClearColorSelection", "Clear color selection"));
            }
        }

        /// <summary>
        /// "No color selected" phrase for color picker javascript
        /// </summary>
        [ExcludeFromCodeCoverage]
        public string ColorPickerPhraseNoColorSelected
        {
            get
            {
                return GetTranslatedPhraseEncodedForJavaScript(ResourceManager.GetPhrase("NoColorSelected", "No color selected"));
            }
        }

        /// <summary>
        /// Informational message for disabled recalculate button.
        /// </summary>
        [ExcludeFromCodeCoverage]
        public  string DisabledButtonInformation
        {
            get
            {
                return HttpUtility.JavaScriptStringEncode(GetTranslatedPhrase(ResourceManager.GetPhrase("Asi.Web.iParts.EngagementScoreFormulaList.DisabledButtonInformation",
                    "Disabled engagement score formulas cannot be recalculated")));
            }
        }

        #endregion

        #region Method Overrides

        [ExcludeFromCodeCoverage]
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            RadGrid1.NeedDataSource += RadGrid1NeedDataSource;
            RadGrid1.ItemDataBound += RadGrid1ItemDataBound;
            RadGrid1.ItemCreated += RadGrid1ItemCreated;
            if (IsLicensed)
            {
                RadGrid1.DeleteCommand += RadGrid1DeleteCommand;
                RadGrid1.InsertCommand += RadGrid1InsertCommand;
            }
            else
            { 
                RadGrid1.MasterTableView.Columns.FindByUniqueName("Delete").Visible = false;
                SaveAs.Visible = false;
            }
            RadGrid1.UpdateCommand += RadGrid1UpdateCommand;
            RadGrid1.CancelCommand += RadGrid1CancelCommand;
            RadGrid1.ItemCommand += RadGrid1ItemCommand;

            RadGrid2.NeedDataSource += RadGrid2NeedDataSource;
            RadGrid2.ItemDataBound += RadGrid2ItemDataBound;
            RadGrid2.ItemCreated += RadGrid2ItemCreated;
            RadGrid2.DeleteCommand += RadGrid2DeleteCommand;
            RadGrid2.InsertCommand += RadGrid2InsertCommand;
            RadGrid2.UpdateCommand += RadGrid2UpdateCommand;
            RadGrid2.CancelCommand += RadGrid2CancelCommand;
            RadGrid2.ItemCommand += RadGrid2ItemCommand;

        }

       
        [ExcludeFromCodeCoverage]
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
                Initialize();

            labelError.Visible = false;
            labelError.Text = string.Empty;
        }

        [ExcludeFromCodeCoverage]
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //This value is stored in case the radgrid state is lost by a double postback from the objectbroswer
            if (RadGrid1.MasterTableView.IsItemInserted)
            {
                Session["IsItemInserted"] = true;
            }
            SaveAs.Enabled = !string.IsNullOrEmpty(EngagementScoreId);
            // RRK TODO - The following assignment should be uncommented to make
            // all the category stuff invisible, or commented to make it visible.
            //RadGrid2.Visible = RadGrid2.Enabled = CategoryGridLabelSpan.Visible =
            //    CategoryLabelError.Visible = CategoryLabelError.Enabled = false;
        }

        ///// <summary>
        ///// Check whether the system is being used by internal ASI staff.  
        ///// This is used in conjunction with SystemType to determine which fields are seen and which are editable.
        ///// </summary>
        //private bool IsAsiInternal
        //{
        //    get { return Asi.Security.Utility.SecurityHelper.IsAsiInternal; }
        //}

        #endregion

        /// <summary>
        /// Create a copy of the current engagement score
        /// </summary>      
        [ExcludeFromCodeCoverage]  
        protected internal void SaveAsClick(object sender, EventArgs e)
        {
            UpdateDataContractFromForm();

            var results = EngagementScoreFormulaListHelper.SaveAs(EngagementScoreFormula, EntityManager);

            if (results.IsValid)
            {
                var url = EngagementScoreFormulaListHelper.BuildNewUrl(results.Entity as EngagementScoreData, Request.RawUrl, EngagementScoreFormula.EngagementScoreId);
                if (!string.IsNullOrEmpty(url))
                    Response.Redirect(url);

                else
                {
                    ((DisplayPageBase) Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                        ResourceManager.GetPhrase("EngagementFormulaCopyError1",
                            "Unable to clone the original formula")));

                }
            }
            else
                ((DisplayPageBase) Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                    ResourceManager.GetPhrase("EngagementFormulaCopyError",
                        "There was an error copying the formula. {0}",
                        results.ValidationResults.Summary)));
        }

        /// <summary>
        /// This method fills the Engagement score formula information (as opposed to information relating to just one component of the formula)
        /// </summary>
        [ExcludeFromCodeCoverage]
        protected void FillEngagementScoreForm()
        {
            if (string.IsNullOrEmpty(EngagementScoreId))
            {
                RadGrid1.DataSource = string.Empty;
                RadGrid1.Enabled = false; 
                FormulaEnabledCheckBox.Checked = true;
            }           
            else if (!string.IsNullOrEmpty(EngagementScoreId))
            {
                EngagementScoreFormula = EngagementScoreFormulaListHelper.FindEngagementScore(EntityManager, EngagementScoreId);
                if (EngagementScoreFormula != null)
                {
                    EngagementScoreTextBoxName.Text = EngagementScoreFormula.Name;
                    EngagementScorePanel.Text = EngagementScoreTextBoxName.Text;
                    EngagementScorePanel.DoNotTranslateTitle = true;
                    FormulaEnabledCheckBox.Checked = RecalculationButton.Enabled = EngagementScoreFormula.IsEnabled;
                    DisabledInformationLabel.Visible = !RecalculationButton.Enabled;

                    // EngagementScoreTextBoxDescription is the description text box
                    EngagementScoreTextBoxDescription.Text = EngagementScoreFormula.Description;

                    if (SystemTypeDropDown.Visible && !string.IsNullOrEmpty(EngagementScoreFormula.SystemTypeCode.ToString()) && EngagementScoreFormula.SystemTypeCode != 0)
                        SystemTypeDropDown.SelectedValue = EngagementScoreFormula.SystemTypeCode.ToString();
                }
            }
        }

        [ExcludeFromCodeCoverage]
        protected void Initialize()
        {

            if (Request.UrlReferrer != null)
                ReturnUrl = Request.UrlReferrer.AbsoluteUri;

            Session["IsItemInserted"] = false;

            //Button captions
            SubmitButton.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("SubmitButton", "Save"));
            ResetCancelButton.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("CancelButton", "Cancel"));
            SaveAs.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("SaveAsButton", "Save As"));
            DisabledInformationLabel.Text = DisabledButtonInformation;
            GridLabelSpan.InnerText = GetTranslatedPhrase(ResourceManager.GetPhrase("ScoreComponents", "Score components"));
            CategoryGridLabelSpan.InnerText = GetTranslatedPhrase(ResourceManager.GetPhrase("Categories", "Categories"));

            FormulaEnabledCheckBox.Caption = ResourceManager.GetWord("Enabled");

            //create new notification set/details
            EngagementScoreFormula = new EngagementScoreData
            {
                IsEnabled = true,
                ScoreComponents = new ScoreComponentDataCollection()
            };

            FillEngagementScoreForm();

            SystemTypeDropDown.Visible = EngagementScoreFormulaListCommon.IsAsiInternal;
            if (!SystemTypeDropDown.Visible) return;
            foreach (var i in EngagementScoreFormulaListCommon.GetSystemTypeRefList())
            {
                var listItem = new ListItem
                {
                    Value = i.First.ToString(CultureInfo.InvariantCulture),
                    Text = i.Second.ToString(CultureInfo.CurrentCulture)
                };
                SystemTypeDropDown.Items.Add(listItem);
            }
            SystemTypeDropDown.DisplayCaption = true;
            SystemTypeDropDown.Caption = GetTranslatedPhrase(ResourceManager.GetPhrase("Type", "Type"));
            SystemTypeDropDown.DataBind();
        }

        /// <summary>
        /// Save the Engagement score formula Name and Description
        /// </summary>   
        [ExcludeFromCodeCoverage]     
        protected internal void SubmitClick(object sender, EventArgs e)
        {
            LabelErrorMessage.Text = string.Empty;

            UpdateDataContractFromForm();
            
            var results = EngagementScoreFormulaListHelper.AddOrUpdateFormula(EntityManager, EngagementScoreFormula);
            if (results.IsValid)
            {
                ((DisplayPageBase)Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Success, ResourceManager.GetPhrase("SuccessfullySaved", "Successfully saved")));               
                DivLabelErrorMessage.Visible = false;
                engagementScoreId = ((EngagementScoreData) results.Entity).EngagementScoreId;
                EngagementScoreFormula = ((EngagementScoreData) results.Entity);
                RadGrid1.Enabled = true;
                FillEngagementScoreForm();
                RadGrid1.DataSource = null;
                RadGrid1.Rebind();
                RadGrid2.DataSource = null;
                RadGrid2.Rebind();
                RefreshPanel.Update();               
            }
            else
            {
                var msg = new System.Text.StringBuilder();
                foreach (var error in results.ValidationResults.Errors)
                {
                    msg.Append(error.Message + "<br />");
                }
                LabelErrorMessage.Text = msg.ToString();
                DivLabelErrorMessage.Visible = true;
            }
        }

        [ExcludeFromCodeCoverage]
        private void UpdateDataContractFromForm()
        {
            EngagementScoreFormula.Name = EngagementScoreTextBoxName.Text;
            EngagementScorePanel.Text = EngagementScoreFormula.Name;
            EngagementScoreFormula.Description = EngagementScoreTextBoxDescription.Text;
            EngagementScoreFormula.IsEnabled = FormulaEnabledCheckBox.Checked;
            if(!string.IsNullOrEmpty(SystemTypeDropDown.SelectedValue))
                EngagementScoreFormula.SystemTypeCode = Convert.ToInt32(SystemTypeDropDown.SelectedValue);
        }

        [ExcludeFromCodeCoverage]
        protected internal void ResetCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ReturnUrl);
        }

        [ExcludeFromCodeCoverage]
        protected internal void Recalculate_Click(object sender, EventArgs e)
        {
            EngagementScoreFormulaListHelper.SendRecalculateRequest(EntityManager, EngagementScoreFormula);
        }
        
        [ExcludeFromCodeCoverage]
        protected void FormulaEnabledCheckBox_OnCheckedChanged(object sender, EventArgs e)
        {
            var checkBox = sender as BusinessCheckBox;
            if (checkBox != null)
            {
                RecalculationButton.Enabled = checkBox.Checked;
                DisabledInformationLabel.Visible = !RecalculationButton.Enabled;
            }
        }

        #region Radgrid methods for Component grid


        [ExcludeFromCodeCoverage]
        private void RadGrid1ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.EditCommandName || e.CommandName == RadGrid.InitInsertCommandName)
            {
                var saveText = GetTranslatedPhrase(ResourceManager.GetPhrase("SaveButton", "Save"));
                RadGrid1.MasterTableView.EditFormSettings.EditColumn.InsertText = saveText;
                RadGrid1.MasterTableView.EditFormSettings.EditColumn.UpdateText = saveText;
                RadGrid1.MasterTableView.EditFormSettings.EditColumn.CancelText = GetTranslatedPhrase(ResourceManager.GetPhrase("CancelButton", "Cancel"));
                IsEditingComponent = true;
            }
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid1CancelCommand(object sender, GridCommandEventArgs e)
        {
            var foundIndex = EngagementScoreFormulaListHelper.FindMatchingComponent(EditedScoreComponent == null
                ? string.Empty : EditedScoreComponent.ScoreComponentId, EngagementScoreFormula.ScoreComponents);
            if (foundIndex >= 0)
            {
                if (EditedScoreComponent != null)
                {
                    // we canceled an existing one, so we want to restore it to the previous state
                    EngagementScoreFormula.ScoreComponents[foundIndex] = EditedScoreComponent;
                }
                else
                {
                    // we canceled a newly-entered one, so we want to remove it from the list
                    EngagementScoreFormula.ScoreComponents.RemoveAt(foundIndex);
                }
            }
            IsEditingComponent = false;
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid1NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            var list = new List<ScoreComponentData>();
            if (EngagementScoreFormula == null || EngagementScoreFormula.ScoreComponents == null) return;

            //Collection already comes sorted from persistence
            foreach (var scoreComponent in EngagementScoreFormula.ScoreComponents)
                list.Add(scoreComponent);

            RadGrid1.DataSource = list;
            var isItemInserted = (Session["IsItemInserted"] != null && (bool) Session["IsItemInserted"]);

            //Double postback issues with the object browser can cause the radgrid to lose its state.        
            if (e.RebindReason == GridRebindReason.InitialLoad && isItemInserted)
            {
                RadGridLost = true;
            }
        }

        [ExcludeFromCodeCoverage]
        protected void RadGrid1ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var commandItem = e.Item as GridCommandItem;

            //Disable the command buttons until the EngagementScore is saved
            if (e.Item is GridCommandItem)
            {
                var addButton = (LinkButton)commandItem.FindControl("AddButton");
                var addButtonImage = (Image)commandItem.FindControl("AddButtonImage");
                if (!HaveEngagementScore())
                {
                    addButton.Enabled =
                        addButton.Visible = false;
                    addButtonImage.Enabled = false;
                }
                else
                {
                    addButton.Enabled = 
                        addButton.Visible = 
                            addButtonImage.Enabled = IsLicensed;
                }
            }
            // Fill in display with ScoreComponent data when not in edit mode
            if (e.Item is GridDataItem && !e.Item.IsInEditMode && HaveEngagementScore())
            {
                var component = e.Item.DataItem as ScoreComponentData;
                // If there is no component ID this is a new one - we want to show it in edit mode, but not in the grid
                if (component != null && string.IsNullOrEmpty(component.ScoreComponentId))
                    e.Item.Display = false;
                else
                    SetupDisplayPanel(e);
            }

            // Fill in display if we are in edit mode (so we can edit one score component while still seeing all the other score components)
            else if ((e.Item is GridEditableItem) && e.Item.IsInEditMode)
            {
                SetupEditPanel(e);
            }
        }

        [ExcludeFromCodeCoverage]
        private bool HaveEngagementScore()
        {
            return (EngagementScoreFormula != null 
                && !string.IsNullOrEmpty(EngagementScoreFormula.EngagementScoreId));
        }

        [ExcludeFromCodeCoverage]
        private void SetupHeaders(GridHeaderItem header)
        {
            header["ScoreComponentIdColumn"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayName", "Name"));
            header["IqaQueryLabel"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayIQAQuery", "IQA Query"));
            header["ScoreCalculationLabel"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayScoreCalculation", "Score Calculation"));
            header["MultiplierLabel"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayMultiplier", "Multiplier"));
        }

        [ExcludeFromCodeCoverage]
        protected void RadGrid1ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var noRecords = e.Item as GridNoRecordsItem;
            if (noRecords != null)
            {
                var label = (BusinessLabel)noRecords.FindControl("NoRecordLabel");
                if (label != null)
                    label.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayNone", "(None)"));
            }
            var header = e.Item as GridHeaderItem;
            if (header != null)
                SetupHeaders(header);

            //workaround to put the radgrid back in insert mode if the radgrid is lost
            if (RadGridLost)
            {
                RadGrid1.MasterTableView.IsItemInserted = true;
                Session["IsItemInserted"] = null;
                RadGridLost = false;
            }
        }

        /// <summary>
        /// Save updates to score components that make up an engagement formula
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        protected void RadGrid1UpdateCommand(object source, GridCommandEventArgs e)
        {
            if (e == null) return;
            GridEditableItem item = e.Item as GridEditableItem;
            if (item != null)
            {
                var scoreComponentKeyString = (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ScoreComponentId"];
                var scoreComponentKey = Utilities.IsGuid(scoreComponentKeyString) ? new Guid(scoreComponentKeyString) : Guid.Empty;
               
                if (scoreComponentKey != Guid.Empty && EngagementScoreFormula.ScoreComponents.Count > 0)
                {
                    var component = EngagementScoreFormula.ScoreComponents.SingleOrDefault(x => x.ScoreComponentId.Equals(scoreComponentKeyString));

                    if (component != null)
                    {
                        UpdateComponentFromControls(item, component);
                        labelError.Visible = false;
                        labelError.Text = string.Empty;

                        var updateEngagementScoreResults = EntityManager.Update(EngagementScoreFormula);
                        if (!updateEngagementScoreResults.IsValid)
                        {
                            labelError.Visible = true;
                            labelError.Text = ResourceManager.GetPhrase("EngagementScoreUpdateError", "There was an error updating your EngagementScore and ScoreComponent.");
                            e.Canceled = true;
                            return;
                        }
                        EngagementScoreFormula = updateEngagementScoreResults.Entity;
                    }
                }
                RadGrid1.Rebind();
            }
            IsEditingComponent = false;
        }

        [ExcludeFromCodeCoverage]
        private static void UpdateComponentFromControls(GridEditableItem item, ScoreComponentData component)
        {

            if (component != null)
            {
                var scoreComponentDisplayNameControl = (BusinessTextBox) item.FindControl("ScoreComponentTextBoxDisplayName");
                var scoreComponentIqaQueryControl = (BusinessDocumentBrowserControl)item.FindControl("ScoreComponentTextBoxIqaQuery");
                var scoreComponentDropDownFunctionControl = (BusinessDropDownList)item.FindControl("ScoreComponentDropDownFunction");
                var scoreComponentDropDownFunctionPropertyNameControl = (BusinessDropDownList)item.FindControl("ScoreComponentDropDownFunctionPropertyName");
                var scoreComponentMultiplierControl = (BusinessTextBox)item.FindControl("ScoreComponentTextBoxMultiplier");
                EngagementScoreFormulaListHelper.SetIsSampled(component);

                if (scoreComponentDisplayNameControl != null)
                    component.DisplayName = scoreComponentDisplayNameControl.Text;
                if (scoreComponentIqaQueryControl != null)
                    EngagementScoreFormulaListHelper.ConnectScoreComponentIqaDataSource(component, scoreComponentIqaQueryControl.Text);
                var function = (FunctionData)Enum.Parse(typeof (FunctionData), scoreComponentDropDownFunctionControl.SelectedValue, true);
                component.FunctionData = function;
                if (scoreComponentDropDownFunctionPropertyNameControl != null)
                    component.FunctionPropertyName = function.Equals(FunctionData.Sum)
                        ? scoreComponentDropDownFunctionPropertyNameControl.SelectedValue
                        : string.Empty;
                if (scoreComponentMultiplierControl != null)
                    component.Weight.Multiplier = scoreComponentMultiplierControl.Text.AsFloat();

            }

        }

        [ExcludeFromCodeCoverage]
        protected void RadGrid1DeleteCommand(object source, GridCommandEventArgs e)
        {
            if (e == null) return;
            
            var scoreComponentKeyString = (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ScoreComponentId"];
            var scoreComponentKey = Utilities.IsGuid(scoreComponentKeyString) ? new Guid(scoreComponentKeyString) : Guid.Empty;

            if (scoreComponentKey != Guid.Empty)
            {
                ScoreComponentData mappingOneComponentData = EngagementScoreFormula.ScoreComponents.SingleOrDefault(x => !string.IsNullOrEmpty(x.ScoreComponentId) && x.ScoreComponentId.Equals(scoreComponentKeyString));
                if (mappingOneComponentData != null)
                {
                    //clear errors
                    labelError.Visible = false;
                    labelError.Text = string.Empty;

                    EngagementScoreFormula.ScoreComponents.Remove(mappingOneComponentData);
                    ValidateResultsData<EngagementScoreData> res = null;
                    var errorMessage = ResourceManager.GetPhrase("ScoreComponentDeleteError", "There was an error deleting your score component.");
                    try
                    {
                        res = EntityManager.Update(EngagementScoreFormula);
                    }
                    catch (FaultException)
                    {
                        errorMessage = ResourceManager.GetPhrase("ScoreComponentDeleteErrorException", "The component is in use and cannot be deleted.");
                    }
                    if (res == null || !res.IsValid)
                    {
                        EngagementScoreFormula.ScoreComponents.Add(mappingOneComponentData);
                        clientsideAlerts.Text = res == null || string.IsNullOrEmpty(res.ValidationResults.Summary)
                            ? errorMessage
                            : res.ValidationResults.Summary;
                        e.Canceled = true;
                        return;
                    }
                    EngagementScoreFormula = res.Entity;
                }
            }
        }

        /// <summary>
        /// Save a first version of one score component entry for an engagement score formula
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        protected void RadGrid1InsertCommand(object source, GridCommandEventArgs e)
        {
            if (e == null) return;

            GridEditFormInsertItem item = (GridEditFormInsertItem)(RadGrid1.MasterTableView.GetInsertItem());
            if (item != null)
            {
                labelError.Visible = false;
                labelError.Text = string.Empty;

                var scoreComponentIqaQueryControl = (BusinessDocumentBrowserControl)item.FindControl("ScoreComponentTextBoxIqaQuery");
                var queryValidationMessage = (StyledLabel)e.Item.FindControl("QueryValidationMessage");
                var queryinfoMessage = (StyledLabel)e.Item.FindControl("QueryInfoMessage");


                if (!EngagementScoreFormulaListHelper.ValidateQuery(queryValidationMessage, queryinfoMessage, scoreComponentIqaQueryControl.Text))
                {
                    e.Canceled = true;
                    return;
                }

                var component = EngagementScoreFormulaListHelper.GetOrCreateScoreComponent(EngagementScoreFormula.ScoreComponents, insertedComponentId);
                UpdateComponentFromControls(item, component);

                var updateResult = EntityManager.Update(EngagementScoreFormula);
                if (!updateResult.IsValid)
                {
                    labelError.Visible = true;
                    labelError.Text = ResourceManager.GetPhrase("ScoreComponentAddError", "There was an error adding your score component.");
                    e.Canceled = true;
                    return;
                }
                EngagementScoreFormula = updateResult.Entity;
                // remember the id of the component we just entered.
                insertedComponentId = (from scoreComponent in EngagementScoreFormula.ScoreComponents where scoreComponent.DisplayName.Equals(component.DisplayName) select scoreComponent.ScoreComponentId).FirstOrDefault();
                //force the grid to update
                RadGrid1.DataSource = null;
                IsEditingComponent = false;
            }
        }
    
        /// <summary>
        /// Performs operations needed to display one grid row in display mode
        /// </summary>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        private void SetupDisplayPanel(GridItemEventArgs e)
        {
            var mappingOneComponentData = (ScoreComponentData)e.Item.DataItem;

            // Fill in the values when in Display mode
            var scoreComponentDisplayNameDisplay = e.Item.FindControl("ScoreComponentDisplayNameDisplay") as BusinessLabel;
            if (scoreComponentDisplayNameDisplay != null)
                scoreComponentDisplayNameDisplay.Text = mappingOneComponentData.DisplayName;

            var scoreComponentIqaQueryDisplay = e.Item.FindControl("ScoreComponentIqaQueryDisplay") as BusinessLabel;
            if (scoreComponentIqaQueryDisplay != null)
                scoreComponentIqaQueryDisplay.Text = EngagementScoreFormulaListHelper.GetQueryNameFromIqaDataSource(mappingOneComponentData.DataSource);

            var scoreComponentScoreCalculationDisplay = e.Item.FindControl("ScoreComponentScoreCalculationDisplay") as BusinessLabel;
            if (scoreComponentScoreCalculationDisplay != null)
                scoreComponentScoreCalculationDisplay.Text = GetTranslatedPhrase(EngagementScoreFormulaListHelper.GetCalculationDisplayValue(mappingOneComponentData));

            var scoreComponentMultiplierDisplay = e.Item.FindControl("ScoreComponentMultiplierDisplay") as BusinessLabel;
            if (scoreComponentMultiplierDisplay != null)
                scoreComponentMultiplierDisplay.Text = mappingOneComponentData.Weight.Multiplier.ToString(CultureInfo.CurrentCulture);
        }

        /// <summary>
        /// Display one score component grid row (One line within the Engagement score formula) in edit mode
        /// </summary>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        private void SetupEditPanel(GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                var editedItem = e.Item as GridEditFormItem;
                
                PopulateEditPanel(editedItem, FunctionData.None, string.Empty);
               
                var saveButton = e.Item.FindControl("UpdateButton") as Button ??
                                 e.Item.FindControl("PerformInsertButton") as Button;
                if (saveButton != null)
                    saveButton.CssClass = "TextButton PrimaryButton";

                var cancelButton = e.Item.FindControl("CancelButton") as Button;
                if (cancelButton != null)
                    cancelButton.CssClass = "TextButton";
            }
        }

        /// <summary>
        /// Fill the Function Property (where the Column to sum is chosen) drop down list
        /// </summary>
        /// <param name="componentScoreFunctionPropertyNameDropDown"></param>
        /// <param name="oneComponentScoreDataSource"></param>
        [ExcludeFromCodeCoverage]
        private void FillScoreComponentDropDownFunctionPropertyName(BusinessDropDownList componentScoreFunctionPropertyNameDropDown, DataSourceQueryData oneComponentScoreDataSource)
        {
            componentScoreFunctionPropertyNameDropDown.Items.Clear();

            // Retrieve this fields that are returned from the IQA query in ScoreComponent.DataSource
            var properties = EngagementScoreFormulaListHelper.GetPropertyListFromQueryDataSource(EntityManager, oneComponentScoreDataSource);
            foreach (var property in properties)
            {
                if (EngagementScoreFormulaListHelper.IsNumericType(property.Value))
                {
                    var item = new ListItem(property.Key, property.Key);
                    componentScoreFunctionPropertyNameDropDown.Items.Add(item);
                }
            }
            componentScoreFunctionPropertyNameDropDown.DataBind();
            if (componentScoreFunctionPropertyNameDropDown.Items.Count > 0)
                componentScoreFunctionPropertyNameDropDown.Items[0].Text = GetTranslatedPhrase(componentScoreFunctionPropertyNameDropDown.Items[0].Text);
        }

        [ExcludeFromCodeCoverage]
        protected void ScoreComponentDropDownFunction_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var dd = sender as BusinessDropDownList;
            if (dd != null)
            {
                var editedItem = dd.NamingContainer as GridEditFormItem;
                var function = (FunctionData)Enum.Parse(typeof(FunctionData), dd.SelectedValue, true);
                PopulateEditPanel(editedItem, function, string.Empty);
            }
        }

        [ExcludeFromCodeCoverage]
        protected void ScoreComponentTextBoxIqaQuery_OnDataChanged(object sender, EventArgs e)
        {
            var selector = sender as BusinessDocumentBrowserControl;
            if (selector != null)
            {
                var editedItem = selector.NamingContainer as GridEditFormItem;
                if (editedItem != null)
                {
                    var queryValidationMessage = (StyledLabel)editedItem.FindControl("QueryValidationMessage");
                    var queryInfoMessage = (StyledLabel)editedItem.FindControl("QueryInfoMessage");

                    if (!EngagementScoreFormulaListHelper.ValidateQuery(queryValidationMessage, queryInfoMessage, selector.Text))
                        return;
                }
                PopulateEditPanel(editedItem, FunctionData.None, selector.Text);
            }
        }

        [ExcludeFromCodeCoverage]
        private void PopulateEditPanel(GridEditFormItem editedItem, FunctionData function, string queryName)
        {
            if (editedItem != null)
            {
                var scoreComponentDropDownFunction = editedItem.FindControl("ScoreComponentDropDownFunction") as BusinessDropDownList;
                if (scoreComponentDropDownFunction != null)
                {
                    EngagementScoreFormulaListHelper.FillScoreComponentDropDownFunction(scoreComponentDropDownFunction);
                    foreach (ListItem item in scoreComponentDropDownFunction.Items)
                    {
                        item.Text = GetTranslatedPhrase(item.Text);
                    }
                }

                CurrentComponentId = string.Empty;
                if (editedItem.ItemIndex >= 0)
                {
                    PopulateEditPanelForExistingComponent(editedItem, function, queryName);
                }
                else
                {
                    PopulateEditPanelForNewComponent(editedItem, function);
                }
            }
        }

        [ExcludeFromCodeCoverage]
        private void PopulateEditPanelForNewComponent(GridEditFormItem editedItem, FunctionData function)
        {
            if (EngagementScoreFormula == null)
                EngagementScoreFormula = new EngagementScoreData();
            var component = EngagementScoreFormulaListHelper.GetOrCreateScoreComponent(EngagementScoreFormula.ScoreComponents, insertedComponentId);

            if (string.IsNullOrEmpty(insertedComponentId))
            {
                var scoreComponentMultiplierControl = (BusinessTextBox)editedItem.FindControl("ScoreComponentTextBoxMultiplier");
                var scoreComponentIqaQueryControl = (BusinessDocumentBrowserControl)editedItem.FindControl("ScoreComponentTextBoxIqaQuery");
                if (string.IsNullOrEmpty(scoreComponentMultiplierControl.Text))
                {
                    scoreComponentMultiplierControl.Text = 1.ToString("N1", CultureInfo.CurrentCulture);
                }
                if (component.DataSource == null)
                    component.DataSource = new DataSourceData();

                scoreComponentIqaQueryControl.BrowserButtonText =
                    GetTranslatedPhrase(ResourceManager.GetWord("Select"));
                SetupFunctionInfo(editedItem, component, function);
                component.Weight = new WeightData();
                UpdateComponentFromControls(editedItem, component);
            }
        }

        [ExcludeFromCodeCoverage]
        private void PopulateEditPanelForExistingComponent(GridEditFormItem editedItem, FunctionData function, string queryName)
        {
            // We are finding the data for one component within a collection of score components
            var component = EngagementScoreFormula.ScoreComponents[editedItem.ItemIndex];
            // Only set this the first time through.  The purpose of this is to be able to put things back the way 
            // they were in the event of a cancel.
            if (EditedScoreComponent == null)
                EditedScoreComponent = component;
            if (!string.IsNullOrEmpty(queryName))
                EngagementScoreFormulaListHelper.SetQueryNameInIqaDataSource(
                    component.DataSource, queryName);

            // Fill in the values when in Edit mode

            var scoreComponentTextBoxDisplayName =
                editedItem.FindControl("ScoreComponentTextBoxDisplayName") as BusinessTextBox;
            if (scoreComponentTextBoxDisplayName != null)
                scoreComponentTextBoxDisplayName.Text = component.DisplayName;

            var scoreComponentTextBoxIqaQuery =
                editedItem.FindControl("ScoreComponentTextBoxIqaQuery") as BusinessDocumentBrowserControl;
            if (scoreComponentTextBoxIqaQuery != null)
            {

                scoreComponentTextBoxIqaQuery.Text =
                    EngagementScoreFormulaListHelper.GetQueryNameFromIqaDataSource(
                        component.DataSource);
                scoreComponentTextBoxIqaQuery.BrowserButtonText =
                    GetTranslatedPhrase(ResourceManager.GetWord("Select"));
            }

            SetupFunctionInfo(editedItem, component, function);

            var scoreComponentTextBoxMultiplier =
                editedItem.FindControl("ScoreComponentTextBoxMultiplier") as BusinessTextBox;
            if (scoreComponentTextBoxMultiplier != null)
                scoreComponentTextBoxMultiplier.Text =
                    component.Weight.Multiplier.ToString(CultureInfo.CurrentCulture);

            CurrentComponentId = component.ScoreComponentId;

        }

        [ExcludeFromCodeCoverage]
        private void SetupFunctionInfo(GridEditableItem editedItem, ScoreComponentData componentData, FunctionData function)
        {
            if (function != FunctionData.None)
                componentData.FunctionData = function;
            // FunctionPropertyName Drop-down (Column to Sum)
            // This is the dropdown with the Column to sum (from FunctionPropertyName)
            var propertyNameList = editedItem.FindControl("ScoreComponentDropDownFunctionPropertyName") as BusinessDropDownList;
            var functionList = (BusinessDropDownList)editedItem.FindControl("ScoreComponentDropDownFunction");
            var functionLabel = editedItem.FindControl("ScoreComponentDropDownFunctionPropertyNameLabel") as BusinessLabel;
            var validator = editedItem.FindControl("PropertyNameRequiredValidator") as AsiRequiredFieldValidator;
            if (validator != null)
                validator.Enabled = componentData.FunctionData == FunctionData.Sum;
            if (propertyNameList != null && functionLabel != null && functionList != null)
            {
                functionList.Value = Enum.GetName(typeof(FunctionData), componentData.FunctionData);
                propertyNameList.Visible = functionLabel.Visible = true;
                if (componentData.FunctionData.Equals(FunctionData.Sum))
                {
                    var dataSource = componentData.DataSource as DataSourceQueryData;
                    if (dataSource != null)
                    {
                        FillScoreComponentDropDownFunctionPropertyName(propertyNameList, dataSource);
                    }
                    // The FunctionPropertyName drop-down selected item (Column to sum)
                    var newValue = propertyNameList.Items.FindByText(componentData.FunctionPropertyName) != null
                        ? componentData.FunctionPropertyName : "";
                    if (propertyNameList.Items.Count > 0)
                        propertyNameList.SelectedValue = newValue;
                }
                else
                {
                    componentData.FunctionPropertyName = string.Empty;
                    propertyNameList.Visible = functionLabel.Visible = false;
                }
            }

        }

        [ExcludeFromCodeCoverage]
        protected void ValidateFunction(object subject, ServerValidateEventArgs e)
        {
            if (e == null || e.Value != "Sum")
                return;
            var validator = subject as CustomValidator;
            if (validator != null)
            {
                var dropDown = validator.FindControl("ScoreComponentDropDownFunctionPropertyName") as DropDownList;
                if (dropDown != null && dropDown.Items.Count == 1 && string.IsNullOrEmpty(dropDown.Items[0].Value))
                {
                    validator.ErrorMessage = ResourceManager.GetPhrase("QueryHasNoItemsToSum", "The selected query has no numeric properties to sum.");
                    e.IsValid = false;
                }

            }
        }

        [ExcludeFromCodeCoverage]
        protected void ValidateName(object subject, ServerValidateEventArgs e)
        {
            if (e == null)
                return;
            var validator = subject as CustomValidator;
            if (validator != null)
            {
                var candidateName = e.Value.Trim().ToUpperInvariant();
                if (!EngagementScoreFormulaListHelper.ValidateComponentName(EngagementScoreFormula, candidateName, CurrentComponentId))
                {
                    validator.ErrorMessage = GetTranslatedPhrase(ResourceManager.GetPhrase("NameInUse", "There is already a component with this name."));
                    e.IsValid = false;

                }
            }
        }

        private bool? isLicensed = null;

        public bool IsLicensed {
            get
            {
                if (!isLicensed.HasValue)
                    isLicensed = HasLicenseKey(EntityManager, "SCORING"); 
                return isLicensed.Value;
            }
        }

        /// <summary>
        /// Is the component grid currently editing a component?
        /// </summary>
        public bool ComponentGridInEditMode
        {
            get { return RadGrid1.MasterTableView.IsItemInserted || IsEditingComponent; }
        }

        #endregion
        #region Radgrid methods for Category grid

        [ExcludeFromCodeCoverage]
        private void RadGrid2ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.EditCommandName || e.CommandName == RadGrid.InitInsertCommandName)
            {
                var saveText = GetTranslatedPhrase(ResourceManager.GetPhrase("SaveButton", "Save"));
                RadGrid2.MasterTableView.EditFormSettings.EditColumn.InsertText = saveText;
                RadGrid2.MasterTableView.EditFormSettings.EditColumn.UpdateText = saveText;
                RadGrid2.MasterTableView.EditFormSettings.EditColumn.CancelText = GetTranslatedPhrase(ResourceManager.GetPhrase("CancelButton", "Cancel"));
                if (e.Item.ItemIndex >= 0)
                    EditedCategory = EngagementScoreFormula.Categories[e.Item.ItemIndex];
            }
            else if (e.CommandName == RadGrid.CancelCommandName && EditedCategory != null)
            {
                EngagementScoreFormulaListHelper.RemoveUninitializedCriteriaFromCategoryOnCancel(EditedCategory);
            }
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2CancelCommand(object sender, GridCommandEventArgs e)
        {
            var foundIndex = EngagementScoreFormulaListHelper.FindMatchingCategory(EditedCategory == null
                ? string.Empty : EditedCategory.EngagementCategoryId, EngagementScoreFormula.Categories);
            if (foundIndex >= 0)
            {
                if (EditedCategory != null)
                {
                    // we canceled an existing one, so we want to restore it to the previous state
                    EngagementScoreFormula.Categories[foundIndex] = SavedCategoryInCaseOfCancel ?? EditedCategory;
                    SavedCategoryInCaseOfCancel = null;
                }
                else
                {
                    // we canceled a newly-entered one, so we want to remove it from the list
                    EngagementScoreFormula.Categories.RemoveAt(foundIndex);
                }
            }
            EditedCategory = null;
            CriteriaDefinedBeforeInitialSave = new CategoryCriteriaDataCollection();
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2UpdateCommand(object sender, GridCommandEventArgs e)
        {

            if (e == null) return;
            var item = e.Item as GridEditableItem;
            if (item != null)
            {
                var categoryKeyString = (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngagementCategoryId"];
                var categoryKey = Utilities.IsGuid(categoryKeyString) ? new Guid(categoryKeyString) : Guid.Empty;

                if (categoryKey != Guid.Empty && EngagementScoreFormula.Categories.Count > 0)
                {
                    var category = EngagementScoreFormula.Categories.SingleOrDefault(x => x.EngagementCategoryId.Equals(categoryKeyString));

                    if (category != null)
                    {
                        UpdateCategoryFromControls(item, category);
                        labelError.Visible = false;
                        labelError.Text = string.Empty;

                        var updateEngagementScoreResults = EntityManager.Update(EngagementScoreFormula);
                        if (!updateEngagementScoreResults.IsValid)
                        {
                            labelError.Visible = true;
                            labelError.Text = ResourceManager.GetPhrase("EngagementScoreUpdateError", "There was an error updating your EngagementScore and Category.");
                            e.Canceled = true;
                            return;
                        }
                        EngagementScoreFormula = updateEngagementScoreResults.Entity;
                    }
                }
            }
            EditedCategory = null;
            CriteriaDefinedBeforeInitialSave = new CategoryCriteriaDataCollection();
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2InsertCommand(object sender, GridCommandEventArgs e)
        {
            if (e == null) return;

            var item = (GridEditFormInsertItem)(RadGrid2.MasterTableView.GetInsertItem());
            if (item != null)
            {
                var category = EngagementScoreFormulaListHelper.GetOrCreateEngagementCategory(EngagementScoreFormula.Categories, insertedCategoryId);
                UpdateCategoryFromControls(item, category);

                var updateResult = EntityManager.Update(EngagementScoreFormula);
                if (!updateResult.IsValid)
                {
                    CategoryLabelError.Visible = true;
                    CategoryLabelError.Text = ResourceManager.GetPhrase("EngagementCategoryAddError", "There was an error adding your category.");
                    e.Canceled = true;
                    return;
                }
                EngagementScoreFormula = updateResult.Entity;
                // remember the id of the component we just entered.
                insertedCategoryId = (from cat in EngagementScoreFormula.Categories where cat.Name.Equals(category.Name) select cat.EngagementCategoryId).FirstOrDefault();
                //force the grid to update
                RadGrid2.DataSource = null;
            }
            CriteriaDefinedBeforeInitialSave = new CategoryCriteriaDataCollection();
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2DeleteCommand(object sender, GridCommandEventArgs e)
        {
            // RRK TODO - maybe remove this?
            if (e == null) return;

            var categoryKeyString = (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngagementCategoryId"];
            var categoryKey = Utilities.IsGuid(categoryKeyString) ? new Guid(categoryKeyString) : Guid.Empty;

            if (categoryKey != Guid.Empty)
            {
                var category = EngagementScoreFormula.Categories.SingleOrDefault(x => !string.IsNullOrEmpty(x.EngagementCategoryId) && x.EngagementCategoryId.Equals(categoryKeyString));
                if (category != null)
                {
                    //clear errors
                    labelError.Visible = false;
                    labelError.Text = string.Empty;

                    EngagementScoreFormulaListHelper.RemoveCategoryAndAdjustPriorities(category, EngagementScoreFormula);

                    ValidateResultsData<EngagementScoreData> res = null;
                    var errorMessage = ResourceManager.GetPhrase("CategoryDeleteError", "There was an error deleting your category.");
                    try
                    {
                        res = EntityManager.Update(EngagementScoreFormula);
                    }
                    catch (FaultException)
                    {
                        errorMessage = ResourceManager.GetPhrase("CategoryDeleteErrorException", "The category is in use and cannot be deleted.");
                    }
                    if (res == null || !res.IsValid)
                    {
                        clientsideAlerts.Text = errorMessage;
                        EngagementScoreFormulaListHelper.AddCategoryAndAdjustPriorities(category, EngagementScoreFormula);
                        return;
                    }
                    EngagementScoreFormula = res.Entity;
                }
            }
            CriteriaDefinedBeforeInitialSave = new CategoryCriteriaDataCollection();
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var noRecords = e.Item as GridNoRecordsItem;
            if (noRecords != null)
            {
                var label = (BusinessLabel)noRecords.FindControl("NoCategoryRecordsLabel");
                if (label != null)
                    label.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayNone", "(None)"));
            }
            var header = e.Item as GridHeaderItem;
            if (header != null)
                SetupCategoryHeaders(header);

            // Set a standard default color
            var editableITem = e.Item as GridEditableItem;
            if (editableITem != null && editableITem.IsInEditMode)
            {
                var picker = (HtmlInputText)editableITem.FindControl("colorpicker");
                picker.Value = "#0096c7";
            }
            // set enabled flags in UI
            var formItem = e.Item as GridEditFormItem;
            if (formItem?.DataSetIndex < EngagementScoreFormula?.Categories?.Count && !formItem.IsInEditMode)
            {
                var category = EngagementScoreFormula.Categories[formItem.DataSetIndex];
                formItem["IsEnabledLabel"].Text = category.IsEnabled ? enableCheckboxIcon : string.Empty;
            }
        }

        [ExcludeFromCodeCoverage]
        private void RadGrid2ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var commandItem = e.Item as GridCommandItem;

            //Disable the command buttons until the EngagementScore is saved
            if (!HaveEngagementScore())
            {
                if (e.Item is GridCommandItem)
                {
                    var addButton = (LinkButton)commandItem.FindControl("AddCategoryButton");
                    addButton.Enabled =
                        addButton.Visible = false;

                    var addButtonImage = (Image)commandItem.FindControl("AddCategoryButtonImage");
                    addButtonImage.Enabled = false;

                }
            }
            // Fill in display with ScoreComponent data when not in edit mode
            if (e.Item is GridDataItem && !e.Item.IsInEditMode && HaveEngagementScore())
            {
                var gridDataItem = (GridDataItem)e.Item;
                var category = e.Item.DataItem as EngagementCategoryData;
                // If there is no component ID this is a new one - we want to show it in edit mode, but not in the grid
                if (category != null && string.IsNullOrEmpty(category.EngagementCategoryId))
                    e.Item.Display = false;
                else if (category != null)
                {
                    // Fill in the values when in Display mode
                    var categoryName = e.Item.FindControl("CategoryNameDisplay") as BusinessLabel;
                    if (categoryName != null)
                        categoryName.Text = category.Name;

                    gridDataItem["IsEnabledLabel"].Text = category.IsEnabled ? enableCheckboxIcon : string.Empty;
                    DisplayCriteriaInGrid((GridDataItem)e.Item);
                }
                BindSpecialColumns(e.Item);
            }

            // Fill in display if we are in edit mode (so we can edit one category while still seeing all the other categories)
            else if ((e.Item is GridEditableItem) && e.Item.IsInEditMode)
            {
                SetupCategoryEditPanel(e);
            }

        }

        [ExcludeFromCodeCoverage]
        private void SetupCategoryHeaders(GridHeaderItem header)
        {
            header["EngagementCategoryIdColumn"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayEngagementCategoryName", "Category Name"));
            header["CriteriaLabel"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayCriteria", "Criteria"));
            header["IsEnabledLabel"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayIsEnabled", "Enabled"));
        }

        [ExcludeFromCodeCoverage]
        private static void UpdateCategoryFromControls(Control item, EngagementCategoryData category)
        {
            if (category != null)
            {
                var categoryNameControl = (BusinessTextBox)item.FindControl("CategoryTextBoxName");
                var categoryColorControl = (HtmlInputText)item.FindControl("colorpicker");
                var categoryEnabledControl = (BusinessCheckBox)item.FindControl("CategoryEnabledCheckbox");
                if (categoryNameControl != null)
                    category.Name = categoryNameControl.Text;
                if (categoryColorControl != null)
                {
                    category.Color = categoryColorControl.Value;
                }
                if (categoryEnabledControl != null)
                    category.IsEnabled = categoryEnabledControl.Checked;


                var criteriaGrid = item.FindControl("CriteriaGrid") as RadGrid;
                if (criteriaGrid != null)
                {
                    category.Criteria = new CategoryCriteriaDataCollection();
                    foreach (GridDataItem row in criteriaGrid.Items)
                    {
                        var criterion = EngagementScoreFormulaListHelper.BuildCriterionFromGridDataItem(row);
                        category.Criteria.Add(criterion);
                    }
                }
            }

        }
       
        [ExcludeFromCodeCoverage]
        protected void Grid2_OnMoveCommand(object sender, CommandEventArgs e)
        {
            if (e == null) return;
            var command = e.CommandName.ToUpperInvariant();
            var propertyId = e.CommandArgument as string;

           var needSave = false;
            switch (command)
            {
                case "MOVEUP":
                    if (RadGrid2.MasterTableView.Items.Count < 2)
                        return;
                    needSave = EngagementScoreFormulaListHelper.MoveGridTasks(propertyId, true, EngagementScoreFormula.Categories);
                    break;

                case "MOVEDOWN":
                    needSave = EngagementScoreFormulaListHelper.MoveGridTasks(propertyId, false, EngagementScoreFormula.Categories);
                    break;
            }
            if (needSave)
            {
                var updateEngagementScoreResults = EntityManager.Update(EngagementScoreFormula);
                if (!updateEngagementScoreResults.IsValid)
                {
                    labelError.Visible = true;
                    labelError.Text = ResourceManager.GetPhrase("EngagementScoreUpdateError", "There was an error updating your category order.");
                    return;
                }
                EngagementScoreFormula = updateEngagementScoreResults.Entity;
            }
            RadGrid2.Rebind();
        }

        [ExcludeFromCodeCoverage]
        private static void BindSpecialColumns(GridItem gridDataItem)
        {
            var moveUpButton = (ImageButton)gridDataItem.FindControl(("MoveUpButton"));
            if (moveUpButton != null)
            {
                moveUpButton.CommandArgument = ((EngagementCategoryData) gridDataItem.DataItem).EngagementCategoryId;
            }
            var moveDownButton = (ImageButton)gridDataItem.FindControl(("moveDownButton"));
            if (moveDownButton != null)
            {
                moveDownButton.CommandArgument = ((EngagementCategoryData)gridDataItem.DataItem).EngagementCategoryId;
            }

        }

        [ExcludeFromCodeCoverage]
        private void DisplayCriteriaInGrid(GridDataItem item)
        {
            var category = item.DataItem as EngagementCategoryData;
            var criteriaLabel = item.FindControl("CategoryCriteria") as BusinessLabel;
            if (criteriaLabel != null)
            {
                criteriaLabel.Text = EngagementScoreFormulaListHelper.GetCriteriaDisplay(category, EngagementScoreFormula);
            }
        }
        
        [ExcludeFromCodeCoverage]
        private void RadGrid2NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (EngagementScoreFormula == null || EngagementScoreFormula.Categories == null)
            {
                RadGrid2.DataSource = string.Empty;
                return;
            }

            var list = EngagementScoreFormula.Categories.ToList().OrderBy(x => x.Priority);
            RadGrid2.DataSource = list;
        }

        /// <summary>
        /// Display one category grid row (One line within the Engagement score formula) in edit mode
        /// </summary>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        private void SetupCategoryEditPanel(GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                var editedItem = e.Item as GridEditFormItem;
                if (editedItem != null && EditedCategory != null)
                {
                    var nameTextBox = editedItem.FindControl("CategoryTextBoxName") as BusinessTextBox;
                    if (nameTextBox != null)
                        nameTextBox.Text = EditedCategory.Name;
                    var colorpicker = (HtmlInputText)editedItem.FindControl("colorpicker");
                    if (colorpicker != null)
                    {
                        colorpicker.Value = EditedCategory.Color;
                    }
                    var enabledCheckbox = editedItem.FindControl("CategoryEnabledCheckbox") as BusinessCheckBox;
                    if (enabledCheckbox != null)
                        enabledCheckbox.Checked = EditedCategory.IsEnabled;
                }

                var saveButton = e.Item.FindControl("UpdateButton") as Button ??
                                 e.Item.FindControl("PerformInsertButton") as Button;
                if (saveButton != null)
                    saveButton.CssClass = "TextButton PrimaryButton";

                var cancelButton = e.Item.FindControl("CancelButton") as Button;
                if (cancelButton != null)
                    cancelButton.CssClass = "TextButton";
            }
        }

        [ExcludeFromCodeCoverage]
        private void PopulateCategoryEditPanel(Control editedItem, CategoryCriteriaData criterion)
        {
            if (editedItem != null)
            {
                var comparisonDropdown = editedItem.FindControl("CriteriaComparisonList") as DropDownList;
                if (comparisonDropdown != null)
                {
                    EngagementScoreFormulaListHelper.FillCriteriaComparisonDropDown(comparisonDropdown, criterion.Comparison);
                    foreach (ListItem item in comparisonDropdown.Items)
                    {
                        item.Text = GetTranslatedPhrase(item.Text);
                    }
                }

                var basisTypeDropdown = editedItem.FindControl("BasisTypeList") as DropDownList;
                if (basisTypeDropdown != null)
                {
                    EngagementScoreFormulaListHelper.FillCriteriaBasisTypeDropDown(basisTypeDropdown, criterion, EngagementScoreFormula);
                }
                var valueTextBox = editedItem.FindControl("CriterionValueTextBox") as BusinessTextBox;
                if (valueTextBox != null)
                    valueTextBox.Text = criterion.Value.ToString(CultureInfo.CurrentCulture);
            }
        }

        [ExcludeFromCodeCoverage]
        protected void ValidateCategoryName(object subject, ServerValidateEventArgs e)
        {
            if (e == null)
                return;
            var validator = subject as CustomValidator;
            if (validator != null)
            {
                var candidateName = e.Value.Trim().ToUpperInvariant();
                if (!EngagementScoreFormulaListHelper.ValidateCategoryName(EngagementScoreFormula, candidateName, EditedCategory == null ? null : EditedCategory.EngagementCategoryId))
                {
                    validator.ErrorMessage = GetTranslatedPhrase(ResourceManager.GetPhrase("NameInUse", "There is already a category with this name."));
                    e.IsValid = false;

                }
            }
        }

        [ExcludeFromCodeCoverage]
        protected void ValidateColorName(object subject, ServerValidateEventArgs e)
        {
            //if (e == null)
            //    return;
        }

        /// <summary>
        /// Is the category grid currently editing a category?
        /// </summary>
        public bool CategoryGridInEditMode
        {
            get { return RadGrid2.MasterTableView.IsItemInserted || IsEditingCategory; }
        }

        #endregion

        #region methods for Criteria grid
        [ExcludeFromCodeCoverage]
        protected void CriteriaGrid_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var grid = ((RadGrid) sender);
            PopulateExistingCriteriaIfNotYetSaved(grid);
            var datasource = EditedCategory != null ? EditedCategory.Criteria : CriteriaDefinedBeforeInitialSave;
            if (InsertingCriterion)
            {
                datasource.Insert(0, new CategoryCriteriaData());
                InsertingCriterion = false;
            }
            grid.DataSource = datasource;
        }

        [ExcludeFromCodeCoverage]
        private void PopulateExistingCriteriaIfNotYetSaved(RadGrid grid)
        {
            if (CriteriaDefinedBeforeInitialSave == null)
                CriteriaDefinedBeforeInitialSave = new CategoryCriteriaDataCollection();
            var itemNumber = 0;
            foreach (GridDataItem item in grid.Items)
            {
                var criteria = IsEditingCategory ? EditedCategory.Criteria : CriteriaDefinedBeforeInitialSave;
                if (criteria.Count > itemNumber && !EngagementScoreFormulaListHelper.CriterionIsInitialized(criteria[itemNumber]))
                {
                    var criterion = EngagementScoreFormulaListHelper.BuildCriterionFromGridDataItem(item);
                    criteria[itemNumber] = criterion;
                    itemNumber++;
                } 
            }
        }

        [ExcludeFromCodeCoverage]
        protected void CriteriaGrid_OnItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");

            // Fill in display with ScoreComponent data when not in edit mode
            var gridDataItem = e.Item as GridDataItem;
            if (gridDataItem != null && !e.Item.IsInEditMode)
            {
                
                var criterion = e.Item.DataItem as CategoryCriteriaData;
                if (criterion != null)
                {
                    PopulateCategoryEditPanel(gridDataItem, criterion);
                }
            }

            // Fill in display if we are in edit mode (so we can edit one category while still seeing all the other categories)
            else if ((e.Item is GridEditableItem) && e.Item.IsInEditMode)
            {
                var criterion = e.Item.DataItem as CategoryCriteriaData ?? new CategoryCriteriaData();
                PopulateCategoryEditPanel(e.Item, criterion);
            }

        }

        [ExcludeFromCodeCoverage]
        protected void CriteriaGrid_OnItemCreated(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var noRecords = e.Item as GridNoRecordsItem;
            if (noRecords != null)
            {
                var label = (BusinessLabel)noRecords.FindControl("NoCriteriaFoundLabel");
                if (label != null)
                    label.Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayNone", "(None)"));
            }
            var header = e.Item as GridHeaderItem;
            if (header != null)
                SetupCriteriaHeaders(header);

            if (e.Item is GridEditFormInsertItem && e.Item.IsInEditMode)
            {
                e.Item.Style["display"] = "none";
            }
        }
        
        [ExcludeFromCodeCoverage]
        private void SetupCriteriaHeaders(GridHeaderItem header)
        {
            header["BasisTypeColumnName"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayBasis", "Basis"));
            header["ComparisonColumnName"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayComparison", "Comparison"));
            header["ValueColumnName"].Text = GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayValue", "Value"));
        }

        [ExcludeFromCodeCoverage]
        protected void CriteriaGrid_OnItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e == null)
                throw new ArgumentNullException(nameof(e));
            if (e.CommandName == RadGrid.EditCommandName || e.CommandName == RadGrid.InitInsertCommandName)
            {
                InsertingCriterion = true;
            }
            else if (e.CommandName == RadGrid.DeleteCommandName)
            {
                if (EditedCategory != null && EditedCategory.Criteria.Count > e.Item.ItemIndex)
                {
                    if (SavedCategoryInCaseOfCancel == null)
                        SavedCategoryInCaseOfCancel = (EngagementCategoryData) EditedCategory.Clone();
                    EditedCategory.Criteria.RemoveAt(e.Item.ItemIndex);
                }
                else if (CriteriaDefinedBeforeInitialSave.Count > e.Item.ItemIndex)
                    CriteriaDefinedBeforeInitialSave.RemoveAt(e.Item.ItemIndex);
            }
        }

        [ExcludeFromCodeCoverage]
        protected void ValidateBasis(object subject, ServerValidateEventArgs e)
        {
            if (e == null)
                return;
            if (EngagementScoreFormulaListHelper.IsValidBasis(e.Value, EngagementScoreFormula))
                return;
            var validator = subject as CustomValidator;
            if (validator != null)
            {
                    validator.ErrorMessage = GetTranslatedPhrase(ResourceManager.GetPhrase("BasisIsRequired", "Required"));
                    e.IsValid = false;
            }
        }


        [ExcludeFromCodeCoverage]
        protected void ValidateCriteriaComparison(object subject, ServerValidateEventArgs e)
        {
            if (e == null)
                return;
            if (EngagementScoreFormulaListHelper.IsValidCriteriaComparison(e.Value))
                return;
            var validator = subject as CustomValidator;
            if (validator != null)
            {
                validator.ErrorMessage = GetTranslatedPhrase(ResourceManager.GetPhrase("CriteriaComparisonIsRequired", "Required"));
                e.IsValid = false;
            }
        }
        #endregion
        
    }
}
