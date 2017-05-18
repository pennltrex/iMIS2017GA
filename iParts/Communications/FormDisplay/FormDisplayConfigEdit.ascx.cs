using Asi.Web.UI;
using Asi.Web.UI.WebControls;

namespace Asi.Web.iParts.Communications
{
    public partial class FormDisplayConfigEdit : iPartEditBase
    {
        /// <summary>
        /// Name of atom component that this control will bind to.
        /// </summary>
        public override string AtomComponentName
        {
            get
            {
                return "FormDisplay";
            }
        }
    }
}