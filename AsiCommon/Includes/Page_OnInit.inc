<script language="c#" runat="server">

	//These methods are automatically connected to event handlers for the standard page events
	//by the System.Web.UI.TemplateControl.  Adding these members avoids first chance exceptions.
	private void Page_AbortTransaction(object sender, System.EventArgs e){}
	private void Page_CommitTransaction(object sender, System.EventArgs e){}
	private void Page_DataBind(object sender, System.EventArgs e){}
	private void Page_Error(object sender, System.EventArgs e){}
	private void Page_Init(object sender, System.EventArgs e){}
	private void Page_Load(object sender, System.EventArgs e){}
	private void OnTransactionAbort(object sender, System.EventArgs e){}
	private void OnTransactionCommit(object sender, System.EventArgs e){}
	private void Page_PreRender(object sender, System.EventArgs e){}
	private void Page_Unload(object sender, System.EventArgs e){}
	private void Page_Dispose(object sender, System.EventArgs e){}

	override protected void OnInit(System.EventArgs e) 
	{
		if (Request.UserLanguages != null) {
			System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(Request.UserLanguages[0]);
			System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Request.UserLanguages[0]);
		}
		base.OnInit(e);
	}
		
</script>