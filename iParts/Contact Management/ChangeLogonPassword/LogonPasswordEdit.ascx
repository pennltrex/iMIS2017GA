<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ChangeLogonPassword.LogonPasswordEdit" Inherits="Asi.Web.UI.WebControls.iPartEditBase" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<script runat="server">
    
    public override string AtomComponentName
    {
        get
        {
            return "Change Logon Password";
        }
    }

</script>

<asiweb:PanelTemplateControl ID="ChangeLogonPasswordFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">     
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayCurrentLogon" runat="server" BoundPropertyName="DisplayCurrentLogon" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ChangeSecurityMessage" runat="server" BoundPropertyName="ChangeSecurityMessage" DisplayCaption="true" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ChangeLogon" runat="server" BoundPropertyName="ChangeLogon" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ChangePassword" runat="server" BoundPropertyName="ChangePassword" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
</asiweb:PanelTemplateControl>