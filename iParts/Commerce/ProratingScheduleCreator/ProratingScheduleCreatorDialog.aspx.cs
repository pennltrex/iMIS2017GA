using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Web.UI;

namespace Asi.Web.iParts.Commerce.ProratingScheduleCreator
{
    public partial class ProratingScheduleCreatorDialog : DisplayPageBase   
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DataBind();
        }
    }
}