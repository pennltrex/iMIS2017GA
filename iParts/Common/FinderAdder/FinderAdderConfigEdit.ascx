<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FinderAdderConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.FinderAdder.FinderAdderConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
 
<script type="text/javascript">
    //<![CDATA[
     EnableDisableAdd();
     function EnableDisableAdd() {
         var addCheckBox = $get("<%#AddEnabled.ClientID%>_CheckBoxSet");
         var addTextControl = $get("<%#AddButtonText.ClientID%>");
         var addTextText = $get("<%#AddButtonText.ClientID%>_TextField");
         var addTextLabel = $get("<%#AddButtonText.ClientID%>_Caption");
         var addUrlControl = $get("<%#AddTargetUrl.ClientID%>");
         var addUrlText = $get("<%#AddTargetUrl.ClientID%>_TextField");
         var addUrlLabel = $get("<%#AddTargetUrl.ClientID%>_Caption");
         var addCodeControl = $get("<%#AddContentCode.ClientID%>");
         var addCodeText = $get("<%#AddContentCode.ClientID%>_TextField");
         var addCodeLabel = $get("<%#AddContentCode.ClientID%>_Caption");
         var formPropertiesListControl = $get("<%#FormPropertiesList.ClientID%>");
         var formPropertiesListText = $get("<%#FormPropertiesList.ClientID%>_TextField");
         var formPropertiesListLabel = $get("<%#FormPropertiesList.ClientID%>_Caption");
         
         if (addCheckBox != null && addCheckBox.checked) {
             if (addTextText != null)
                 addTextText.disabled = false;
             if (addTextLabel != null)
                 addTextLabel.disabled = false;
             if (addTextControl != null) {
                 addTextControl.disabled = false;
                 addTextControl.removeAttribute("disabled", 0);
             }
             if (addUrlText != null)
                 addUrlText.disabled = false;
             if (addUrlLabel != null)
                 addUrlLabel.disabled = false;
             if (addUrlControl != null) {
                 addUrlControl.disabled = false;
                 addUrlControl.removeAttribute("disabled", 0);
             }
             if (addCodeText != null)
                 addCodeText.disabled = false;
             if (addCodeLabel != null)
                addCodeLabel.disabled = false;
             if (addCodeControl != null) {
                 addCodeControl.disabled = false;
                 addCodeControl.removeAttribute("disabled", 0);
             }
             if (formPropertiesListText != null)
                 formPropertiesListText.disabled = false;
             if (formPropertiesListLabel != null)
                 formPropertiesListLabel.disabled = false;
             if (formPropertiesListControl != null) {
                 formPropertiesListControl.disabled = false;
                 formPropertiesListControl.removeAttribute("disabled", 0);
             }
         }
         else {
             if (addTextLabel != null)
                 addTextLabel.disabled = true;
             if (addTextText != null)
                 addTextText.disabled = true;
             if (addTextControl != null)
                 addTextControl.setAttribute("disabled", true);
             if (addUrlLabel != null)
                 addUrlLabel.disabled = true;
             if (addUrlText != null)
                 addUrlText.disabled = true;
             if (addUrlControl != null)
                 addUrlControl.setAttribute("disabled", true);
             if (addCodeLabel != null)
                 addCodeLabel.disabled = true;
             if (addCodeText != null)
                 addCodeText.disabled = true;
             if (addCodeControl != null)
                 addCodeControl.setAttribute("disabled", true);
             if (formPropertiesListText != null)
                 formPropertiesListText.disabled = true;
             if (formPropertiesListLabel != null)
                 formPropertiesListLabel.disabled = true;
             if (formPropertiesListControl != null) 
                 formPropertiesListControl.setAttribute("disabled", true);             
         }
     }
    //]]>
</script>
            
<asiweb:SmartControl ID="SourceDocumentPath" runat="server" 
    BoundPropertyName="SourceDocumentPath" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />  
 
<asiweb:SmartControl ID="BusinessObjectName" runat="server" 
    BoundPropertyName="BusinessObjectName" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  
 
<asiweb:SmartControl ID="DisplayPropertiesList" runat="server" 
    BoundPropertyName="DisplayPropertiesList" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  
 
<asiweb:SmartControl ID="SortByPropertiesList" runat="server" 
    BoundPropertyName="SortByPropertiesList" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  

<asiweb:SmartControl ID="DisabledPropertiesList" runat="server" 
        BoundPropertyName="DisabledPropertiesList" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />

<asiweb:SmartControl ID="TargetContentCode" runat="server" 
    BoundPropertyName="TargetContentCode" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  

<asiweb:SmartControl ID="TargetUrl" runat="server" 
    BoundPropertyName="TargetUrl" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />  

<asiweb:SmartControl ID="LinkTargetHeight" runat="server" 
    BoundPropertyName="LinkTargetHeight" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputWrapper" />  

<asiweb:SmartControl ID="LinkTargetWidth" runat="server" 
    BoundPropertyName="LinkTargetWidth" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputWrapper" />  
        
<div class="AutoWidth">
    <asiweb:SmartControl ID="EmbedLinkedPages" runat="server" 
        BoundPropertyName="EmbedLinkedPages" DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" /> 
    <asiweb:SmartControl ID="AddEnabled" runat="server" 
        BoundPropertyName="AddEnabled" DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" OnClientClick="EnableDisableAdd()" /> 
</div>
<div class="SubItems">
    <asiweb:SmartControl ID="AddButtonText" runat="server" 
        BoundPropertyName="AddButtonText" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  

    <asiweb:SmartControl ID="AddContentCode" runat="server" 
        BoundPropertyName="AddContentCode" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />  

    <asiweb:SmartControl ID="AddTargetUrl" runat="server" 
        BoundPropertyName="AddTargetUrl" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
    
    <asiweb:SmartControl ID="FormPropertiesList" runat="server" 
        BoundPropertyName="FormPropertiesList" DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />       
</div>
<div class="AutoWidth">
    <asiweb:SmartControl ID="DeleteEnabled" runat="server" 
        BoundPropertyName="DeleteEnabled" DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Right" /> 
</div>