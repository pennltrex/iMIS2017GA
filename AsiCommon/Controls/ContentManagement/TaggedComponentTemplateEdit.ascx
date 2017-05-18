<%@ Control Language="C#" Inherits="Asi.Web.UI.Common.ContentManagement.TaggedComponentTemplateEdit" Codebehind="TaggedComponentTemplateEdit.ascx.cs" %>
<%@ Reference Control="~/AsiCommon/Controls/AtomPainter2/AtomPanelEditor.ascx" %>
<%@ Register TagPrefix="asi" TagName="AtomPanelEditor" Src="~/AsiCommon/Controls/AtomPainter2/AtomPanelEditor.ascx" %>

<asiweb:PanelTemplateControl2 ID="Panel1" runat="server" ShowHeader="false" FieldSet="true" BorderStyle="None">   
    <asiweb:SmartControl ID="TemplateName" runat="server" BoundPropertyName="Name" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper" ></asiweb:SmartControl>   
</asiweb:PanelTemplateControl2>

<asi:AtomPanelEditor runat="server" ID="AtomPanelEditor1" HidePropertiesPanel="true" ReadOnlyControls="true" ></asi:AtomPanelEditor>

<asiweb:PanelTemplateControl2 ID="PreviewPanel" runat="server" Visible="false" Text="Tagged list format preview" Collapsible="false" RoundedCorners="false">
    <asp:Literal ID="ReadOnlyLiteral" runat="server"></asp:Literal>
</asiweb:PanelTemplateControl2>