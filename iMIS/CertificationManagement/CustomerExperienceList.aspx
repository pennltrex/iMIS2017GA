<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Import Namespace="Asi.Web.UI"%>
<%@ Import Namespace="Asi.Bae.Web.Customer.AccountManagement.CertificationManagement"%>
<%@ Register TagPrefix="asiweb" TagName="CustomerExperienceList" Src="~/Core/AccountManagement/CertificationManagement/CustomerExperienceList.ascx" %>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(customerExperienceList))
        {
            AddChildUserControl(customerExperienceList);
        }
    }

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:CustomerExperienceList ID="customerExperienceList" runat="server" />
</asp:Content>

