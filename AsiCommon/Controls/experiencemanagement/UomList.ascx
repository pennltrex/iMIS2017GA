<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.UserControlBase" %>
<script runat="server">

    /// <summary>
    /// Overrides the base OnInit method to hook events handlers.
    /// </summary>
    /// <param name="e">The event arguments.</param>
    protected override void OnInit(EventArgs e)
    {
        lstUoms.AddButtonText = GetTranslatedPhrase("Add new unit type");
    }

</script>
<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="Unit types" ShowHeader="True" Collapsible="false" BorderStyle="None">

    <asiweb:Lister2 
        ID="lstUoms"
        runat="server"
        AjaxEnabled="false"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/UomListerQuery/Default"
        DeleteColumnLocation="None"
        AddButtonLocation="TopRight"
        TargetUrl="~/iMIS/ExperienceManagement/UomEdit.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        CollapsiblePanelTemplate="false"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
        />

</asiweb:PanelTemplateControl2>