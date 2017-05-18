<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi.Web.UI"%>
<%@ Import namespace="Asi.Business.Contact"%>
<%@ Import namespace="Asi.Business.Common"%>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        // Redirect to the Certification History page 
        var url = new StringBuilder("~/iMIS/CertificationManagement/CertificationProgramHistory.aspx");
        var parameters = HttpUtility.ParseQueryString("");
        
        //PMB - making sure we grab the contactmaster key and convert it to the imis ID param we need for the selected imis contact code to work
        var selectedImisId = Request.QueryString["ContactMaster"];
        if(!string.IsNullOrEmpty(selectedImisId))
            parameters.Add("ID",selectedImisId);
    
        //add parameters to URL
        url.Append("?");
        url.Append(parameters.ToString());
        Response.Redirect(ResolveUrl(url.ToString()));
        
    }
</script>

