using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Business.Common;
using Asi.QueryBuilder;
using Asi.Soa.ClientServices;
using Asi.Soa.Communications.DataContracts;
using Asi.Soa.Core.DataContracts;
using Asi.Soa.Core.ServiceContracts;
using Asi.Utilities;
using Asi.Web.UI.WebControls;

namespace Asi.Web.iParts.Communications.EngagementScoreFormulaList
{
    /// <summary>
    /// Static class of helper methods for EngagementScoreFormulaList iPart.
    /// </summary>
    public static class EngagementScoreFormulaListHelper
    {
        /// <summary>
        /// List of all EngagementScores
        /// </summary>
        /// <param name="entityManager">Entity manager to use</param>
        [ExcludeFromCodeCoverage]
        public static FindResultsData FindEngagementScores(EntityManager entityManager)
        {
            if (entityManager == null) throw new ArgumentNullException("entityManager");
            return entityManager.Find(new QueryData("EngagementScore"));
        }

        /// <summary>
        /// Find an engagement score formula from the id
        /// </summary>
        /// <param name="entityManager"></param>
        /// <param name="engagementScoreId"></param>
        /// <returns></returns>
        public static EngagementScoreData FindEngagementScore(EntityManager entityManager, string engagementScoreId)
        {
            if (entityManager == null)
                throw new ArgumentNullException("entityManager");

            EngagementScoreData retval = null;
            if (!string.IsNullOrEmpty(engagementScoreId))
            {
                var query = new QueryData("EngagementScore");
                query.AddCriteria(CriteriaData.Equal("EngagementScoreId", engagementScoreId));

                var results = entityManager.Find(query);
                if (results != null && results.Result.Count > 0)
                {
                    retval = ((EngagementScoreData)results.Result[0]);
                }
            }
            return retval;
        }

        /// <summary>
        /// Delete the selected engagement score
        /// </summary>
        /// <param name="engagementScoreId">Id of engagement score to delete</param>
        /// <param name="entityManager">Entity manager to use</param>
        /// <returns>True or False</returns>
        [ExcludeFromCodeCoverage]
        public static string DeleteEngagementScore(Guid engagementScoreId, EntityManager entityManager)
        {
            if (entityManager == null)
                throw new ArgumentNullException("entityManager");
            if (engagementScoreId == Guid.Empty)
                throw new ArgumentException("Empty Guid not valid", "engagementScoreId");

            var formula = FindEngagementScore(entityManager, engagementScoreId.ToString());
            if (formula == null) return "Engagement score not found";

            if (formula.IsInUse)
            {
                var request = GetPurgeAndRecalculateRequest(formula, false);
                entityManager.Execute(request);
            }
            else
            {
                try
                {
                    entityManager.Delete(formula);
                }
                catch (FaultException e)
                {
                    return e.Message;
                }

            }
            return string.Empty;
        }

        /// <summary>
        /// Add a new or update an existing formula
        /// </summary>
        /// <param name="entityManager">Entity manager to use</param>
        /// <param name="formula">Formula to add or update.</param>
        /// <returns></returns>
        public static ValidateResultsData AddOrUpdateFormula(EntityManager entityManager, EngagementScoreData formula)
        {
            if (entityManager == null)
                throw new ArgumentNullException("entityManager");
            if (formula == null)
                throw new ArgumentNullException("formula");
            bool isNew = string.IsNullOrEmpty(formula.EngagementScoreId);

            var results = isNew
                ? entityManager.Add(formula)
                : entityManager.Update(formula);
            return results;
        }

        /// <summary>
        /// Send a request to purge and recalculate scores
        /// </summary>
        /// <param name="entityManager">Entity manager to use</param>
        /// <param name="formula">Formula to add or update.</param>
        public static void SendRecalculateRequest(EntityManager entityManager, EngagementScoreData formula)
        {
            if (entityManager == null)
                throw new ArgumentNullException("entityManager");
            var request = GetPurgeAndRecalculateRequest(formula, true);
            entityManager.Execute(request);
        }

        /// <summary>
        /// Set the IsSampled property based on the component's query.
        /// </summary>
        /// <param name="component">The current ScoreComponentData object.</param>
        /// <returns></returns>
        public static void SetIsSampled(ScoreComponentData component)
        {
            if (component == null)
                throw new ArgumentNullException("component");
            var query = GetIqaQueryFromDataSource(component.DataSource as DataSourceQueryData);
            if (query != null)
            {
                var updatedOnColumn = FindUpdatedOnColumn(query);
                component.IsSampled = updatedOnColumn == null;
            }
        }
        /// <summary>
        /// Given the path to a query, establish that query as the data source for the score component
        /// </summary>
        /// <param name="scoreComponent">The scoreComponent we are using.</param>
        /// <param name="queryPath">Path to the query.</param>
        public static void ConnectScoreComponentIqaDataSource(ScoreComponentData scoreComponent, string queryPath)
        {
            if (scoreComponent == null)
                throw new ArgumentNullException("scoreComponent");
            if (!string.IsNullOrEmpty(queryPath))
            {

                scoreComponent.DataSource = new DataSourceQueryData
                {
                    DataSourceId = "primary",
                    Query = new QueryData("IQA")
                    {
                        Criteria = new CriteriaDataCollection
                        {
                            CriteriaData.Equal("QueryName", queryPath)
                        }
                    }
                };
            }
        }

