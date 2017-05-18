<%@ Page Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentChangeRequestEdit" MasterPageFile="~/Templates/MasterPages/empty.master" Codebehind="ContentChangeRequestEdit.aspx.cs" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="ChangeRequestPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        <asiweb:SmartControl ID="AssignedTo" runat="server" BoundPropertyName="AssignedToUserName" DisplayCaption="true" />
        <asiweb:SmartControl ID="AssignedBy" runat="server" BoundPropertyName="AssignedByUserName" DisplayCaption="true" Visible="false" />
        <asiweb:SmartControl ID="RequestDate" runat="server" BoundPropertyName="RequestDateTime" DisplayCaption="true" Visible="false" ReadOnly="true" />
        <asiweb:SmartControl ID="ContentTitle" runat="server" BoundPropertyName="ContentTitle" DisplayCaption="true" />
        <asiweb:SmartControl ID="RequestText" runat="server" BoundPropertyName="RequestText" DisplayCaption="true" PositionCaption="Top" />
    </asiweb:PanelTemplateControl>
</asp:Content>
