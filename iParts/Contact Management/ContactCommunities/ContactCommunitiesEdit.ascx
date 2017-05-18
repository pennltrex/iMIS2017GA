<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactCommunities.ContactCommunitiesEdit" Inherits="Asi.Web.UI.ContentItemEditBase" %>

<script runat="server">
    
    public override string AtomComponentName
    {
        get
        {
            return "Contact Communities";
        }
    }

</script>

<asiweb:PanelTemplateControl ID="_contactCommunities" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:smartcontrol ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DonotRenderinDesignMode" runat="server" BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ShowBorder" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>    
    <asiweb:SmartControl ID="PageSize" runat="server" BoundPropertyName="PageSize" DisplayCaption="true" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="NotSubscribedMessage" runat="server" BoundPropertyName="NotSubscribedMessage" DisplayCaption="true" DataSaveUponStateChange="false" />  
</asiweb:PanelTemplateControl>