<%@ Control language="c#" EnableViewState="false" Inherits="Asi.Web.UI.Common.BSA.DocumentSummaryShortcut" Codebehind="DocumentSummaryShortcut.ascx.cs" %>
<style>.PanelBody{padding:5px;}</style>
<asiweb:PanelTemplateControl ID="ShortcutSummaryPanel" runat="server" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
    <asp:label id="DocumentTypeCode" Runat="server" AssociatedControlID="AlternateName"/>
    <asp:label id="AlternateName" Runat="server"/>    
    (<asp:label id="DocumentStatusCode" Runat="server"/>)   
    <br/>   
    <asp:label id="CreatedByUserLabel" Runat="server" AssociatedControlID="CreatedByUser">Created by:</asp:label>
    <asp:label id="CreatedByUser" Runat="server"/> on <asp:label id="CreatedOn" Runat="server"/>
    <br/>     
    <asp:label id="UpdatedByUserLabel" Runat="server" AssociatedControlID="UpdatedByUser">Updated by:</asp:label>
    <asp:label id="UpdatedByUser" Runat="server"/> on <asp:label id="UpdatedOn" Runat="server"/>    
    <br/>
    <asp:label id="DescriptionLabel" Runat="server" AssociatedControlID="Description">Description:</asp:label>
    <asp:label id="Description" Runat="server"/>  
</asiweb:PanelTemplateControl>