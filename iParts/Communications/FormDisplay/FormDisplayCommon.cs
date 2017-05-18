using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.Serialization;
using Asi;
using Asi.Business.ContentManagement;
using Asi.Business.ContentManagement.ContentType;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;

namespace Asi.Web.iParts.Communications
{
    /// <summary>
    /// Implements base logic for the FormDisplay iPart.
    /// </summary>
    [DataContract(Name = "FormDisplay")]
    public class FormDisplayCommon : iPartCommonBase
    {
        private readonly bool mIsNew;

        #region Constructors

        /// <summary>
        /// Creates a new FormDisplayCommon object.
        /// </summary>
        public FormDisplayCommon()
        {
            mIsNew = true;
        }

        /// <summary>
        /// Creates a new FormDisplayCommon object.
        /// </summary>
        /// <param name="contentKey"></param>
        [ExcludeFromCodeCoverage]
        public FormDisplayCommon(Guid contentKey) : base(contentKey) { }

        #endregion

        #region Properties

        /// <summary>
        /// Gets the ContentTypeKey for the ContentTypeRegistry object that represents this content type.
        /// </summary>
        [ExcludeFromCodeCoverage]
        public override Guid ContentTypeKey
        {
            get
            {
                // TODO: Define your Content Type in iMIS (Content Manager->Maintenance->Content types)
                // TODO: Once the Content Type is defined, copy and paste its ContentKey value here.
                return new Guid("00000000-0000-0000-0000-000000000000");
            }
        }

        /// <summary>
        /// Whether this is a newly created ContentItem or not.
        /// </summary>
        public override bool IsNew
        {
            get
            {
                return mIsNew;
            }
        }

        #endregion Properties

        #region Methods

        #endregion

        #region Static Methods

        /// <summary>
        /// Returns a list of all values for a given Query.  Note: SOA limits the number of results returned
        /// from a single call to 100, so this method uses paging to get all of the results 
        /// </summary>
        /// <param name="valueListQueryRule">Query that defines the available values and associated display strings</param>
        /// <param name="entityManager"> </param>
        /// <returns></returns>
        /// RD 5/23/13: This function is copied from PanelEditorCommon.cs. I'm not sure where we would put a shared version
        /// of this code.
        /// RD 5/23/13: TODO: Ask about this code analysis warning, CA1006, Do not nest generic types in member signatures
        public static Collection<KeyValuePair<string, string>> GetValueListQueryResults(
            PropertyRuleQueryData valueListQueryRule, EntityManager entityManager)
        {
            if (entityManager == null || valueListQueryRule == null)
                return null;

            var valueListQueryResults = entityManager.Find(valueListQueryRule.Query);
            if (valueListQueryResults == null || valueListQueryResults.Result == null ||
                valueListQueryResults.Result.Count < 1)
                return null;

            var displayList = new Collection<KeyValuePair<string, string>>();
            while (valueListQueryResults.Query.Pager.PageNumber < valueListQueryResults.Query.Pager.PageCount)
            {
                foreach (GenericEntityData valueDescriptionPair in valueListQueryResults.Result)
                {
                    var possiblevalue =
                        valueDescriptionPair.Properties.GetPropertyValue(valueListQueryRule.ValuePropertyName);
                    var possibleDescription =
                        valueDescriptionPair.Properties.GetPropertyValue(valueListQueryRule.DescriptionPropertyName);
                    if (possiblevalue == null)
                        continue;
                    if (string.IsNullOrEmpty(possibleDescription as string))
                        possibleDescription = possiblevalue.ToString();
                    displayList.Add(new KeyValuePair<string, string>(possiblevalue.ToString(),
                                                                     possibleDescription.ToString()));
                }
                valueListQueryResults.Query.Pager.PageNumber++;
                valueListQueryResults = entityManager.Find(valueListQueryResults.Query);
            }
            return displayList;
        }

        #endregion

    }

}
