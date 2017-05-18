<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Action Plan Editor - Process Manager" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="asi" TagName="ActionPlanEditor" Src="~/AsiCommon/Controls/OpportunityManagement/SetupActionPlanEditor.ascx" %>

<script runat="server" language="C#">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        ChildUserControls.Add(ActionPlanEditorControl);
    }
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asi:ActionPlanEditor ID="ActionPlanEditorControl" runat="server" />
</asp:Content>

