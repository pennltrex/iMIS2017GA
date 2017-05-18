using System;
using System.Collections.ObjectModel;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Web.UI.WebControls;
using Asi.Soa.ClientServices;
using Asi.Soa.Membership.DataContracts;
using Asi.Web.UI;
using Asi.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Asi.Web.iParts.Commerce.ProratingScheduleCreator
{
    public partial class ScheduleEdit : UserControlBase
    {
        private string scheduleId;
        private static EntityManager entityManager;
        [ExcludeFromCodeCoverage]
        public static EntityManager EntityManager
        {
            get { return entityManager ?? (entityManager = new EntityManager()); }
        }

        [ExcludeFromCodeCoverage]
        protected string ProrateScheduleId
        {
            get
            {
                if (Page.Request.QueryString["ProrateScheduleId"] != null && !string.IsNullOrEmpty(Page.Request.QueryString["ProrateScheduleId"]))
                    scheduleId = Page.Request.QueryString["ProrateScheduleId"];
                return scheduleId;
            }
            set { scheduleId = value; }
        }

        [ExcludeFromCodeCoverage]
        protected bool IsNew
        {
            get
            {
                if (ViewState["IsNew"] != null)
                    return (bool) ViewState["IsNew"];
                if (Page.Request.QueryString["iOperation"] != null)
                {
                    if (Page.Request.QueryString["iOperation"] == "New")
                    {
                        IsNew = true;
                        return true;
                    }
                }
                IsNew = false;
                return false;
            }
            set { ViewState["IsNew"] = value; }
        }

        [ExcludeFromCodeCoverage]
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ScheduleRadGrid.NeedDataSource += ScheduleRadGridNeedDataSource;
            ScheduleRadGrid.ItemDataBound += ScheduleRadGridRadGrid1ItemDataBound;
        }

        [ExcludeFromCodeCoverage]
        protected void ScheduleRadGridRadGrid1ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var gridDataItem = e.Item as GridDataItem;
            if (gridDataItem != null)
            {
                var monthLabel = (BusinessLabel)gridDataItem.FindControl("MonthLabel");
                var rateLabel = (BusinessTextBox)gridDataItem.FindControl("RateLabel");
                var monthRate = e.Item.DataItem as MonthRate;
                if (monthRate != null)
                {
                    monthLabel.Text = (monthRate.FiscalMonth + 1).ToString(CultureInfo.CurrentCulture);
                    rateLabel.Text = monthRate.Rate.ToString(CultureInfo.CurrentCulture);
                }
            }
        }


        [ExcludeFromCodeCoverage]
        private void ScheduleRadGridNeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            Rates = new MonthRate[12];
            var i = 0;
            foreach (var rate in ProratingSchedule.Rates)
            {
                Rates[i] = new MonthRate { FiscalMonth = i++, Rate = rate };
            }
            ScheduleRadGrid.DataSource = Rates;
        }

        [ExcludeFromCodeCoverage]
        private ProrateScheduleData ProratingSchedule
        {
            get { return (ProrateScheduleData) ViewState["ProrateSchedule"]; }
            set { ViewState["ProrateSchedule"] = value; }

        }

        [ExcludeFromCodeCoverage]
        private string ReturnUrl
        {
            get { return (String)ViewState["ReturnUrl"]; }
            set { ViewState["ReturnUrl"] = value; }
        }

        [ExcludeFromCodeCoverage]
        protected void Page_Load(object sender, EventArgs e)
        {
            //Button captions
            if (!IsPostBack && Request.UrlReferrer != null)
                ReturnUrl = Request.UrlReferrer.AbsoluteUri;
            SaveButton.Text = ResourceManager.GetPhrase("SaveButton", "Save");
            SaveAndExitButton.Text = ResourceManager.GetPhrase("SaveAndExitButton", "Save & Exit");
            ResetCancelButton.Text = ResourceManager.GetPhrase("CancelButton", "Cancel");
            if (!IsPostBack)
            {
                if (!IsNew)
                {
                    var schedules = ProratingScheduleCreatorCommon.FindSchedules(EntityManager);
                    foreach (ProrateScheduleData schedule in schedules.Result)
                    {
                        if (schedule.ProrateScheduleId.Equals(ProrateScheduleId))
                        {
                            ProratingSchedule = schedule;
                            break;
                        }
                    }
                }
                else
                {
                    ProratingSchedule = new ProrateScheduleData
                    {
                        Rates = new Collection<decimal>
                        {1m, 1m, 1m, 1m, 1m, 1m, 1m, 1m, 1m, 1m, 1m, 1m}
                    };
                }
            }
        }

        /// <summary>
        /// Save method notification set
        /// </summary>  
        [ExcludeFromCodeCoverage]      
        protected internal void SubmitClickSave(object sender, EventArgs e)
        {
            Save();
        }

        [ExcludeFromCodeCoverage]
        private Boolean Save()
        {
            var ok = true;
            var i = 0;
            foreach (GridDataItem item in ScheduleRadGrid.MasterTableView.Items)
            {
                var textbox = item.FindControl("RateLabel") as BusinessTextBox;
                if (textbox != null)
                {
                    var validator = item.FindControl("RateValidator") as RangeValidator;
                    if (validator != null)
                    {
                        validator.Enabled = true;
                        validator.Validate();
                        if (!validator.IsValid)
                        {
                            validator.Text = "Value must be a non-negative number";
                            ok = false;
                        }
                        else
                        {
                            validator.Text = "";
                        }
                    }
                    var validator2 = item.FindControl("RateEmptyValidator") as AsiRequiredFieldValidator;
                    if (validator2 != null)
                    {
                        validator2.Enabled = true;
                        validator2.Validate();
                        if (!validator2.IsValid)
                        {
                            validator2.Text = "Required";
                            ok = false;
                        }
                        else
                        {
                            validator2.Text = "";
                        }
                    }
                    Decimal result;
                    if (Decimal.TryParse(textbox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out result))
                    {
                        ProratingSchedule.Rates[i] = result;
                    }
                }
                i++;
            }
            if (ok)
            {
                ProratingSchedule.Name = ScheduleNameTextBox.Text;
                ProratingSchedule.Description = ScheduleDescTextBox.Text;
                var saveResult = ProratingScheduleCreatorCommon.SaveSchedule(EntityManager, ProratingSchedule, IsNew);
                if (!String.IsNullOrEmpty(saveResult))
                {
                    IUserControl parent = GetParentUserControl(this);
                    if (parent != null)
                        parent.AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, saveResult));
                    ok = false;
                }
                else
                    IsNew = false;
            }
            return ok;
            
        }

        [ExcludeFromCodeCoverage]
        protected internal void SubmitClickSaveAndExit(object sender, EventArgs e)
        {
            var ok = Save();
            if (ok)
                ResetCancel_Click(sender, e);
        }

        [ExcludeFromCodeCoverage]
        protected internal void ResetCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ReturnUrl);
        }

        [ExcludeFromCodeCoverage]
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ScheduleNameTextBox.Text = ProratingSchedule.Name;
            ScheduleDescTextBox.Text = ProratingSchedule.Description;
            if (!IsNew)
                SchedulePanel.Text = ResourceManager.GetPhrase("EditNamedProratingSchedule", "Edit {0}", ProratingSchedule.Name);
        }


        protected MonthRate[] Rates;

    }
    public class MonthRate
    {
        public int FiscalMonth { get; set; }
        public Decimal Rate { get; set; }
    }
}