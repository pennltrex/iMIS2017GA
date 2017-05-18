<%@ Page Language="C#" Inherits="Asi.Web.UI.ContentManagement.UserDefinedFieldEdit" MasterPageFile="~/Templates/MasterPages/empty.master" Title="User Defined Field Properties" Codebehind="UserDefinedFieldEdit.aspx.cs" %>
<%@ Register TagPrefix="udfedit" TagName="UserDefinedFieldEditor" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/UserDefinedFieldEdit.ascx" %>
<asp:Content id="Content1" runat="server" ContentPlaceholderId="TemplateBody">
    <udfedit:UserDefinedFieldEditor ID="UDFEditor" runat="server" UseParentAtomObject="true" />
</asp:Content>