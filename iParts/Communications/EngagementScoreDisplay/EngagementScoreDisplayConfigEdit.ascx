<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EngagementScoreDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Communications.EngagementScoreDisplay.EngagementScoreDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate>            
        <asiweb:PanelTemplateControl2 ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        <div class="AutoWidth">
            <asiweb:SmartControl BoundPropertyName="DisplayForAuthorizedUsersOnly" DataSaveUponStateChange="false" DisplayCaption="true" ID="DisplayForAuthorizedUsersOnly" PositionCaption="Right" runat="server" />         
        </div> 
        <div class="PanelField Left">
            <asiweb:SmartControl BoundPropertyName="EngagementScoreKey" DataSaveUponStateChange="false" DisplayCaption="true" ID="FormulaControl" runat="server" />
            <asiweb:SmartControl AutoPostBack="true" BoundPropertyName="ChartType" DataSaveUponStateChange="true" DisplayCaption="true" EnableAjaxPostback="True" ID="ChartTypeControl" OnDataChange="ChartTypeControl_OnDataChange" runat="server" />
            <div class="PanelField Left SubItems">
                <asiweb:SmartControl BoundPropertyName="DonutChartSize" DataSaveUponStateChange="false" DisplayCaption="true" ID="DonutChartSizeControl" runat="server" ShowNullItem="false" />
            </div>
            <asiweb:SmartControl BoundPropertyName="ScoreDisplay" DataSaveUponStateChange="false" DisplayCaption="true" ID="ScoreDisplayControl" runat="server" />
            <asiweb:SmartControl BoundPropertyName="Caption" CssClass="InputXLargeWrapper" DataSaveUponStateChange="false" DisplayCaption="true" ID="CaptionControl" runat="server" />
            <asiweb:SmartControl BoundPropertyName="DisplayCategory" DataSaveUponStateChange="false" DisplayCaption="true" ID="CategoryControl" runat="server" />
        </div>   
        </asiweb:PanelTemplateControl2>
    </ContentTemplate>
</asp:UpdatePanel>