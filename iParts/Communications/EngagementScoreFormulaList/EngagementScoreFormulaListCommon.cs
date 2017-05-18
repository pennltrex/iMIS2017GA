using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.Serialization;
using Asi.Business.ContentManagement;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;

namespace Asi.Web.iParts.Communications.EngagementScoreFormulaList
{
    /// <summary>
    /// Implements base logic for the EngagementScoreFormulaList iPart.
    /// </summary>
    [DataContract(Name = "EngagementScoreFormulaList")]
    public class EngagementScoreFormulaListCommon : iPartCommonBase
    {
        private readonly bool mIsNew;

        #region Constructors

        /// <summary>
        /// Creates a new EngagementScoreFormulaListCommon object.
        /// </summary>
        public EngagementScoreFormulaListCommon()
        {
            mIsNew = true;
        }

        /// <summary>
        /// Creates a new EngagementScoreFormulaListCommon object.
        /// </summary>
        /// <param name="contentKey"></param>
        public EngagementScoreFormulaListCommon(Guid contentKey) : base(contentKey) { }

        #endregion

        #region Properties

        /// <summary>
        /// Gets the ContentTypeKey for the ContentTypeRegistry object that represents this content type.
        /// </summary>
        public override Guid ContentTypeKey
        {
            get
            {
                return new Guid("708c74c6-24c0-455f-992c-10f213bd2345");
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

        /// <summary>
        /// Check whether the system is being used by internal ASI staff.  
        /// This is used in conjunction with SystemType to determine which fields are seen and which are editable.
        /// </summary>
        internal static bool IsAsiInternal
        {
            get { return Asi.Security.Utility.SecurityHelper.IsAsiInternal; }
        }

        #endregion Properties

        #region Methods

        ///// <summary>
        ///// Reads current Property values
        ///// </summary>
        ///// <returns></returns>
        //public override ContentParameterCollection GetCurrentParameterValues()
        //{
        //    var collection = base.GetCurrentParameterValues();

        //    return collection;
        //}

        internal static List<StringPair> GetSystemTypeRefList()
        {
            var rs = new EntityManager().Find(new QueryData("SystemTypeRef"));
            return (from GenericEntityData item in rs.Result let value = item.Properties["SystemTypeCode"].Value.ToString() let text = (string) item.Properties["SystemTypeName"].Value select new StringPair(value, text.ToString(CultureInfo.InvariantCulture))).ToList();
        }

        #endregion

        #region Static Methods

        #endregion

    }

}
