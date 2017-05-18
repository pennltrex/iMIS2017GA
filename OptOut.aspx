<%@ Page Language="C#" AutoEventWireup="true" Inherits="iMIS_ContentManagement_OptOut" Codebehind="OptOut.aspx.cs" %>
<%@ Register TagName="OptOut" TagPrefix="Campaign" Src="~/AsiCommon/Controls/CampaignManagement/OptOut.ascx"%>
<asp:Content ID="MainContent" ContentPlaceHolderID="TemplateBody" runat="server">
<Campaign:OptOut runat="server" />
</asp:Content>