<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Tagged List Format" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagName="TCTEditControl" TagPrefix="asi" Src="~/AsiCommon/Controls/ContentManagement/TaggedComponentTemplateEdit.ascx" %>

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
    /// <summary>
    /// 
    /// </summary>
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(TCTEditControl1);
    }
</script>

<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asi:TCTEditControl ID="TCTEditControl1" runat="server" />
</asp:Content>

