<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotificationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.Notification.NotificationDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:HiddenField ID="NoAlertMessageHiddenField" runat="server" />

<div id="AlertContainer" runat="server"></div>

<%-- Save for later event alerts
    <telerik:RadNotification runat="server" ID="RadNotification" Width="300px" Height="300px"
    EnableRoundedCorners="false" EnableShadow="false" VisibleTitlebar="false" Position="BottomRight"
    ShowTitleMenu="false" ShowCloseButton="false" Skin="Silk"
    OffsetX="-10" OffsetY="-10" Animation="Slide" AnimationDuration="100" AutoCloseDelay="9000" 
    KeepOnMouseOver="true" VisibleOnPageLoad="true" Overlay="true"
    WebMethodPath="NotificationWebService.asmx" WebMethodName="GetNotification" 
    LoadContentOn="EveryShow">     
</telerik:RadNotification> 
<span onmouseover="CallClientShow()">Show Notification</span>
<script id="Script" type="text/javascript">
    function CallClientShow() {
        var notification = $find("<%#RadNotification.ClientID %>");
        notification.show();
    }
</script>--%>