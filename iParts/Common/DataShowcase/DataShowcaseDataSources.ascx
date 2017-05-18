<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataShowcaseDataSources.ascx.cs"
    Inherits="Asi.Web.iParts.Common.DataShowcase.DataShowcaseDataSources" %>
<div runat="server" id="DivDataSources">
</div>
<asp:CustomValidator runat="server" ID="CVDataSources" OnServerValidate="CVDataSources_OnServerValidate" Display="Dynamic" CssClass="Important"></asp:CustomValidator>
<div>
<asp:LinkButton runat="server" ID="AddLink" OnClick="AddLink_OnClick">Add another data source</asp:LinkButton>
</div>
