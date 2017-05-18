<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="asiweb" TagName="AnalyzeEnrolleeProgress" Src="~/AsiCommon/Controls/CertificationManagement/AnalyzeEnrolleeList.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:AnalyzeEnrolleeProgress ID="ProgressList" runat="server" />
</asp:Content>