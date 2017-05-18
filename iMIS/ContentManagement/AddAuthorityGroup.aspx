<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="cag" TagName="AddAuthorityGroup" Src="~/AsiCommon/Controls/ContentManagement/AddAuthorityGroup.ascx" %>

<script runat="server">
    protected override void EnsureChildUserControls()
    {
        AddChildUserControl(AddAuthorityGroup1);       
        
    }
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <cag:AddAuthorityGroup id="AddAuthorityGroup1" runat="server"/>
</asp:Content>