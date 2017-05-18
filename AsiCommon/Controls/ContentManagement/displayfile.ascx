<%@ Control language="c#" Inherits="Asi.Web.UI.Common.ContentManagement.DisplayFile" Codebehind="DisplayFile.ascx.cs" %>
<div class="DisplayFile">
    <asp:LinkButton ID="FileLink" runat="server" OnClick="FileLink_Click" CausesValidation="False"/>
    <asp:Literal ID="DescriptionControl" runat="server" Visible="false"></asp:Literal>
</div>