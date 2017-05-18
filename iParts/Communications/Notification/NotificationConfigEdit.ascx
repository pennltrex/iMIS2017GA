<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotificationConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Communications.Notification.NotificationConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<div class="PanelField Left Top">
    <div style="display:inline;">
        <asiweb:StyledLabel ID="NotificationSetLabel" runat="server" CssClass="Label" />
    </div>
    <div class="PanelFieldValue AutoWidth">   
        <telerik:RadListBox runat="server" ID="AvailableAlertSets" Height="165px" Width="350px"
            AllowTransfer="true" 
            AllowTransferOnDoubleClick="true"
            EnableDragAndDrop="true"  
            TransferToID="SelectedAlertSets"
            Sort="Ascending">
            <HeaderTemplate>
                Available
            </HeaderTemplate>    
        </telerik:RadListBox>
        <telerik:RadListBox runat="server" ID="SelectedAlertSets" Height="165px" Width="350px"
            AllowReorder="true" 
            AllowTransferOnDoubleClick="true"
            EnableDragAndDrop="true">
            <HeaderTemplate>
                Selected
            </HeaderTemplate>      
        </telerik:RadListBox>
    </div>
</div>

<asiweb:SmartControl runat="server" ID="HideWhenEmpty"
    BoundPropertyName="HideWhenEmpty" DisplayCaption="true" AutoPostBack="false"
    PositionCaption="Right" DataSaveUponStateChange="false" OnClientClick="ResetFieldState()" />
<div class="SubItems">
    <div class="InputXLargeWrapper">
        <asiweb:SmartControl ID="NoAlertMessage" runat="server" BoundPropertyName="NoAlertMessage" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
    </div>
</div>

<script id="Script1" type="text/javascript">
    //<![CDATA[
    ResetFieldState();
    function ResetFieldState() {      
        var chkBox = $get("<%#HideWhenEmpty.ClientID%>_CheckBoxSet");
        var message = $get("<%#NoAlertMessage.ClientID%>_TextField");
        if (chkBox.checked) {
            message.disable = true;
            message.enable = false;
            message.setAttribute("disabled", true);
            message.value = "";
        } else {
            message.disable = false;
            message.enable = true;
            message.setAttribute("disabled", false);
            message.removeAttribute("disabled", 0);
        }
    }
    //]]>
</script>
   
 