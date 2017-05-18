<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgramRegisterConfirmation" Codebehind="CertificationProgramRegisterConfirmation.ascx.cs" %>

<script type="text/javascript">
function resize(width, height){
    
    var dialogWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
    var viewWidth = GetViewportWidth();
    var viewHeight = GetViewportHeight();
    if (width != null && width > viewWidth) width = viewWidth;
    if (height != null && height > viewHeight) height = viewHeight;
    dialogWindow.SetSize(width, height);
}
</script>

<asiweb:PanelTemplateControl ID="CertificationProgramRegisterConfirmationPanel" runat="server" Collapsible="False" BorderStyle="None">
    <div class="ContentBlockPrimary">
        <asiweb:StyledLabel id="lblConfirmationLegend" runat="server" />
    </div>    
    <div class="CommandBar" style="width:98%;position:absolute;bottom:10px;">
        <asiweb:StyledButton ID="btnContinue" runat="server" OnClick="btnContinue_Click" />    
    </div>
</asiweb:PanelTemplateControl>