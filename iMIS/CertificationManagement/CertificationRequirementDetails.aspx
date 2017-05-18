<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="RequirementDetails" Src="~/AsiCommon/Controls/CertificationManagement/CertificationRequirementDetails.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:RequirementDetails ID="certificationRequirementDetails" runat="server" />
</asp:Content>