<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" CodeBehind="ReportDisplay.aspx.cs" Inherits="Asi.WebAppRoot.AsiCommon.Controls.BSA.ReportDisplay" %>
<%@ Register TagPrefix="asi" TagName="ReportDisplay" Src="~/iParts/Common/ReportDisplay/ReportDisplay.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" ShowHeader="false" BorderWidth="0">
        <asi:ReportDisplay runat="server" id="ReportDisplayInstance" ShowPDFButton="true" ShowExcelButton="true" />
    </asiweb:PanelTemplateControl>
</asp:Content>

