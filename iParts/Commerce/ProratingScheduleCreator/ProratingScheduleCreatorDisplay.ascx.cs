using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
using Asi.Business.ContentManagement;
using Asi.Web.UI;
using Asi.Web.UI.WebControls;
using Asi.Soa.Membership.DataContracts;
using Telerik.Web.UI;

namespace Asi.Web.iParts.Commerce.ProratingScheduleCreator
{
    public partial class ProratingScheduleCreatorDisplay : iPartDisplayBase
    {
        #region Event Handlers

        [ExcludeFromCodeCoverage]
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (DoNotRenderInDesignMode && IsContentDesignMode)
                HideContent = true;
            else
                HideContent = false;

        }

       
        #endregion

        
        #region Methods

        [ExcludeFromCodeCoverage]
        protected void ResultsGridNeedDataSource(object sender, EventArgs e)
        {
            if ((!AppContext.CurrentPrincipal.IsInRole("SysAdmin") && !AppContext.CurrentPrincipal.IsInRole("Staff")) || IsContentDesignMode)
                return;
            ScheduleGrid.DataSource = LoadSchedules();
        }

        /// <summary>
        /// Create the appropriate object
        /// </summary>
        /// <returns></returns>
        [ExcludeFromCodeCoverage]
        public override ContentItem CreateContentItem()
        {
            var item = new ProratingScheduleCreatorCommon { ContentItemKey = ContentItemKey };
            return item;
        }

        [ExcludeFromCodeCoverage]
        private List<ProrateScheduleData> LoadSchedules()
        {
            var schedules = new List<ProrateScheduleData>();
            var prorateSchedules = ProratingScheduleCreatorCommon.FindSchedules(EntityManager);
            if (prorateSchedules == null || prorateSchedules.Result.Count == 0) return schedules;

            foreach (var item in prorateSchedules.Result.OfType<ProrateScheduleData>()
                        .OrderBy(x => x.Name))
            {
                schedules.Add(item);
            }
            return schedules;
        }

        [ExcludeFromCodeCoverage]
        protected void ResultsGridOnItemDataBound(object sender, ListerEventArgs2 e)
        {
            if (e == null) throw new ArgumentNullException("e");

            var gridDataItem = e.Item as GridDataItem;
            if (gridDataItem == null) return;
            if ((gridDataItem.ItemType != GridItemType.Item && gridDataItem.ItemType != GridItemType.AlternatingItem))
                return;
            var schedule = (ProrateScheduleData)gridDataItem.DataItem;
            string setHref = string.Format(CultureInfo.InvariantCulture, "{0}/iParts/Commerce/ProratingScheduleCreator/ProratingScheduleCreatorDialog.aspx?ProrateScheduleId={1}&amp;iMode=Edit&amp;iOperation=Edit",
                Utilities.GetTildeExpansion(), schedule.ProrateScheduleId);
            string setNameLink = string.Format(CultureInfo.InvariantCulture, "<a href=\"{0}\">{1}</a>", setHref, schedule.Name);
            gridDataItem["Name"].Text = setNameLink;

            var deleteLink = gridDataItem.Controls[4].Controls[0] as LinkButton;
            if (deleteLink != null)
                deleteLink.Text = ResourceManager.GetWord("Delete");
        }

        [ExcludeFromCodeCoverage]
        protected void DeleteSchedule(object sender, ListerEventArgs2 e)
        {
            if (e == null) return;

            GridDataItem item = e.Item as GridDataItem;
            if (item == null) return;

            var scheduleId = item.GetDataKeyValue("ProrateScheduleId").ToString();
            var result = ProratingScheduleCreatorCommon.DeleteSchedule(EntityManager, scheduleId);
            if (!String.IsNullOrEmpty(result))
                AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, result));
            else
            {
                ScheduleGrid.DataSource = null;
                ScheduleGrid.DataBind();
            }

        }
        #endregion
    }
}