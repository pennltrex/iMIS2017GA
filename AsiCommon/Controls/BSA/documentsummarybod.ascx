<%@ Control language="c#" EnableViewState="false" Inherits="Asi.Web.UI.Common.BSA.DocumentSummaryBOD" Codebehind="DocumentSummaryBOD.ascx.cs" %>
<style>.PanelBody{padding:5px;}</style>
<asiweb:paneltemplatecontrol id="ObjectDefinitionTemplate" runat="server" Collapsible="false" FieldSet="true" BorderStyle="none" ShowHeader="false">
    <asp:label id="DocumentTypeCode" Runat="server" AssociatedControlID="RootName" />:
    <asp:label id="RootName" Runat="server"/> (<asp:label id="DocumentStatusCode" Runat="server"/>)
    <br/>
    <asp:label id="UpdatedByUserLabel" Runat="server" AssociatedControlID="UpdatedByUser">Updated by:</asp:label>
    <asp:label id="UpdatedByUser" Runat="server"/> on <asp:label id="UpdatedOn" Runat="server"/>       
    <br/> 
    <asp:label id="BranchesLabel" Runat="server" AssociatedControlID="Branches">Branches:</asp:label>	    
    <asp:placeholder id="Branches" Runat="server"/>	    
    <br/>
    <asp:Label ID="LabelDescription" runat="server" AssociatedControlID="Description">Description:</asp:Label>
    <asp:label id="Description" Runat="server" /> 
</asiweb:paneltemplatecontrol>