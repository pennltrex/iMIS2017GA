<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.UserControlBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<%@ Assembly Name="System.ServiceProcess, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>

<%@import namespace="Asi" %>
<%@import namespace="Asi.Application" %>
<%@import namespace="Asi.Business" %>
<%@import namespace="Asi.Security" %>
<%@import namespace="Asi.Web" %>
<%@import namespace="Asi.Web.UI.WebControls" %>
<%@import namespace="Microsoft.Win32" %>
<%@import namespace="System.Data" %>
<%@import namespace="System.Diagnostics" %>
<%@import namespace="System.Drawing" %>
<%@import namespace="System" %>
<%@Import Namespace="System.ServiceProcess" %>
<%@import namespace="System.Web" %>
<%@import namespace="System.Web.UI.WebControls" %>
<%@import namespace="System.Web.UI.HtmlControls" %>
<script language="C#" runat="server">
		private void Page_Load(object sender, EventArgs e)
		{
			if(! IsPostBack)
				InitializeStrings();

		}
		private void InitializeStrings()
		{		

			lblImisVersion.Text = ResourceManager.GetPhrase("iMISVersion","iMIS Version");
			lblNetFrameworkVersion.Text = ResourceManager.GetPhrase("NETFrameworkVersion",".NET Framework Version");
			lblDbServer.Text = ResourceManager.GetPhrase("DatabaseServer","Database Server");
			lblDatabase.Text = ResourceManager.GetWord("Database");
			lblWebServerPath.Text = ResourceManager.GetPhrase("WebServerPath","Web Server file path");
			lblSMTPServer.Text = ResourceManager.GetPhrase("SMTPServer","SMTP Server");
			lblWebServerCrystalPath.Text = ResourceManager.GetPhrase("WebServerCrystalPath","Crystal Reports temp path");
			lblImisNetPrinter.Text = ResourceManager.GetPhrase("ImisNetPrinter","iMIS.net Printers");
			lblLoginTimeout.Text = ResourceManager.GetPhrase("LoginTimeout","Login Timeout");
			lblURL.Text = ResourceManager.GetPhrase("WebServerURL","Web Server URL");
			lblActiveUser.Text = ResourceManager.GetPhrase("ActiveUserId","Active User Id");
			lblWorkflowService.Text = ResourceManager.GetPhrase("WorkflowService","Workflow Service");
			lblCrystalVersion.Text = ResourceManager.GetPhrase("CrystalReportsPrintEngine","Crystal Reports Print Engine");

			string dsDataSource = string.Empty;
			string dsInitialCatalog = string.Empty;

			//get the connection info and set the need display values
			string dsConnection = SystemConfig.GetString(SystemConfig.SqlConnection);
			string[] dc = dsConnection.Split(';');

			for(int x = 0, xc = dc.Length; x < xc; x++)
			{
				string[] pair = dc[x].Split('=');
				if(pair.Length.Equals(2))
				{
					if(Aid.AreEqual("Initial Catalog", pair[0].Trim()))
					{
						dsInitialCatalog = pair[1].Trim();
						lblDatabaseValue.Text = dsInitialCatalog;
					}
					else if(Aid.AreEqual("Data Source", pair[0].Trim()))
					{
						dsDataSource = pair[1].Trim();
						lblDbServerValue.Text = dsDataSource;
					}

				}
			}

			lblWebServerPathValue.Text = HttpRuntime.AppDomainAppPath;
			lblWebServerCrystalPathValue.Text = AppConfig.GetFirstConfigValue("CrystalReports.TempPath");
			lblURLValue.Text = Asi.Web.Utilities.GetDocumentBaseUri();

			string timeOut = SystemConfig.GetString("Authenticate.PersistLogin.Minutes");
			if(timeOut == "0")
				lblLoginTimeoutValue.Text = ResourceManager.GetWord("Indefinite");
			else
				lblLoginTimeoutValue.Text = timeOut;
		
			// Get the iMIS Version number
			try
			{
				BusinessController controller = BusinessController.NewBusinessController("SystemParam");
				BusinessItem biVersion = controller[new string[]{"System_Control.Version"}];
				//BusinessItem biLicensedProducts = controller[new string[]{"System_Control.LicensedProducts"}];
			
				if (biVersion != null)
					lblImisVersionValue.Text = (string)biVersion["ShortValue"];
			}
			catch
			{
				lblImisVersionValue.Text = ResourceManager.GetPhrase("iMISVersionNumberNotFound","*iMIS version number not found");
			}

	
			//Get the .Net Framework version number 
			lblNetFrameworkVersionValue.Text = Environment.Version.ToString();


			//Get the Crystal Reports Print Engine install location from the registry
			try
			{
				RegistryKey regKey = Registry.LocalMachine;
				regKey = regKey.OpenSubKey("SOFTWARE\\Crystal Decisions\\9.0\\Crystal Reports");
				object path = regKey.GetValue("CommonFiles");
				string fullPath = path + "\\crpe32.dll";
				//return the files version number
				FileVersionInfo fileVersion = FileVersionInfo.GetVersionInfo(fullPath);
				lblCrystalVersionValue.Text = fileVersion.FileVersion.ToString();
			}
			catch
			{
				lblCrystalVersionValue.Text = ResourceManager.GetPhrase("CrystalReportsPrintEngineNotFound","*Crystal Reports Print Engine not found");
			}

			// The printer string will be used to provide the display string.
			IEnumerator printers = Asi.ProcessEngine.Utilities.InstalledPrinters();
			bool flag = true;
			while(printers.MoveNext())
			{
				if (flag)
				{
					lblImisNetPrinterValue.Text = lblImisNetPrinterValue.Text + printers.Current.ToString();
					flag = false;
				}
				else
					lblImisNetPrinterValue.Text = lblImisNetPrinterValue.Text + ", " + printers.Current.ToString();
			}

			// Display the active users name			
			lblActiveUserValue.Text = (AppPrincipal.CurrentPrincipal).AppIdentity.UserId; //AppPrincipal.CurrentPrincipal.Identity.Name;

			// Check to see if the Workflow service is installed and what stage it is in
			ServiceController[] services = ServiceController.GetServices();
			foreach( ServiceController service in services ) 
			{
				if(service.ServiceName == "AsiWorkflow15")
				{ 	
					lblWorkflowServiceValue.Text = service.Status.ToString();
					break;
				}
				else
				{
					lblWorkflowServiceValue.Text = ResourceManager.GetPhrase("WorkflowServiceNotFound","*WorkflowService not found");
				}
			}

			//Get the SMTP Server from web.config
			string smtp = AppConfig.GetFirstConfigValue("SMTP.Server");
			if (smtp != string.Empty || smtp!= "")
				lblSMTPServerValue.Text = smtp;
			else
				lblSMTPServerValue.Text = ResourceManager.GetPhrase("SMTPServerNotFount","*SMTP server not found");

		}

		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new EventHandler(this.Page_Load);

		}
</script>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellpadding="5" cellspacing="0" width="100%" border="0">
	<tr>
		<td class="StandardPanel">
			<table cellpadding="3" cellspacing="0" border="0" width="100%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td class="PanelTitle" nowrap>System Information</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellspacing="1" cellpadding="3" border="0" width="100%">
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblImisVersion" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblImisVersionValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblNetFrameworkVersion" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblNetFrameworkVersionValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblDbServer" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblDbServerValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblDatabase" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblDatabaseValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblWebServerPath" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblWebServerPathValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblURL" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblURLValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblSMTPServer" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblSMTPServerValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblCrystalVersion" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblCrystalVersionValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblWebServerCrystalPath" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblWebServerCrystalPathValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblImisNetPrinter" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblImisNetPrinterValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblActiveUser" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblActiveUserValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblLoginTimeout" runat="server"></asp:label></td>
								<td class="PanelTableValue" nowrap><asp:label id="lblLoginTimeoutValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
							<tr>
								<td class="PanelTablePrompt" nowrap width="165"><asp:label id="lblWorkflowService" runat="server"></asp:label></td>
								<td class="PanelTableValue"><asp:label id="lblWorkflowServiceValue" runat="server"></asp:label>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
