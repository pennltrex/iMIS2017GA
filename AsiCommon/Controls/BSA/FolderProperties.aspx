<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.BSA.FolderProperties" MasterPageFile="~/Templates/MasterPages/empty.master" Codebehind="FolderProperties.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="Panel1" runat="server" BorderStyle="None" Collapsible="false" >
        <asiweb:PanelTemplateControl2 ID="FolderPropertiesPanel" runat="server" FieldSet="true" TemplateTitle="Properties" BorderStyle="None" Collapsible="false">
            <div class="PanelField">
                <asp:label id="FolderNameLabel" runat="server" Text="Folder Name" AssociatedControlID="FolderName" CssClass="Required"/>
                <div class="PanelFieldValue">
                    <asp:textbox id="FolderName" runat="server" CssClass="WideTextBox"></asp:textbox>
                    <asp:RequiredFieldValidator ID="FolderRequiredFieldValidator" runat="server" ControlToValidate="FolderName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="FolderInvalidCharacterValidator" runat="server" ControlToValidate="FolderName" ValidationExpression='^([^\\/:\*\?\"<>\|$]+)$'></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="PanelField Top">
                <%--<asp:label id="AllowedTypeLabel" runat="server" Text="Only allow certain types of objects in the folder?" AssociatedControlID="AllowTypeFilter" />--%>
                <div class="AutoWidth FloatNone">
                    <asp:RadioButtonList ID="AllowTypeFilter" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                        <asp:ListItem Text="Allow any type of object in this folder" Value="0" Selected="true" />
                        <asp:ListItem Text="Allow only the following types of objects in this folder (select all that apply)" Value="1" />
                    </asp:RadioButtonList>
                </div>
                <div style="padding-top:10px;margin-left:20px;">
                    <asp:listbox id="AllowedTypes" Runat="server" Rows="8" SelectionMode="Multiple"></asp:listbox>
                </div>
            </div>
        </asiweb:PanelTemplateControl2>
        <asi:AccessSettings ID="AccessSettingsControl" runat="server" />
    </asiweb:PanelTemplateControl2>
</asp:Content>