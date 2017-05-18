<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Register TagPrefix="bsa" TagName="Versions" Src="~/AsiCommon/Controls/BSA/documentversions.ascx" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AddChildUserControl(Versions1);
    }
</script>
<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<bsa:Versions id="Versions1" Runat="server" />
</asp:Content>
