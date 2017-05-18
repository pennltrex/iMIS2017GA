<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataShowcaseDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Common.DataShowcase.DataShowcaseDisplay" %>

<div runat="server" id="DivDataSourceErrors" visible="False" class="AsiValidation Section">
    <strong>Data Source Errors Detected</strong>
    <br />The following data source errors have been detected.<br />
    <asp:Literal runat="server" ID="DataSourceErrorsLiteral"></asp:Literal>
    <asp:Label runat="Server" ID="DataSourceErrorsExtraInfo">
        These data sources could not be evaluated and are not available for resolving placeholders.
        This will result in "no such data source" errors displaying in the content below wherever the
        data source is used. In the published content these placeholders will be blank.
    </asp:Label>
</div>
<div>
    <asp:Literal runat="server" ID="ContentLiteral"></asp:Literal>
</div>