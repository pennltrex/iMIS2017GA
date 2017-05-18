<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinksConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.QuickLinks.QuickLinksConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<telerik:RadDialogOpener runat="server" id="DialogOpener1" />

<div id="ImageManagerDiv" style="white-space:nowrap;display:inline-block;" class="PanelField Left">        
    <div style="display:inline">
        <asiweb:StyledLabel runat="server" ID="PanelImage" Text="Panel image" AssociatedControlID="ImageUrlInput"></asiweb:StyledLabel>             
    </div>
    <div class="PanelFieldValue">                          
        <asiweb:SmartControl ID="ImageUrlInput" runat="server" OnClientChange="EnableDisableEdit()" OnClientBlur="EnableDisableEdit()" 
            BoundPropertyName="ImageUrl" DisplayCaption="false" PositionCaption="Left" DisableDefaultCssClass="True" InputFieldCssClass="InputXLargeWrapper" />            
    </div>
    <a href="#" onclick="LaunchImageManager()" style="margin-left:.7em;">select</a>                               
</div>
  
<div class="SubItems"> 
    <asiweb:SmartControl ID="AltText" runat="server" BoundPropertyName="AltText" DisplayCaption="true" InputFieldCssClass="InputMediumWrapper" /> 
</div>  

<asiweb:SmartControl ID="NavigationDocumentPathInput" runat="server" 
    BoundPropertyName="NavigationDocumentPath" DisplayCaption="true" AutoPostBack="True" InputFieldCssClass="InputXLargeWrapper" />  

<script type="text/javascript">
    //<![CDATA[
    function LaunchImageManager() {
        $find("<%#DialogOpener1.ClientID%>").open('ImageManager', { CssClasses: [] }); return false;
    }
    function ImageManagerFunction(sender, args) {
        //If no file selected
        if (!args) {
            return false;
        }
        var webRoot = gWebRoot;
        var selectedItem = args.get_value();
        var txt = document.getElementById("<%#ImageUrlInput.ClientID%>_TextField");
        //Image manager gets handled differently for IE
        if ($telerik.isIE) {
            var path = selectedItem[0].outerHTML.replace('<img src="', '').replace('">', '').toLowerCase(); //this is the selected IMG tag element
            if (path.toLowerCase().indexOf("http") == -1) {
                txt.value = path.replace(webRoot, '~');
            } else {
                txt.value = path;
            }
            //Desktop sometimes need more cleanup
            if (txt.value.toLowerCase().indexOf('<img src="') > -1)
                txt.value = txt.value.replace('<img src="', '').replace('">', '');
        } else {
            var path = args.value[0].getAttribute("src", 2).toLowerCase();
            if (path.toLowerCase().indexOf("http") == -1) {
                txt.value = path.replace(webRoot, '~');
            } else {
                txt.value = path;
            }
        }
        EnableDisableEdit();
        return true;
    }

    EnableDisableEdit();
    function EnableDisableEdit() {
        var imageUrlField = $get("<%#ImageUrlInput.ClientID%>_TextField");
        var altText = $get("<%#AltText.ClientID%>");
        var altTextField = $get("<%#AltText.ClientID%>_TextField");
        if (imageUrlField != null && imageUrlField.value.length > 0) {
            altText.removeAttribute("disabled", 0);
            altTextField.removeAttribute("disabled", 0);
        } else {
            altText.setAttribute("disabled", false);
            altTextField.setAttribute("disabled", false);
            altTextField.value = '';
        }
    }
//]]>
</script> 
 