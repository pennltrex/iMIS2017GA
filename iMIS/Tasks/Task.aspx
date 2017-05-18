<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Task" %>
<%@ Register TagPrefix="uc1" TagName="Task" Src="~/AsiCommon/Controls/Shared/TaskViewer/TaskDefinition.ascx" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AddChildUserControl(Task1);
    }

</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<uc1:Task id="Task1" runat="server"></uc1:Task>	
</asp:Content>