        /// <summary>
        /// Tests whether a data source is an IQA query
        /// </summary>
        /// <param name="dataSource">The data source</param>
        /// <returns></returns>
        public static bool IsIqaDataSource(DataSourceData dataSource)
        {
            var querySource = dataSource as DataSourceQueryData;
            if (querySource == null) return false;

            return querySource.Query != null
                   && string.Equals(querySource.Query.EntityTypeName, "IQA", StringComparison.Ordinal)
                   && !querySource.Query.Criteria.IsNullOrEmpty()
                   && string.Equals(querySource.Query.Criteria[0].PropertyName, "QueryName", StringComparison.Ordinal)
                   && !querySource.Query.Criteria[0].Values.IsNullOrEmpty()
                   && querySource.Query.Criteria[0].Values.Count == 1;
        }

        /// <summary>
        /// Get the IQA Query that is associated with a DataSourceQueryData object
        /// </summary>
        /// <param name="dataSource">The data source</param>
        /// <returns>The <see cref="Query"/>, or null if the query does not exist or this is not an IQA datasource</returns>
        public static Query GetIqaQueryFromDataSource(DataSourceQueryData dataSource)
        {

            if (dataSource == null) return null;
            if (!IsIqaDataSource(dataSource)) return null;

            var querySource = dataSource;

            var d = DocumentController.Document(querySource.Query.Criteria[0].Values[0], AppContext.CurrentContext.StatefulBusinessContainer);
            return d != null ? Query.NewQuery(d) : null;
        }

        /// <summary>
        /// Save a copy of the given EngagementScoreData formula.
        /// </summary>
        /// <remarks>The copy is not exact - the name and ID will be changed so that they are unique.</remarks>
        /// <param name="formula">Original formula</param>
        /// <param name="entityManager">Entity manager to use</param>
        /// <returns>ValidateResultsData object.</returns>
        public static ValidateResultsData SaveAs(EngagementScoreData formula, IEntityService entityManager)
        {
            if (formula == null)
                throw new ArgumentNullException("formula");
            if (entityManager == null)
                throw new ArgumentNullException("entityManager");
            var retval = new ValidateResultsData();
            var newFormula = CreateNewFormulaFromOriginal(formula);
            if (newFormula != null)
            {
                var results = entityManager.Add(newFormula);
                retval = results;
            }
            else
            {
                retval.ValidationResults.AddError(new ValidationResultData("Unable to clone engagement score formula"));
            }
            return retval;
        }

        /// <summary>
        /// Create a clone of the given engagement score formula
        /// </summary>
        /// <remarks>The copy is not exact - the name and ID will be changed so that they are unique.</remarks>
        /// <param name="formula">Original formula</param>
        /// <returns>Copy of formula with a new name.</returns>
        public static EngagementScoreData CreateNewFormulaFromOriginal(EngagementScoreData formula)
        {
            if (formula == null)
                throw new ArgumentNullException("formula");
            var componentIdList = GetComponentIdsInFormula(formula);
            var newFormula = formula.Clone() as EngagementScoreData;
            FixUpComponentReferencesInCriteria(newFormula, componentIdList);
            if (newFormula != null)
            {
                var copyName = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetWord("Copy"));
                newFormula.Name = string.Format(CultureInfo.CurrentCulture, "{0} - {1}", formula.Name, copyName);
                newFormula.EngagementScoreId = Guid.NewGuid().ToString();
                newFormula.IsInUse = false;
                newFormula.SystemTypeCode = 10;
                if (newFormula.ScoreComponents != null)
                {
                    foreach (var dataSource in
                            newFormula.ScoreComponents.Select(scoreComponent => scoreComponent.DataSource)
                                .OfType<DataSourceQueryData>())
                    {
                        dataSource.DataSourceId = Guid.NewGuid().ToString();
                    }
                }
            }
            return newFormula;
        }

        private static IEnumerable<string> GetComponentIdsInFormula(EngagementScoreData formula)
        {
            var list = new List<string>();
            if (formula.ScoreComponents != null)
            {
                foreach (var component in formula.ScoreComponents)
                {
                    list.Add(component.ScoreComponentId);
                } 
            }
            return list;
        }

        private static void FixUpComponentReferencesInCriteria(EngagementScoreData formula, IEnumerable<string> oldIds)
        {
            if (formula.ScoreComponents != null)
            {
                foreach (var component in formula.ScoreComponents)
                {
                    component.ScoreComponentId = Guid.NewGuid().ToString();
                }
                var oldIdList = oldIds.ToList();
                if (formula.Categories != null)
                {
                    foreach (var category in formula.Categories)
                    {
                        category.EngagementCategoryId = Guid.NewGuid().ToString();
                        if (category.Criteria != null)
                        {
                            foreach (var criterion in category.Criteria)
                            {
                                if (criterion.BasisType == BasisType.Component)
                                {
                                    var index = FindComponentIndex(criterion, oldIdList);
                                    if (index >= 0)
                                        criterion.ScoreComponentId = formula.ScoreComponents[index].ScoreComponentId;
                                }
                            }
                        }
                    }
                }
            }
        }

        private static int FindComponentIndex(CategoryCriteriaData criterion, IEnumerable<string> oldComponentIds )
        {
            var index = -1;
            var i = 0;
            foreach (var oldComponentId in oldComponentIds)
            {
                if (criterion.ScoreComponentId == oldComponentId)
                {
                    index = i;
                    break;
                }
                i++;
            }
            return index;
        }

