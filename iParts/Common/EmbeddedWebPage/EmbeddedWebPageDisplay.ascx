<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmbeddedWebPageDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.EmbeddedWebPage.EmbeddedWebPageDisplay" %>

<asp:Panel runat="server" ID="ContentPanel">
    <div ID="MessageDiv" runat="server" Visible="False">
        <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
        <a id="MessageLink" runat="server"></a>
    </div>
    <iframe runat="server" id="MapContainer" class="EmbeddedWebPage">
        <%--iFrame source/content added dynamically--%>
        No content. Your browser does not support Frames.
    </iframe>
</asp:Panel>

