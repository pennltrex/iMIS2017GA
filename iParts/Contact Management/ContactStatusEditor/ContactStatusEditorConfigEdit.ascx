<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactStatusEditor.ContactStatusEditorCommon" Inherits="Asi.Web.UI.ContentItemEditBase" %>

<script runat="server">
    
    public override string AtomComponentName
    {
        get
        {
            return "Contact Status Editor";
        }
    }

</script>
<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
    
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
            
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />

        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
            
        <asiweb:SmartControl 
            ID="ChangeContactStatus" runat="server" BoundPropertyName="ChangeContactStatus" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />                
          
    </div>    
 </asiweb:paneltemplatecontrol>