        /// <summary>
        /// Create an return a url that is identical to the supplied url except that its EngagementScoreId points to the 
        /// id of the supplied formula.
        /// </summary>
        /// <param name="formula">New EngagementScoreData formula.</param>
        /// <param name="url">URL to be changed.</param>
        /// <param name="oldId">Id of existing EngagementScoreData</param>
        /// <returns></returns>
        public static string BuildNewUrl(EngagementScoreData formula, string url, string oldId)
        {
            if (url == null)
                throw new ArgumentNullException("url");
            if (formula != null)
            {
                if (url.Contains("EngagementScoreId"))
                {
                    var newUrl = url.Replace(string.Format(CultureInfo.InvariantCulture, "EngagementScoreId={0}", oldId),
                        string.Format(CultureInfo.InvariantCulture, "EngagementScoreId={0}", formula.EngagementScoreId));
                    url = newUrl;
                }
                else
                {
                    if (!url.Contains("EngagementScoreId"))
                        url = string.Format(CultureInfo.InvariantCulture, "{0}&EngagementScoreId={1}", url, formula.EngagementScoreId);
                }
            }
            return url;
        }

        /// <summary>
        /// Gets a list of properties that a query datasource exposes
        /// </summary>
        /// <param name="entityManager">The entity manager</param>
        /// <param name="dataSourceQueryData">The datasource</param>
        /// <returns>Dictionary of properties and their types, or null if the query cannot be evaluated</returns>
        
        public static Dictionary<string, Type> GetPropertyListFromQueryDataSource(EntityManager entityManager, DataSourceQueryData dataSourceQueryData)
        {
            if (entityManager == null || dataSourceQueryData == null || dataSourceQueryData.Query == null || string.IsNullOrEmpty(dataSourceQueryData.Query.EntityTypeName)) return null;

            var propertyNames = new Dictionary<string, Type>();

            // is it an iqa query
            if (IsIqaDataSource(dataSourceQueryData))
            {
                var query = GetIqaQueryFromDataSource(dataSourceQueryData);
                if (query != null)
                {
                    // we can embed all the columns
                    for (var i = 0; i < query.Columns.Count; i++)
                    {
                        propertyNames.Add(query.Columns[i].ProjectAs.Replace("'", String.Empty), query.Columns[i].DataType);
                    }
                }
            }

            return propertyNames.Count > 0 ? propertyNames : null;

        }

        /// <summary>
        /// Returns an indication of whether the supplied type is numeric.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsNumericType(Type type)
        {
            return type == typeof (sbyte)
                || type == typeof(byte)
                || type == typeof(short)
                || type == typeof(ushort)
                || type == typeof(int)
                || type == typeof(uint)
                || type == typeof(long)
                || type == typeof(ulong)
                || type == typeof(float)
                || type == typeof(double)
                || type == typeof(decimal);
        }


        /// <summary>
        /// Gets the query path and name from an iqa datasource
        /// </summary>
        /// <param name="dataSource">The data source</param>
        /// <returns>The query path and name, or null</returns>
        public static string GetQueryNameFromIqaDataSource(DataSourceData dataSource)
        {

            if (dataSource == null || !IsIqaDataSource(dataSource)) return null;

            var querySource = (DataSourceQueryData)dataSource;
            var criteria = querySource.Query.Criteria.FirstOrDefault(x => x.PropertyName == "QueryName");
            if (criteria != null && !criteria.Values.IsNullOrEmpty())
                return criteria.Values[0];
            return null;
        }

        /// <summary>
        /// Given a query name and a datasource, configures the datasource to use that query.
        /// </summary>
        /// <param name="dataSource">The data source</param>
        /// <param name="queryName">The query name</param>
        public static void SetQueryNameInIqaDataSource(DataSourceData dataSource, string queryName)
        {
            if (dataSource != null && IsIqaDataSource(dataSource))
            {
                var querySource = (DataSourceQueryData) dataSource;
                if (querySource.Query != null && querySource.Query.Criteria != null)
                {
                    var criteria = querySource.Query.Criteria.FirstOrDefault(x => x.PropertyName == "QueryName");
                    if (criteria != null && !criteria.Values.IsNullOrEmpty())
                        criteria.Values[0] = queryName;
                }
            }
        }

        internal static int FindMatchingComponent(string id, ScoreComponentDataCollection components)
        {
            var foundIndex = -1;
            var index = -1;
            foreach (var component in components)
            {
                index++;
                if ((component.ScoreComponentId ?? string.Empty) == id)
                {
                    foundIndex = index;
                    break;
                }
            }
            return foundIndex;
        }

        internal static int FindMatchingCategory(string id, EngagementCategoryDataCollection categories)
        {
            var foundIndex = -1;
            var index = -1;
            foreach (var category in categories)
            {
                index++;
                if ((category.EngagementCategoryId ?? string.Empty) == id)
                {
                    foundIndex = index;
                    break;
                }
            }
            return foundIndex;
        }

        /// <summary>
        /// Get the value to display for the calculation type
        /// </summary>
        /// <param name="component">Score component to use</param>
        /// <returns></returns>
        public static string GetCalculationDisplayValue(ScoreComponentData component)
        {
            if (component == null)
                throw new ArgumentNullException("component");
            var displayValue = Enum.GetName(typeof(FunctionData), component.FunctionData);
            if (component.FunctionData.Equals(FunctionData.Sum) && !string.IsNullOrEmpty(component.FunctionPropertyName))
                displayValue = string.Format(CultureInfo.CurrentCulture, "{0} - {1}", displayValue, component.FunctionPropertyName);
            return displayValue;
        }

