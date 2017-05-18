<%@ Page language="c#"  Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="uc1" TagName="List" Src="~/AsiCommon/Controls/OpportunityManagement/AllOppTaskList.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:List id="List1" runat="server"/>
</asp:Content>
