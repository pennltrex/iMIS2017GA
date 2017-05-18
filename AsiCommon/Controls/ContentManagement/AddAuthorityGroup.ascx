<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_AddAuthorityGroup" Codebehind="AddAuthorityGroup.ascx.cs" %>

<script type="text/javascript">
    function AddMethod_Change(value) {
        var createPanel = $get('<%= NewGroupSection.ClientID %>');
        var copyPanel = $get('<%= CopyGroupSection.ClientID %>');
        if (value == "new") {
            createPanel.style.display = 'inherit';
            copyPanel.style.display = 'none';
        }
        else {
            createPanel.style.display = 'none';
            copyPanel.style.display = 'inherit';
        }
    }
</script>

<asiweb:PanelTemplateControl2 ID="AddGroup" runat="server" Text="Add content authority group" FieldSet="true" Collapsible="false">
    
    <div class="Section">
        <asp:RadioButton ID="NewGroup" runat="server" GroupName="AddMethod" Text="Create a new content authority group" Checked="true"
            onclick="AddMethod_Change('new')" />
        <asp:RadioButton ID="CopyGroup" runat="server" GroupName="AddMethod" Text="Copy an existing iMIS group" 
            onclick="AddMethod_Change('copy')" />
    </div>

    <div class="SubItems">
        <div id="NewGroupSection" runat="server" class="Section">
            <asiweb:BusinessTextBox ID="GroupName" runat="server" MaxLength="65" TextMode="SingleLine" RenderPanelField="True" DisplayCaption="True" Caption="Group name" Required="True" />
        </div>
        <div id="CopyGroupSection" runat="server" style="display:none;" class="Section">
            <asiweb:BusinessFinderControl ID="GroupFinder" runat="server" DeleteButtonText="" 
                DataSourceDocumentPath="$/ContentManagement/DefaultSystem/Queries/Groups"
                DataSourceComponentName="Group" DataTextField="Name" DataValueField="key_UniformKey"
                RenderPanelField="True" DisplayCaption="True" Caption="Group" />
        </div>
        <asp:CheckBox ID="IsAdmin" runat="server" TextAlign="Right" Text="Master admin group" />

    </div>

</asiweb:PanelTemplateControl2>