        /// <summary>
        /// Fill the Function (where the kind of calculation is chosen) drop down list
        /// </summary>
        /// <param name="componentScoreFunctionDropDown">Dropdown list to use</param>
        [ExcludeFromCodeCoverage]
        public static void FillScoreComponentDropDownFunction(BusinessDropDownList componentScoreFunctionDropDown)
        {
            if (componentScoreFunctionDropDown == null)
                throw new ArgumentNullException("componentScoreFunctionDropDown");
            componentScoreFunctionDropDown.Items.Clear();

            foreach (FunctionData functionDataOneItem in Enum.GetValues(typeof(FunctionData)))
            {
                var item = new ListItem(Enum.GetName(typeof(FunctionData), functionDataOneItem), functionDataOneItem.ToString());
                if (item.Text != "None")
                    componentScoreFunctionDropDown.Items.Add(item);
            }

            componentScoreFunctionDropDown.DataBind();
        }

        /// <summary>
        /// Fill the comparison dropdown for criteria maintenance
        /// </summary>
        /// <param name="list">Dropdown list to use</param>
        /// <param name ="selected">Selected comparison</param>
        public static void FillCriteriaComparisonDropDown(DropDownList list, OperationData selected)
        {
            if (list == null)
                throw new ArgumentNullException("list");
            list.Items.Clear();
            list.Items.Add(new ListItem(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetWord("(Select)"))));

            foreach (OperationData operation in Enum.GetValues(typeof(OperationData)))
            {
                if (operation.Equals(OperationData.GreaterThan) || operation.Equals(OperationData.LessThan) || operation.Equals(OperationData.Equal))
                {
                    var item = new ListItem(DisplayNameForOperation(operation), operation.ToString());
                    item.Selected = selected == operation;
                    list.Items.Add(item);
                }
            }

