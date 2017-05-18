<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Process Manager" %>
<%@ Register TagPrefix="uc1" TagName="Opportunity" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityList.ascx" %>

<script runat="server" language="C#">
    /// <summary>
    /// 
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get
        {
            return false;
        }
    }
</script>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<uc1:Opportunity id="Opportunity" runat="server"></uc1:Opportunity>
</asp:Content>
