<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayEnrollmentsConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayEnrollments.AutoPayEnrollmentsConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<script id="SelectDocument" type="text/javascript">
    function EnableDisableNoEnrollmentMessage() {
        var searchCheckBox = $get("<%#HideGridIfNoEnrollmentsCheckBox.ClientID%>_CheckBoxSet");
        var searchLabelTextBox = $get("<%#TxtNoEnrollmentsMessage.ClientID%>_TextField");
        if (searchCheckBox != null && searchCheckBox.checked) {
            searchLabelTextBox.disabled = true;
        }
        else {
            searchLabelTextBox.disabled = false;
        }
    }
</script>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">      
        <asiweb:SmartControl runat="server" ID="EnrollmentTypeDisplayed" BoundPropertyName="EnrollmentTypeDisplayed" DisplayCaption="True" 
            PositionCaption="Left"></asiweb:SmartControl> 
        <asiweb:SmartControl runat="server" ID="DisplayCancelledEnrollmentsCheckBox" BoundPropertyName="DisplayCancelledEnrollments" DisplayCaption="True" 
            PositionCaption="Right"></asiweb:SmartControl> 
        <asiweb:SmartControl runat="server" ID="HideGridIfNoEnrollmentsCheckBox" BoundPropertyName="HideGridIfNoEnrollments" DisplayCaption="True" 
            PositionCaption="Right" OnClientClick="EnableDisableNoEnrollmentMessage()"></asiweb:SmartControl>
        <asiweb:SmartControl runat="server" ID="TxtNoEnrollmentsMessage" BoundPropertyName="NoEnrollmentsMessage" DisplayCaption="True" 
            PositionCaption="Left" CssClass="AutoWidth"></asiweb:SmartControl> 
</asiweb:PanelTemplateControl>     


 