using System;
using Asi.Web.UI;

namespace Asi.Web.iParts.Communications.EngagementScoreFormulaList
{
    public partial class EngagementScoreFormulaCreator : DisplayPageBase
    {
        /// <summary>
        /// Data bind controls
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DataBind();
        }        
    }
}