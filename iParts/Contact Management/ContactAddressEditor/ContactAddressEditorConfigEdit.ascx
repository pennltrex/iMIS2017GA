<%@ Control Language="C#" AutoEventWireUp="true" CodeBehind="ContactAddressEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddressEditorConfigEdit"  %>



<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

    <div class="AutoWidth">

        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
            
        <asiweb:SmartControl 
            ID="ChangeAddresses" runat="server" BoundPropertyName="ChangeAddresses" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />            
                       
         <asiweb:SmartControl 
            ID="CreateAddresses" runat="server" BoundPropertyName="CreateAddresses" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />    

<%--        <asiweb:SmartControl 
            ID="CreateAddressPurpose" runat="server" BoundPropertyName="CreateAddressPurpose" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" Enabled="false" />   --%>                    
             
        <asiweb:SmartControl 
            ID="DisplayFaxNumber" runat="server" 
            BoundPropertyName="DisplayFaxNumber" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
          
        <asiweb:SmartControl 
            ID="DisplayAddressNotes" runat="server" 
            BoundPropertyName="DisplayAddressNotes" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />           
               

<%--        <asiweb:SmartControl 
            ID="DisableAddressChecking" runat="server" 
            BoundPropertyName="DisableAddressChecking" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" Enabled="False" />            

        <asiweb:SmartControl 
            ID="AutomaticallyAcceptAddressChanges" runat="server" 
            BoundPropertyName="AutomaticallyAcceptAddressChanges" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" Enabled="False" />   --%>
        <asiweb:SmartControl 
            ID="DisplayAddressMapLink" runat="server" 
            BoundPropertyName="DisplayAddressMapLink" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false"  />              
    </div> 
      
 </asiweb:paneltemplatecontrol>