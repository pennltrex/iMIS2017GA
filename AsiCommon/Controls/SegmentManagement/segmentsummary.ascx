<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentSummary" Codebehind="SegmentSummary.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" Collapsible="false">
    <asiweb:PanelTemplateColumn runat="server" ID="SegmentLeftCol">
        <asiweb:StyledLabel ID="Name" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="Description" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="QueryName" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="LastEditor" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="Status" runat="server" RenderPanelField="true" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn runat="server" ID="SegmentRightCol">
        <asiweb:StyledLabel ID="LastRunDate" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="LastRunUser" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="CreatedDate" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="CreatedBy" runat="server" RenderPanelField="true" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>






