<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupListEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.GroupListEditorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi" %>

<asiweb:PanelTemplateControl2 ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="False" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="CssClassField" runat="server" BoundPropertyName="CssClass" PositionCaption="Left"
            DisplayCaption="True" DataSaveUponStateChange="False" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <div id="screenSizeDiv" runat="server">
            <asiweb:StyledLabel 
                runat="server" ID="ScreenSizeLabel" CssClass="Label display-block"
                Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.ScreenSizeLabel", "Display on screen sizes (for responsive themes only):") %>' />
            <div class="form-inline SubItems">
                <asiweb:SmartControl 
                    ID="DisplayOnExtraSmallScreensOption" runat="server" BoundPropertyName="DisplayOnExtraSmallScreens" PositionCaption="Right" 
                    DisplayCaption="True" DataSaveUponStateChange="false" CssClass="checkbox-display-xs" />
                <asiweb:SmartControl 
                    ID="DisplayOnSmallScreensOption" runat="server" BoundPropertyName="DisplayOnSmallScreens" PositionCaption="Right" 
                    DisplayCaption="True" DataSaveUponStateChange="false" CssClass="checkbox-display-sm" />
                <asiweb:SmartControl 
                    ID="DisplayOnMediumScreensOption" runat="server" BoundPropertyName="DisplayOnMediumScreens" PositionCaption="Right" 
                    DisplayCaption="True" DataSaveUponStateChange="false" CssClass="checkbox-display-md" />
                <asiweb:SmartControl 
                    ID="DisplayOnLargeScreensOption" runat="server" BoundPropertyName="DisplayOnLargeScreens" PositionCaption="Right" 
                    DisplayCaption="True" DataSaveUponStateChange="false" CssClass="checkbox-display-lg" />
            </div>
        </div>
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayGroupTitle" runat="server" BoundPropertyName="DisplayGroupTitle" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayProfileImage" runat="server" BoundPropertyName="DisplayProfileImage" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ShowInactive" runat="server" BoundPropertyName="ShowInactive" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ListEntriesExpandable" runat="server" BoundPropertyName="ListEntriesExpandable" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ShowMembershipExpirationDate" runat="server" BoundPropertyName="ShowMembershipExpirationDate"
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="AllowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" OnClientClick="EnableDisableEdit()" />
        
    </div>
    <div class="SubItems AutoWidth">
        <asiweb:SmartControl ID="AddMemberText" runat="server" BoundPropertyName="AddMemberText" DisplayCaption="true" DataSaveUponStateChange="false"/>
    </div>
    <asiweb:SmartControl ID="LinkMode" runat="server" BoundPropertyName="LinkMode" 
        DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" />
      
    <div style="clear: both;"/> 
    <div class="ShowFieldset">
        <fieldset>
           <legend>Display Options</legend>  
      <div class="AutoWidth">
        <asiweb:SmartControl ID="ParentType" runat="server" BoundPropertyName="ParentType" DisplayCaption="true" DataSaveUponStateChange="false" ShowNullItem="False" AutoPostBack="True" OnDataChange="GroupMode_OnDataChange" />
      </div><div style="clear: both;"/>  
      <div class="AutoWidth" style="padding-top: 0.25em;">
        <asiweb:SmartControl ID="UrlParameter" runat="server" BoundPropertyName="UrlParameter" DisplayCaption="true" DataSaveUponStateChange="false" />            
      </div><div style="clear: both;"/> 
      <div class="AutoWidth" style="padding-top: 0.5em;">
        <asiweb:SmartControl ID="GroupMode" runat="server" BoundPropertyName="GroupMode" DisplayCaption="true" PositionCaption="Top"
            AutoPostBack="true" DataSaveUponStateChange="false" OnDataChange="GroupMode_OnDataChange" />
      </div><div style="clear: both;"/> 
      <div class="AutoWidth" style="padding-top: 0.7em;">
        <asiweb:SmartControl ID="AutoCreate" runat="server" BoundPropertyName="AutoCreate" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="True" OnDataChange="AutoCreateChange" />
        <div id="AutoCreateGroup" class="SubItems" runat="server">
           <asiweb:SmartControl ID="OwnerType" runat="server" BoundPropertyName="OwnerType" DisplayCaption="true" DataSaveUponStateChange="false"/>
            <asiweb:SmartControl ID="GroupType" runat="server" BoundPropertyName="AutoCreateGroupType" DisplayCaption="true" DataSaveUponStateChange="false" AutoPostBack="True"/>  
        </div>
      </div><div style="clear: both;"/>  
      <div class="AutoWidth" style="padding-top: 1em;">
      <div class="Top" id="GroupTypesDiv" runat="server">
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="LabelGroupTypes" AssociatedControlID="groupTypeSelector" Text='<%#Asi.ResourceManager.GetPhrase("GroupTypes", "Choose the group types to include")%>' />
            <div class="PanelFieldValue" style="margin:3px;">
                <asiweb:MultiSelectControl2 id="groupTypeSelector" Height="150px" Width="200px" runat="server"/>
            </div>
        </div>
      </div> 
      </div>    
        </fieldset>
   </div>
 </asiweb:PanelTemplateControl2>
 <script type="text/javascript">
    //<![CDATA[
     EnableDisableEdit();
     function EnableDisableEdit() {
         var editableCheckBox = $get("<%#AllowEdit.ClientID%>_CheckBoxSet");
         var addControl = $get("<%#AddMemberText.ClientID%>");
         var addText = $get("<%#AddMemberText.ClientID%>_TextField");
         var addLabel = $get("<%#AddMemberText.ClientID%>_Caption");
         var autoCreateControl = $get("<%#AutoCreate.ClientID%>");
         var autoCreateCheckbox = $get("<%#AutoCreate.ClientID%>_CheckBoxSet");
         var autoCreateLabel = $get("<%#AutoCreate.ClientID%>_Caption");        
         if (addText == null) return;
         
         if (editableCheckBox != null && editableCheckBox.checked) {
             addText.disabled = false;
             addLabel.disabled = false;
             addControl.disabled = false;
             addControl.removeAttribute("disabled",0);
             if (autoCreateCheckbox != null) {
                 var membershipMode = $get("<%#GroupMode.ClientID%>_RadioButtonSet_1");
                 if (membershipMode != null && membershipMode.checked) return; //do not enable auto create in this case
                 autoCreateControl.removeAttribute("disabled", 0);
                 autoCreateCheckbox.disabled = false;
                 autoCreateLabel.disabled = false;
             }
         }
         else {
             addLabel.disabled = true;
             addText.disabled = true;
             addControl.setAttribute("disabled", true);
             if (autoCreateCheckbox != null) {                 
                 autoCreateCheckbox.disabled = true;
                 autoCreateLabel.disabled = true;
                 var wasChecked = autoCreateCheckbox.checked;
                 autoCreateCheckbox.checked = false;
                 autoCreateControl.setAttribute("disabled", true);
                 if (wasChecked) {
                     var ownerType = $get("<%#OwnerType.ClientID%>");
                     var groupType = $get("<%#GroupType.ClientID%>");                   
                     var ownerTypeFieldValidator = $get("<%#OwnerType.ClientID%>_RequiredFieldValidator");
                     var ownerTypeFieldErrorMessage = $get("<%#OwnerType.ClientID%>_ErrorMessage");
                     var groupTypeFieldValidator = $get("<%#GroupType.ClientID%>_RequiredFieldValidator");
                     var groupTypeFieldErrorMessage = $get("<%#GroupType.ClientID%>_ErrorMessage");
                     if (ownerType != null && groupType != null) {
                         ownerType.setAttribute("disabled", true);
                         ownerType.style.display = 'none';                          
                         groupType.setAttribute("disabled", true);
                         groupType.style.display = 'none';                          
                         ownerTypeFieldValidator.enabled = false;
                         ownerTypeFieldValidator.disabled = true;
                         ownerTypeFieldErrorMessage.style.display = 'none';
                         ownerTypeFieldValidator.style.display = 'none';
                         groupTypeFieldValidator.enabled = false;
                         groupTypeFieldValidator.disabled = true;
                         groupTypeFieldErrorMessage.style.display = 'none';
                         groupTypeFieldValidator.style.display = 'none'; 
                     }
                 }
             }
         }
     }        
 //]]>
</script>