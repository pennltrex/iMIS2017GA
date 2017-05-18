<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Tag Group Properties" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="asiweb" TagName="TagGroup" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/TagGroupProperties.ascx" %>
<script runat="server">

    public override void CommandButtonRequisites(Asi.Web.UI.CommandButtonRequisiteArgs e)
    {
        base.CommandButtonRequisites(e);

        e.SetNeed(Asi.Web.UI.CommandButtonType.Ok);
    }
        
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(TagGroupProperties);
    }

</script>

<asp:Content ID="Content3" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <div style="text-align:center; width:100%; margin-top:20px;">
        <asiweb:TagGroup ID="TagGroupProperties" runat="server"></asiweb:TagGroup>
    </div>
</asp:Content>