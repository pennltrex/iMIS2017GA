<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureEdit" Inherits="Asi.Web.UI.WebControls.iPartEditBase" %>
<%@ Import Namespace="System.Globalization" %>

<script runat="server" language="C#">
    public override string AtomComponentName
    {
        get
        {
            return "Contact Profile Picture";
        }
    }
</script>

<asiweb:PanelTemplateControl id="contactProfilePicture" runat="server" fieldset="True" showheader="False" borderstyle="None">
    <div class="AutoWidth">
           
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />

        <asiweb:SmartControl id="enableEdit" runat="server" boundpropertyname="EnableEdit" displaycaption="True" positioncaption="Right" DataSaveUponStateChange="false" />		
    </div>  
            
    <asiweb:SmartControl id="maxFileSize" runat="server" boundpropertyname="MaxFileSize" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="1" MaxValue="1073741824" /> 
       
    <asiweb:SmartControl id="maxImageWidth" runat="server" boundpropertyname="MaxImageWidth" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="50" MaxValue="1000" />
    
    <asiweb:SmartControl id="fileTypes" runat="server" boundpropertyname="FileTypes" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" />
                         
</asiweb:PanelTemplateControl>
