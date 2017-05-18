<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.Slideshow.SlideshowConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" Assembly="Asi.Web" %>
<%@ Register Namespace="Telerik.Web.UI" TagPrefix="telerik" Assembly="Telerik.Web.UI" %>

<asiweb:SmartControl ID="AutoRotate" runat="server" BoundPropertyName="AutoRotate" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" OnClientClick="EnableDisableEdit()"/> 
<div class="SubItems AutoWidth">
    <asiweb:SmartControl BoundPropertyName="SecondsPerSlide" DataSaveUponStateChange="false" DisplayCaption="true" ID="SecondsPerSlide" InputFieldCssClass="InputSmallWrapper" 
        PositionCaption="Left" runat="server" ValidatorDisplay="Dynamic" MinValue="3" MaxValue="60" /> 
</div>
<asiweb:SmartControl BoundPropertyName="SliderHeight" DataSaveUponStateChange="false" DisplayCaption="true" ID="SliderHeight" InputFieldCssClass="InputSmallWrapper" 
    PositionCaption="Left" runat="server"  ValidatorDisplay="Dynamic" MinValue="100" MaxValue="1200" /> 
<asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate>                         
        <telerik:RadTabStrip runat="server" ID="radTab" AutoPostBack="false" SelectedIndex="0" MultiPageID="radPage" CausesValidation="true" 
            EnableViewState="true" ShowBaseLine="true" OnTabClick="TabsTabClick">
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="radPage" runat="server" SelectedIndex="0" EnableViewState="true" CssClass="ContentTabbedDisplay"></telerik:RadMultiPage>             
        <div style="clear: both;"></div>   
    </ContentTemplate>
</asp:UpdatePanel>  
<script type="text/javascript">
    //<![CDATA[
    EnableDisableEdit();
    function EnableDisableEdit() {
        var autoRotateCheckBox = $get("<%#AutoRotate.ClientID%>_CheckBoxSet");
        var secondsPerSlide = $get("<%#SecondsPerSlide.ClientID%>_Number");
        var secondsPerSlideCaption = $get("<%#SecondsPerSlide.ClientID%>_Caption");
        secondsPerSlide.disabled = true;
        secondsPerSlideCaption.disabled = true;
        secondsPerSlideCaption.setAttribute("disabled", true);
        if (autoRotateCheckBox != null && autoRotateCheckBox.checked) {           
            secondsPerSlide.disabled = false;
            secondsPerSlideCaption.disabled = false;
            secondsPerSlideCaption.removeAttribute("disabled");
        }
    }
    //]]>            
</script> 