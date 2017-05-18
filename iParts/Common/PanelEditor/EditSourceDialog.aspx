<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSourceDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.EditSourceDialog" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">
<asiweb:PanelTemplateControl2 ID="designerPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
        <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelSourceName" AssociatedControlID="TextBoxSourceName"></asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="TextBoxSourceName" CssClass="InputLarge"></asiweb:BusinessTextBox>
        </div>
    </div>
</asiweb:PanelTemplateControl2>
</asp:Content>