<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Printer List" %>
<%@ Register TagPrefix="uc1" TagName="PrinterList" Src="PrinterList.ascx" %>

<asp:Content id="PrinterListContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<uc1:PrinterList id="ThePrinterList" runat="server"></uc1:PrinterList>
</asp:Content>
