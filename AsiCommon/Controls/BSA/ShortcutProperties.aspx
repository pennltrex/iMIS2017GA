<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_BSA_ShortcutProperties" Title="Shortcut" Codebehind="ShortcutProperties.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:PanelTemplateControl ID="ShortcutPropertiesPanel" runat="server" TemplateTitle="Properties" FieldSet="true">
        <asiweb:SmartControl ID="DocumentName" runat="server" BoundPropertyName="Name" 
            DisplayType="EditableField" DisplayCaption="true" />
        <asiweb:SmartControl ID="Target" runat="server" BoundPropertyName="RelatedDocumentPath" 
            DisplayType="EditableField" DisplayCaption="true" />
    </asiweb:PanelTemplateControl>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateButtonBar" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SideBarPlaceHolder" Runat="Server">
</asp:Content>

