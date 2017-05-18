<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>

<%@ Register TagPrefix="asiweb" TagName="ShowRegistrationsToCancel" Src="~/AsiCommon/Controls/CertificationManagement/ShowRegistrationsToCancel.ascx" %>


<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:ShowRegistrationsToCancel ID="ShowRegistrationsToCancel" runat="server" />
</asp:Content>
