<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EngagementScoreDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.EngagementScoreDisplay.EngagementScoreDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="tracker" TagName="ProgressTracker" Src="..\..\Common\ProgressTracker\ProgressTrackerDisplay.ascx" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <tracker:ProgressTracker runat="server" ID="ProgressTracker1"/>
    <div runat="server" id="DonutChartBox">
        <div id="DonutChart" runat="server" ></div>
    </div>
    <asp:Panel runat="server" id="DonutSubCaption" class="donut-sub-caption" Visible="False" />
</asp:Panel>
