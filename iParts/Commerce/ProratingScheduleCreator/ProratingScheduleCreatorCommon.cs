using System;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.Serialization;
using System.ServiceModel;
using Asi.Business.ContentManagement;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;
using Asi.Soa.Membership.DataContracts;

namespace Asi.Web.iParts.Commerce.ProratingScheduleCreator
{
    /// <summary>
    /// Implements base logic for the ProratingScheduleCreator iPart.
    /// </summary>
    [DataContract(Name = "ProratingScheduleCreator")]
    public class ProratingScheduleCreatorCommon : iPartCommonBase
    {

        #region Constructors

        /// <summary>
        /// Creates a new ProratingScheduleCreatorCommon object.
        /// </summary>
        public ProratingScheduleCreatorCommon()
        {
        }

        /// <summary>
        /// Creates a new ProratingScheduleCreatorCommon object.
        /// </summary>
        /// <param name="contentKey"></param>
        public ProratingScheduleCreatorCommon(Guid contentKey) : base(contentKey) { }

        #endregion

        #region Properties

        /// <summary>
        /// Gets the ContentTypeKey for the ContentTypeRegistry object that represents this content type.
        /// </summary>
        public override Guid ContentTypeKey
        {
            get
            {
                return new Guid("b953f891-213f-401f-8828-ebca29f65f50");
            }
        }
        
        #endregion Properties


        #region Static Methods

        /// <summary>
        /// List of all schedules
        /// </summary>
        [ExcludeFromCodeCoverage]
        public static FindResultsData FindSchedules(EntityManager em)
        {
            if (em == null) throw new ArgumentNullException("em");
            var query = new QueryData("ProrateSchedule")
            {
                SortFields =
                    new SortFieldDataCollection
                    {
                        new SortFieldData {PropertyName = "Name", SortOrder = SortOrderData.Ascending}
                    }
            };
            return em.Find(query);
        }

        /// <summary>
        /// Save the given ProrateSchedule
        /// </summary>
        /// <param name="em"></param>
        /// <param name="schedule"></param>
        /// <param name="create"></param>
        public static string SaveSchedule(EntityManager em, ProrateScheduleData schedule, bool create)
        {
            if (em == null)
                throw new ArgumentNullException("em");
            if (schedule == null)
                throw new ArgumentNullException("schedule");
            var message = string.Empty;
            ValidateResultsData results;
            if (create)
                results = em.Add(schedule);
            else
                results = em.Update(schedule);

            if (!results.IsValid)
                message = results.ValidationResults.Summary;
            else if (create)
            {
                var newSchedule = results.Entity as ProrateScheduleData;
                if (newSchedule != null)
                    schedule.ProrateScheduleId = newSchedule.ProrateScheduleId; 
            }
            return message;

        }

        /// <summary>
        /// Delete the specified ProrateSchedule
        /// </summary>
        /// <param name="em"></param>
        /// <param name="scheduleId"></param>
        public static string DeleteSchedule(EntityManager em, string scheduleId)
        {
            if (em == null)
                throw new ArgumentNullException("em");
            if (String.IsNullOrEmpty(scheduleId))
                throw new ArgumentNullException("scheduleId");
            var message = string.Empty;
            var schedule = new ProrateScheduleData {ProrateScheduleId = scheduleId};
            try
            {
                em.Delete(schedule);
            }
            catch (FaultException ex)
            {
                message = ex.Message;
            }
            return message;
        }
        #endregion

    }

}
