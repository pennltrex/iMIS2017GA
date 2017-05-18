<%@ Page language="c#" enableViewState="false" buffer="false" Inherits="Asi.WebRoot.iMIS.Utility.QueryExport" Codebehind="QueryExport.aspx.cs" %>

<SCRIPT runat="server" language="C#">

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			this.Load += new System.EventHandler(this.Page_Load);
		}

		void Page_Load(object sender, System.EventArgs e)
		{
			Asi.Parameters.CommonParameterCollection parameters = null;
			Guid key = Guid.Empty;
			Asi.QueryBuilder.QueryExportFormat queryFormat;
			string contentType;
			string exportFormat = Request.Params["ExportFormat"];
			string exportName = Request.Params["ExportName"];
			string extension;
			string queryKey = Request.Params["QueryKey"];
			string queryParams = Request.Params["QueryParams"];

			switch(exportFormat)
			{
				case "comma":
					contentType = "text/plain";
					extension = ".csv";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.CommaDelimitedText;
					break;
				case "tab":
					contentType = "text/plain";
					extension = ".tab";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.TabDelimitedText;
					break;
				case "html":
					contentType = "text/html";
					extension = ".html";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.Html;
					break;
				case "excel":
					contentType = "text/html";
					extension = ".xls";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.MicrosoftExcel;
					break;
				case "word":
					contentType = "text/html";
					extension = ".doc";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.MicrosoftWord;
					break;
				case "xml":
					contentType = "text/xml";
					extension = ".xml";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.Xml;
					break;
				default:
					contentType = "text/plain";
					extension = ".csv";
					queryFormat = Asi.QueryBuilder.QueryExportFormat.CommaDelimitedText;
					break;
			}

			if(exportName == null || exportName.Length == 0)
			{
				exportName = Asi.ResourceManager.GetWord("Export");
			}

			if(queryKey != null && queryKey.Length > 0)
			{
				key = new Guid(queryKey);
			}

			if(queryParams != null && queryParams.Length > 0)
			{
				byte[] buffer = Convert.FromBase64String(queryParams);
				System.Runtime.Serialization.Formatters.Binary.BinaryFormatter formatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
				using(System.IO.MemoryStream stream = new System.IO.MemoryStream(buffer))
				{
					parameters = formatter.Deserialize(stream) as Asi.Parameters.CommonParameterCollection;
				}
			}

			if(key != Guid.Empty)
			{
				Response.Clear();
				Response.ContentType = contentType;
				Response.AppendHeader("content-disposition", "attachment; filename=" + exportName + extension);
				Asi.QueryBuilder.QueryUtility.ExportQueryResults(key, parameters, queryFormat, Response.OutputStream);
			}

		}

</SCRIPT>