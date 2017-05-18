using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
using Asi.Soa.Communications.DataContracts;
using Asi.Web.UI;
using Asi.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Asi.Web.iParts.Communications.EngagementScoreFormulaList
{
    public partial class EngagementScoreFormulaListDisplay : iPartDisplayBase
    {
        #region Event Handlers

        [ExcludeFromCodeCoverage]
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Initialize();
        }

        [ExcludeFromCodeCoverage]
        protected void ResultsGridNeedDataSource(object sender, EventArgs e)
        {
            if ((!AppContext.CurrentPrincipal.IsInRole("SysAdmin") && !AppContext.CurrentPrincipal.IsInRole("Staff")) || IsContentDesignMode)
                return;
            EngagementScoreGrid.DataSource = LoadEngagementScores();
        }

        [ExcludeFromCodeCoverage]
        protected void ResultsGridItemCreated(object sender, ListerEventArgs2 e)
        {
            if (e == null) throw new ArgumentNullException("e");
            var item = e.Item as GridItem;
            if (item != null && item.ItemType == GridItemType.Header)
                item.Cells[4].HorizontalAlign = HorizontalAlign.Center;          
        }

        [ExcludeFromCodeCoverage]
        protected void ResultsGridOnItemDataBound(object sender, ListerEventArgs2 e)
        {
            if (e == null) throw new ArgumentNullException("e");

            var gridDataItem = e.Item as GridDataItem;
            if (gridDataItem == null) return;
            if ((gridDataItem.ItemType != GridItemType.Item && gridDataItem.ItemType != GridItemType.AlternatingItem))
                return;
            var engagementScore = (EngagementScoreData)gridDataItem.DataItem;
            string setName = engagementScore.Name;
            // This link is based on one orginally from NotificationSetCreator. URL variables have been removed to allow the Staff site navigation to be shown.
            string setHref = string.Format(CultureInfo.InvariantCulture, "{0}/iParts/Communications/EngagementScoreFormulaList/EngagementScoreFormulaCreator.aspx?EngagementScoreId={1}&amp;iMode=Edit&amp;iOperation=Edit",
                Utilities.GetTildeExpansion(), engagementScore.EngagementScoreId);
            // add website key to the URL parameters
            if (!string.IsNullOrEmpty(WebsiteKey))
                setHref = Utilities.AppendToQueryString(setHref, "WebsiteKey", WebsiteKey);
            string setNameLink = string.Format(CultureInfo.InvariantCulture, "<a href=\"{0}\">{1}</a>", setHref, setName);
            gridDataItem["Name"].Text = setNameLink;

            gridDataItem["IsEnabled"].Text = engagementScore.IsEnabled ? "&#x2713;" : string.Empty;
            gridDataItem["IsEnabled"].CssClass = "Center";

            var deleteLink = gridDataItem.Controls[5].Controls[0] as LinkButton;
            if (deleteLink != null)
                deleteLink.Text = ResourceManager.GetWord("Delete");
            var button = (gridDataItem["DeleteColumn"].Controls[0] as ImageButton);
            if (button != null)
            {          
                button.Attributes["onclick"] = EngagementScoreFormulaListHelper.GetOnClickText(engagementScore);
                if (engagementScore.SystemTypeCode == 20 && !EngagementScoreFormulaListCommon.IsAsiInternal)
                    button.Enabled = false;                
            }
        }

        [ExcludeFromCodeCoverage]
        protected void DeleteEngagementScore(object sender, ListerEventArgs2 e)
        {
            if (e == null) return;

            GridDataItem item = e.Item as GridDataItem;
            if (item == null) return;

            var engagementScoreId = new Guid(item.GetDataKeyValue("EngagementScoreId").ToString());

            if (engagementScoreId != Guid.Empty)
            {
                var results = EngagementScoreFormulaListHelper.DeleteEngagementScore(engagementScoreId, EntityManager);

                if (!string.IsNullOrEmpty(results))
                {
                    ((DisplayPageBase)Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                        ResourceManager.GetPhrase("DeleteError", "There was an error deleting the engagement score. {0}",
                            results)));
                }
                else
                {
                    DeletingScoreId = engagementScoreId.ToString();
                }
                
                EngagementScoreGrid.DataSource = null;
                EngagementScoreGrid.DataBind();
            }

        }
        #endregion

        #region Properties

        private string DeletingScoreId
        {
            get { return (string) ViewState["DeletingScoreId"]; }
            set { ViewState["DeletingScoreId"] = value; }
        }
        #endregion

        #region Methods

        /// <summary>
        /// Create the appropriate object
        /// </summary>
        /// <returns></returns>
        public override Business.ContentManagement.ContentItem CreateContentItem()
        {
            var item = new EngagementScoreFormulaListCommon { ContentItemKey = ContentItemKey };
            return item;
        }

        [ExcludeFromCodeCoverage]
        private void Initialize()
        {
            if (DoNotRenderInDesignMode && IsContentDesignMode)
                HideContent = true;
            else
                HideContent = false;

            ListerPanel.Enabled = ListerPanel.Visible = EngagementScoreGrid.Visible = !IsContentDesignMode;
            EngagementScoreGrid.AddButtonEnabled = EngagementScoreGrid.Visible;

            if ((!AppContext.CurrentPrincipal.IsInRole("SysAdmin") && !AppContext.CurrentPrincipal.IsInRole("Staff")) ||
                IsContentDesignMode)
                EngagementScoreGrid.AddButtonEnabled = false;

            var licensed = HasLicenseKey("SCORING");
            if (!licensed)
            {
                EngagementScoreGrid.AddButtonEnabled = false;
                EngagementScoreGrid.DeleteColumnLocation = ListerColumnLocation.None;
            }
        }

        [ExcludeFromCodeCoverage]
        private List<EngagementScoreData> LoadEngagementScores()
        {
            var listOfEngagementScoreData = new List<EngagementScoreData>();
            var engagementScores = EngagementScoreFormulaListHelper.FindEngagementScores(EntityManager);
            if (engagementScores == null || engagementScores.Result.Count == 0) return listOfEngagementScoreData;

            foreach (var oneEngagementScore in engagementScores.Result.OfType<EngagementScoreData>()
                        .OrderByDescending(x => x.Name))
            {
                if (oneEngagementScore.EngagementScoreId != DeletingScoreId)
                    listOfEngagementScoreData.Add(oneEngagementScore);
            }
            return listOfEngagementScoreData;
        }

        #endregion

        #region Method Overrides

        /// <summary>
        /// Called on the connection consumer. This method will act on the object passed in from
        /// the connection provider.
        /// </summary>
        /// <param name="providerObject">Object passed in from the connection provider.</param>
        public override void SetObjectProviderData(Object providerObject)
        {
        }

        /// <summary>
        /// Called on the connection provider. 
        /// </summary>
        /// <returns>An object that will be acted on by the connection consumer.</returns>
        public override Object GetObjectProviderData()
        {
            return null;
        }

        #endregion Method Overrides

        #region Static Methods

        #endregion
    }
}