            list.DataBind();
        }

        private static string DisplayNameForOperation(OperationData comparison)
        {
            string retval;
            switch (comparison)
            {
                case OperationData.GreaterThan:
                    retval = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetWord("Greater than"));
                    break;
                case OperationData.LessThan:
                    retval = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetWord("Less than"));
                    break;
                default:
                    retval = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, Enum.GetName(typeof (OperationData), comparison));
                    break;
            }
            return retval;
        }
        /// <summary>
        /// Fill the basis type dropdown for criteria maintenance
        /// </summary>
        /// <param name="list">>Dropdown list to use</param>
        /// <param name ="criterion">Criterion to use</param>
        /// <param name ="formula">Formula to use</param>
        public static void FillCriteriaBasisTypeDropDown(DropDownList list, CategoryCriteriaData criterion, EngagementScoreData formula)
        {
            if (list == null)
                throw new ArgumentNullException("list");
            if (criterion == null)
                throw new ArgumentNullException("criterion");
            if (formula == null)
                throw new ArgumentNullException("formula");

            list.Items.Clear();
            list.Items.Add(new ListItem(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,ResourceManager.GetWord("(Select)"))));

            foreach (BasisType basisType in Enum.GetValues(typeof(BasisType)))
            {
                if (!basisType.Equals(BasisType.Component))
                {
                    var item = new ListItem(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, Enum.GetName(typeof(BasisType), basisType)), basisType.ToString());
                    item.Selected = (criterion.BasisType == basisType) && CriterionIsInitialized(criterion);
                    list.Items.Add(item);
                }
            }
            foreach (var component in formula.ScoreComponents)
            {
                var item = new ListItem(component.DisplayName, component.ScoreComponentId);
                item.Selected = (component.ScoreComponentId == criterion.ScoreComponentId) && CriterionIsInitialized(criterion);
                list.Items.Add(item);
            }

            if (!CriterionIsInitialized(criterion))
                list.Items[0].Selected = true;

            list.DataBind();
        }

        /// <summary>
        /// Find the score component with the supplied id, or create a new one.
        /// </summary>
        /// <param name="components">Collection of components.</param>
        /// <param name="id">Desired component id</param>
        /// <returns></returns>
        public static ScoreComponentData GetOrCreateScoreComponent(ScoreComponentDataCollection components, string id)
        {
            if (components == null)
                throw new ArgumentNullException("components");
            if (id == null)
                throw new ArgumentNullException("id");

            ScoreComponentData retval = null;
            foreach (var component in components)
            {
                if ((component.ScoreComponentId ?? string.Empty).Trim().ToUpperInvariant().Equals(id.Trim().ToUpperInvariant()))
                {
                    retval = component;
                    break;
                }
            }
            if (retval == null)
            {
                retval = new ScoreComponentData();
                components.Add(retval);
            }
            return retval;
        }

        /// <summary>
        /// Get the category with the given id, or create a new one.
        /// </summary>
        /// <param name="categories">Collection of categories</param>
        /// <param name="id">Desired id</param>
        /// <returns></returns>
        public static EngagementCategoryData GetOrCreateEngagementCategory(EngagementCategoryDataCollection categories, string id)
        {
            if (categories == null)
                throw new ArgumentNullException("categories");
            if (id == null)
                throw new ArgumentNullException("id");
            EngagementCategoryData retval = null;
            foreach (var category in categories)
            {
                if ((category.EngagementCategoryId ?? String.Empty).Trim().ToUpperInvariant().Equals(id.Trim().ToUpperInvariant()))
                {
                    retval = category;
                    break;
                }
            }
            if (retval == null)
            {
                retval = new EngagementCategoryData{Priority = categories.Count, IsEnabled = true};
                categories.Add(retval);
            }
            return retval;
        }

        /// <summary>
        /// Construct a criterion from the supplied control
        /// </summary>
        /// <param name="control">Control containing information from the user.</param>
        /// <returns>CategoryCriteriaData object</returns>
        public static CategoryCriteriaData BuildCriterionFromGridDataItem(Control control)
        {
            if (control == null)
                throw new ArgumentNullException("control");

            var valueString = ((BusinessTextBox)control.FindControl("CriterionValueTextBox")).Text;
            var value = decimal.Parse(valueString, CultureInfo.CurrentCulture);

            var basisString = ((DropDownList)control.FindControl("BasisTypeList")).SelectedValue;
            BasisType basis;
            string componentId = string.Empty;
            if (!Enum.TryParse(basisString, true, out basis))
            {
                basis = BasisType.Component;
                componentId = basisString;
            }
            var comparisonString = ((DropDownList)control.FindControl("CriteriaComparisonList")).SelectedValue;
            var comparison = (OperationData)Enum.Parse(typeof(OperationData), comparisonString, true);
            var retval = new CategoryCriteriaData { Comparison = comparison, Value = value, BasisType = basis, ScoreComponentId = componentId};

            return retval;
        }

        /// <summary>
        /// Returns an indication of whether this criterion has been initialized.
        /// </summary>
        /// <param name="criterion">Criterion to use</param>
        /// <returns>True if initialized; false otherwise</returns>
        public static bool CriterionIsInitialized(CategoryCriteriaData criterion)
        {
            if (criterion == null)
                throw new ArgumentNullException("criterion");
            return !criterion.Comparison.Equals(OperationData.None);
        }

        /// <summary>
        /// Returns an indication of whether the supplied value represents a valid basis.
        /// </summary>
        /// <param name="value">Value representing basis</param>
        /// <param name="formula">Formula to use</param>
        /// <returns></returns>
        public static bool IsValidBasis(string value, EngagementScoreData formula)
        {
            var retval = true;
            BasisType basis;
            if (!Enum.TryParse(value, true, out basis))
            {
                var component = GetComponentFromId(value, formula);
                if (component == null)
                    retval = false;
            }
            return retval;
        }

        internal static bool IsValidCriteriaComparison(string value)
        {
            var retval = true;
            OperationData comparison;
            if (!Enum.TryParse(value, true, out comparison))
                retval = false;
            else if (comparison != OperationData.GreaterThan && comparison != OperationData.LessThan && comparison != OperationData.Equal)
                retval = false;
            return retval;
        }

        /// <summary>
        /// Returns an indication of whether the component name is valid - i.e., not a duplicate
        /// </summary>
        /// <param name="formula">Formula to use</param>
        /// <param name="candidateName">Name being tested.</param>
        /// <param name="currentComponentId">Optional component id for the name</param>
        /// <returns>True if name valid.</returns>
        public static bool ValidateComponentName(EngagementScoreData formula, string candidateName, string currentComponentId)
        {
            if (formula == null)
                throw new ArgumentNullException("formula");

            candidateName = candidateName == null ? string.Empty : candidateName.Trim().ToUpperInvariant();
            currentComponentId = currentComponentId == null ? string.Empty : currentComponentId.Trim().ToUpperInvariant();

            var isThereANewComponent = formula.ScoreComponents.Any(component => string.IsNullOrEmpty(component.ScoreComponentId));
            var valid = isThereANewComponent 
                ? IsValidNameForNewComponent(formula, candidateName) 
                : IsValidNameForComponentUpdate(formula, candidateName, currentComponentId);
            return valid;
        }

        /// <summary>
        /// Returns an indication of whether the category name is valid - i.e., not a duplicate
        /// </summary>
        /// <param name="formula">Formula to use</param>
        /// <param name="candidateName">Name being tested.</param>
        /// <param name="currentCategoryId">Optional category id for the name</param>
        /// <returns></returns>
        public static bool ValidateCategoryName(EngagementScoreData formula, string candidateName, string currentCategoryId)
        {
            if (formula == null)
                throw new ArgumentNullException("formula");

            if (string.IsNullOrEmpty(candidateName))
                return false;

            candidateName =  candidateName.Trim().ToUpperInvariant();

            currentCategoryId = currentCategoryId == null ? string.Empty : currentCategoryId.Trim().ToUpperInvariant();
            var isThereANewCategory = string.IsNullOrEmpty(currentCategoryId); 
            var valid = isThereANewCategory
                ? IsValidNameForNewCategory(formula, candidateName)
                : IsValidNameForCategoryUpdate(formula, candidateName, currentCategoryId);
            return valid;
        }

        private static bool IsValidNameForNewCategory(EngagementScoreData formula, string candidateName)
        {
            var valid = true;
            if (formula.Categories != null)
            {
                foreach (var category in formula.Categories)
                {
                    if (candidateName.Equals(category.Name.Trim().ToUpperInvariant()))
                    {
                        valid = false;
                        break;
                    }
                }
            }
            return valid;
        }

        private static bool IsValidNameForCategoryUpdate(EngagementScoreData formula, string candidateName, string currentCategoryId)
        {
            var valid = true;
            // not new - if we find one with the same name that does not have the current id, we have a duplicate
            foreach (var category in formula.Categories)
            {
                var name = category.Name.Trim().ToUpperInvariant();
                var id = (category.EngagementCategoryId ?? string.Empty).Trim().ToUpperInvariant();
                if (name == candidateName && id != currentCategoryId)
                {
                    valid = false;
                    break;
                }
            }
            return valid;
        }
        private static bool IsValidNameForNewComponent(EngagementScoreData formula, string candidateName)
        {
            var valid = true;
            //  If we have a new one we need to see if it conflicts with another on the list.
            //  Also, we need to remember where the new one is on the list because we want to delete
            //  it if there is a conflict.  If we don't do that and we cancel out the display will show
            //  the conflict as an active score component, even though it is not really there.
            var namesInUse = new Dictionary<string, string>();
            var indexToRemove = -1;
            var index = -1;
            foreach (var component in formula.ScoreComponents)
            {
                index++;
                var name = component.DisplayName.Trim().ToUpperInvariant();
                var id = (component.ScoreComponentId ?? string.Empty).Trim().ToUpperInvariant();
                if (name == candidateName && string.IsNullOrEmpty(id))
                {
                    indexToRemove = index;
                }
                if (namesInUse.ContainsKey(name))
                {
                    if (namesInUse[name] != id)
                    {
                        valid = false;
                        break;
                    }
                }
                else
                    namesInUse.Add(name, id);
            }
            if (!valid && indexToRemove >= 0)
            {
                formula.ScoreComponents.RemoveAt(indexToRemove);
            }
            return valid;
        }

        private static bool IsValidNameForComponentUpdate(EngagementScoreData formula, string candidateName, string currentComponentId)
        {
            var valid = true;
            // not new - if we find one with the same name that does not have the current id, we have a duplicate
            foreach (var component in formula.ScoreComponents)
            {
                var name = component.DisplayName.Trim().ToUpperInvariant();
                var id = (component.ScoreComponentId ?? string.Empty).Trim().ToUpperInvariant();
                if (name == candidateName && id != currentComponentId)
                {
                    valid = false;
                    break;
                }
            }
            return valid;
        }

        private static ValidateResultsData ValidateQueryFromName(string query)
        {
            var validateResultsData = new ValidateResultsData();
            if (string.IsNullOrEmpty(query))
            {
                validateResultsData.ValidationResults.AddError(new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.QueryIsRequired",
                            "Query is required.")), null, "Query", string.Empty));
            }
            else
            {
                var documentKey = DocumentSystem.DocumentKeyByPath(query);
                if (documentKey.Equals(Guid.Empty))
                    validateResultsData.ValidationResults.AddError(new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.InvalidQuery",
                                "Query path is not valid.")), null, "Query", string.Empty));
                else
                {
                    Query iqa = null;
                    try
                    {
                        // if it is not a query we'll throw a SerializationException
                        iqa = Query.NewQuery(documentKey, AppContext.CurrentContext.StatefulBusinessContainer);
                    }
                    catch (SerializationException){}
                    
                    if (iqa == null)
                    {
                        validateResultsData.ValidationResults.AddError(new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.InvalidQuery1",
                                   "Document is not a query.")), null, "Query", string.Empty));
                    }
                    else
                    {
                        validateResultsData = ValidateQueryProjection(iqa, validateResultsData);
                    }
                }
            }
            return validateResultsData;
        }


        /// <summary>
        /// Validate the query projection
        /// </summary>
        /// <param name="query"></param>
        /// <param name="validateResultsData"></param>
        /// <returns></returns>
        public static ValidateResultsData ValidateQueryProjection(Query query, ValidateResultsData validateResultsData)
        {
            if (query == null)
                throw new ArgumentNullException("query");

            if (validateResultsData == null)
                validateResultsData = new ValidateResultsData();

            if (query.Distinct)
                validateResultsData.ValidationResults.AddError(
                    new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, 
                        ResourceManager.GetPhrase("Asi.web.iParts.Communications.CommunicationCreator.InvalidQuery1",
                            "Query is set to display only unique results.  This is not supported for engagement score component queries.")),
                        null, "Query", string.Empty));

            var contactKeyColumn = FindContactKeyColumn(query);
            if (contactKeyColumn == null)
                validateResultsData.ValidationResults.AddError(
                    new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,
                        ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.InvalidQuery2",
                            "Query must have a Guid column called \"ContactKey\".")), null, "Query", string.Empty));

            var updatedOnColumn = FindUpdatedOnColumn(query);

            if (updatedOnColumn == null)
                validateResultsData.ValidationResults.AddWarning(
                    new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,
                        ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.InvalidQuery3",
                            "This query does not have a date column called \"UpdatedOn\".  The data will be sampled.")), null, "Query", string.Empty));

            else if (updatedOnColumn.BusinessController == null)
                validateResultsData.ValidationResults.AddError(
                    new ValidationResultData(LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,
                        ResourceManager.GetPhrase("Asi.Web.iParts.Communications.CommunicationCreator.InvalidQuery4",
                            "\"UpdatedOn\" column cannot be an expression and must come from a business object.")), null,
                        "Query", string.Empty));

            return validateResultsData;
        }


        private static QueryColumn FindUpdatedOnColumn(Query query)
        {
            var updatedOnColumn =
                   query.Columns.Cast<QueryColumn>()
                       .FirstOrDefault(
                           column =>
                               column.ProjectAs.Trim().ToUpperInvariant().Equals("UPDATEDON") &&
                               column.DataType == typeof(DateTime));
            return updatedOnColumn;

        }

        private static QueryColumn FindContactKeyColumn(Query query)
        {
            var createdOnColumn =
                   query.Columns.Cast<QueryColumn>()
                       .FirstOrDefault(
                           column =>
                               column.ProjectAs.Trim().ToUpperInvariant().Equals("CONTACTKEY") &&
                               column.DataType == typeof(Guid));
            return createdOnColumn;

        }
        /// <summary>
        /// Validate a query whose path is supplied
        /// </summary>
        /// <param name="queryValidationMessage">Label to update with validation messages</param>
        /// <param name="queryInfoMessage"></param>
        /// <param name="text">Path of the query</param>
        /// <returns>True if valid; false otherwise</returns>
        public static bool ValidateQuery(Label queryValidationMessage, Label queryInfoMessage, string text)
        {
            if (queryValidationMessage == null)
                throw new ArgumentNullException("queryValidationMessage");
            if (queryInfoMessage == null)
                throw new ArgumentNullException("queryInfoMessage");
            queryInfoMessage.Visible = false;
            var retval = true;
            var validateData = ValidateQueryFromName(text);
            if (!validateData.IsValid)
            {
                queryValidationMessage.Text = (validateData.ValidationResults.Errors != null &&
                                               validateData.ValidationResults.Errors.Count(
                                                   v => v.FieldName == "Query") > 0)
                    ? validateData.ValidationResults.Errors.Where(v => v.FieldName == "Query")
                        .Select(v => v.Message)
                        .FirstOrDefault()
                    : string.Empty;
                retval = false;
            }
            else if (validateData.HasWarnings)
            {
                queryInfoMessage.Text = validateData.ValidationResults.Warnings[0].Message;
                queryInfoMessage.Visible = true;
            }
            queryValidationMessage.Visible = !retval;
            return retval;
        }


        /// <summary>
        /// Create a TaskAdhocRequest to purge and recalculate scores for the supplied formula.
        /// </summary>
        /// <param name="formula">EngagementScoreData object.</param>
        /// <param name="recalculate"></param>
        /// <returns></returns>
        public static TaskAdhocRequest GetPurgeAndRecalculateRequest(EngagementScoreData formula, bool recalculate)
        {
            if (formula == null)
                throw new ArgumentNullException("formula");
            var task = new TaskDefinitionData
            {
                Triggers = new TaskDefinitionTriggerDataCollection(),
                Actions = new TaskDefinitionActionDataCollection(),
                IsActive = true,
                TaskType = TaskTypeData.Immediate,
                DataSources = new DataSourceDataCollection()
            };

            if (formula.ScoreComponents != null)
            {
                foreach (var component in formula.ScoreComponents)
                {
                    component.LastRunOn = null;
                }
            }

            var action = new TaskDefinitionAdHocPurgeAndRecalculateEngagementScoresData
            {
                EngagementScore = formula
            };
            action.Recalculate = recalculate;
            task.Actions.Add(action);
            
            var request = new TaskAdhocRequest
            {
                Task = task
            };

            return request;
        }

        /// <summary>
        /// Return appropriate "are you sure" text for deleting score formulas.
        /// </summary>
        /// <param name="scoreData"></param>
        /// <returns></returns>
        public static string GetOnClickText(EngagementScoreData scoreData)
        {
            if (scoreData == null)
                throw new ArgumentNullException("scoreData");
            string message;
            if (!scoreData.IsInUse)
                message = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,
                    ResourceManager.GetPhrase("EngagementScoreDeletePrompt", "Delete this formula?"));
            else
                message = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture,
                    ResourceManager.GetPhrase("EngagementScoreDeletePromptInUse", "This formula is in use.  Deleting it will delete all historical engagement score data calculated using this formula.  Are you sure you want to delete it?"));

            return string.Format(CultureInfo.InvariantCulture, "if(!confirm('{0}'))return false;", message);
        }

        /// <summary>
        /// Return a string to display the criteria for the given category
        /// </summary>
        /// <param name="category">The category</param>
        /// <param name="formula">Engagement score formula containing the category</param>
        /// <returns></returns>
        public static string GetCriteriaDisplay(EngagementCategoryData category, EngagementScoreData formula)
        {
            var criteriaDisplay = new StringBuilder();
            if (category != null && category.Criteria != null)
            {
                foreach (var criterion in category.Criteria)
                {
                    var newLine = string.Empty;
                    if (criteriaDisplay.Length > 0)
                        newLine = "<br/>";
                    var criterionDisplay = FormatCriterionForDisplay(criterion, formula);
                    criteriaDisplay.AppendFormat(CultureInfo.CurrentCulture, "{0}{1}", newLine, criterionDisplay);
                }
            }
            return criteriaDisplay.ToString();
        }

        private static string FormatCriterionForDisplay(CategoryCriteriaData criterion, EngagementScoreData formula)
        {
            var retval = new StringBuilder();
            var operatorSymbol = criterion.Comparison.Equals(OperationData.GreaterThan)
                ? "&gt;"
                : criterion.Comparison.Equals(OperationData.LessThan)
                    ? "&lt;"
                    : "=";
            var leftHandSide = string.Empty;
            if (criterion.BasisType == BasisType.Component)
            {
                var component = GetComponentFromId(criterion.ScoreComponentId, formula);
                if (component != null)
                    leftHandSide = component.DisplayName;
            }
            else if (criterion.BasisType == BasisType.Percentile)
            {
                leftHandSide = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetPhrase("EngagmentScoreFormulaEdit.PercentileString", "Relative percentile score"));
            }
            else
                leftHandSide = LocalizationHelper.GetTranslatedText(CultureInfo.CurrentCulture, ResourceManager.GetPhrase("EngagmentScoreFormulaEdit.ScoreString", "Score"));
            
            retval.AppendFormat(CultureInfo.CurrentCulture, "{0} {1} {2}", leftHandSide, operatorSymbol, criterion.Value);
            return retval.ToString();
        }

        private static ScoreComponentData GetComponentFromId(string id, EngagementScoreData formula)
        {
            ScoreComponentData retval = null;
            if (formula != null)
            {
                foreach (var component in formula.ScoreComponents.Where(component => component.ScoreComponentId == id))
                {
                    retval = component;
                    break;
                }
            }
            return retval;
        }

        /// <summary>
        /// Update category priorities to represent movement up and down in the grid of categories.
        /// </summary>
        /// <param name="idOfCategoryToMove">Id of category being moved</param>
        /// <param name="moveUp">True if move is up; false if down</param>
        /// <param name="categories">Collection of categories</param>
        /// <returns></returns>
        public static bool MoveGridTasks(string idOfCategoryToMove, bool moveUp, EngagementCategoryDataCollection categories)
        {
            if (categories == null)
                throw new ArgumentNullException("categories");

            var changed = false;
            EngagementCategoryData movingCategory = null;
            // find the moving one, then adjust positions.
            var priority = 0;
            foreach (var category in categories)
            {
                if (category.EngagementCategoryId.Equals(idOfCategoryToMove))
                {
                    movingCategory = category;
                    break;
                }
                priority++;
            }
            if (movingCategory != null)
            {
                changed = moveUp ? MoveUp(priority, movingCategory, categories, idOfCategoryToMove) 
                                 : MoveDown(priority, movingCategory, categories, idOfCategoryToMove);

            }
            return changed;
        }


        private static bool MoveUp(int priority, EngagementCategoryData movingCategory, EngagementCategoryDataCollection categories, string idOfCategoryToMove)
        {
            var changed = false;
            if (priority > 0) // otherwise already at the top
            {
                movingCategory.Priority--;
                foreach (var category in categories)
                {
                    if (category.EngagementCategoryId != idOfCategoryToMove && category.Priority == movingCategory.Priority)
                    {
                        category.Priority++;
                        break;
                    }
                }
                changed = true;
            }
            return changed;
        }

        private static bool MoveDown(int priority, EngagementCategoryData movingCategory, EngagementCategoryDataCollection categories, string idOfCategoryToMove)
        {
            var changed = false;
            if (priority < categories.Count - 1) // otherwise already at the bottom
            {
                movingCategory.Priority++;
                foreach (var category in categories)
                {
                    if (category.EngagementCategoryId != idOfCategoryToMove && category.Priority == movingCategory.Priority)
                    {
                        category.Priority--;
                        break;
                    }
                }
                changed = true;
            }
            return changed;
        }


        /// <summary>
        /// Remove uninitialized criteria from the given category
        /// </summary>
        /// <param name="category">Category to update</param>
        public static void RemoveUninitializedCriteriaFromCategoryOnCancel(EngagementCategoryData category)
        {
            if (category == null)
                throw new ArgumentNullException("category");

            var deletionList = new List<CategoryCriteriaData>();
            if (category.Criteria != null)
            {
                foreach (var criterion in category.Criteria)
                {
                    if (!CriterionIsInitialized(criterion))
                        deletionList.Add(criterion);
                }
                foreach (var criterion in deletionList)
                {
                    category.Criteria.Remove(criterion);
                }
            }
        }

        /// <summary>
        /// Remove the given category from a formula and adjust remaining priorities
        /// </summary>
        /// <param name="category">Category to remove</param>
        /// <param name="formula">Formula to use</param>
        public static void RemoveCategoryAndAdjustPriorities(EngagementCategoryData category, EngagementScoreData formula)
        {
            if (category == null)
                throw new ArgumentNullException(nameof(category));
            if (formula == null)
                throw new ArgumentNullException(nameof(formula));

            if (formula.Categories == null)
                throw new InvalidOperationException(ResourceManager.GetPhrase("CategoryNotInFormula", "The category is not in the formula."));
            var found = formula.Categories.Any(cat => cat.EngagementCategoryId == category.EngagementCategoryId);
            if (!found)
                throw new InvalidOperationException(ResourceManager.GetPhrase("CategoryNotInFormula", "The category is not in the formula."));

            var removedPriority = category.Priority;
            formula.Categories.Remove(category);

            foreach (var remainingCategory in formula.Categories)
            {
                if (remainingCategory.Priority > removedPriority)
                    remainingCategory.Priority--;
            }
        }

        public static void AddCategoryAndAdjustPriorities(EngagementCategoryData category, EngagementScoreData formula)
        {
            if (category == null)
                throw new ArgumentNullException(nameof(category));
            if (formula == null)
                throw new ArgumentNullException(nameof(formula));

            if (formula.Categories == null)
                formula.Categories = new EngagementCategoryDataCollection();
            var found = formula.Categories.Any(cat => cat.EngagementCategoryId == category.EngagementCategoryId);
            if (found)
                throw new InvalidOperationException(ResourceManager.GetPhrase("CategoryAlreadyInFormula", "The category is already in the formula."));

            var addedPriority = category.Priority;
            foreach (var existingCategory in formula.Categories)
            {
                if (existingCategory.Priority >= addedPriority)
                    existingCategory.Priority++;
            }
            formula.Categories.Insert(addedPriority, category);
        }
    }
}