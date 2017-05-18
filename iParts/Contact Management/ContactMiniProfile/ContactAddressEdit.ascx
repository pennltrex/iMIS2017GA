<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactMiniProfile.AddressEdit" Inherits="Asi.Web.UI.WebControls.iPartEditBase" %>

<script runat="server">
    
    public override string AtomComponentName
    {
        get
        {
            return "Contact Address";
        }
    }

</script>

<asiweb:PanelTemplateControl ID="AddressFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" translate ="yes">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
           
    </div>
    <asiweb:SmartControl ID="AddressToDisplay" runat="server" BoundPropertyName="AddressToDisplay" DisplayCaption="true" DataSaveUponStateChange="false" />
</asiweb:PanelTemplateControl>
