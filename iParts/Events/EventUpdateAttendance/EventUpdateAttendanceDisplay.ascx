<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventUpdateAttendanceDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.EventUpdateAttendance.EventUpdateAttendanceDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl2 ID="UpdateAttendanceTemplateControl" runat="server" Collapsible="false" ShowBorder="false" 
    ShowHeader="True" CssClass="PanelNoPadding">
    <asiweb:StyledButton ID="UpdateAttendanceStyledButton" runat="server" OnClick="UpdateAttendanceStyledButton_OnClick" CssClass="TextButton" />
</asiweb:PanelTemplateControl2>
