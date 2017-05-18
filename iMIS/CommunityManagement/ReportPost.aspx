<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_CommunityManagement_ReportPost" Title="Report Inappropriate Content" Codebehind="ReportPost.aspx.cs" %>

<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:PanelTemplateControl ID="EmailPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        <asiweb:SmartControl ID="TitleControl" runat="server" BoundPropertyName="Title" DisplayCaption="true" PositionCaption="Left" DisplayType="ReadOnlyField" UseParentControlBusinessItem="false" OnNeedBoundAtom="TitleControl_NeedBoundAtom" />
        <div class="PanelField Left">
            <asp:Label ID="ExplanationLabel" runat="server" AssociatedControlID="Explanation" Text="Explanation"></asp:Label>
            <div class="PanelFieldValue">
                <asp:TextBox ID="Explanation" runat="server" TextMode="MultiLine" Rows="15" Columns="40" CssClass="InputXXLarge"></asp:TextBox>
            </div>
        </div>
    </asiweb:PanelTemplateControl>
</asp:Content>