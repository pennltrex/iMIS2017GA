<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BSA.DocumentSummaryDefault" Codebehind="DocumentSummaryDefault.ascx.cs" %>
<%@ Import Namespace="Asi" %>
<style>.PanelBody{padding:5px;}</style>
<asiweb:PanelTemplateControl ID="SummaryDefaultPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none"> 
    <asp:label id="DocumentTypeCode" Runat="server" AssociatedControlID="DocumentStatusCode" />
    <asp:label id="AlternateName" Runat="server"/> (<asp:label id="DocumentStatusCode" Runat="server"/>)
   
    <br/>
    <asp:label id="UpdatedByUserLabel" Runat="server" AssociatedControlID="UpdatedByUser">Updated by:</asp:label>
    <asp:label id="UpdatedByUser" Runat="server"/> <asp:label id="Label1" Runat="server"> on </asp:label> <asp:label id="UpdatedOn" Runat="server"/>
        
    <br/>      
    <asp:label id="DescriptionLabel" Runat="server" AssociatedControlID="Description">Description:</asp:label>
    <asp:label id="Description" Runat="server"/>
</asiweb:PanelTemplateControl>