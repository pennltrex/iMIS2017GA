<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.UserManagement.CommonUserEdit" Codebehind="CommonUserEdit.ascx.cs" %>

<script type="text/javascript">
    var subjectUniformKey = '<%= CurrentContext.SubjectUniformKey %>';
    function AddGroup()
    {
      //ShowDialog(url,                                                                                       args,width,height,title,        iconUrl,templateType, callBackFunction, windowName,     closeWindowOnCommit, preserveStatefulBusinessContainer, dialogCloseFunction) 
        ShowDialog('~/AsiCommon/Controls/Contact/User/UserGroupSelect.aspx?iUniformKey=' + subjectUniformKey, null, 500, 400, 'Select Group', null, 'E', GroupSelectCallback, null, false, true, null);
    }
    function GroupSelectCallback(dialogWindow)
    {
        try
        {
            if (!dialogWindow.result || dialogWindow.result == '')
                return;
            var addedGroupsField = document.getElementById('<%# AddedGroups.ClientID %>');
            if (addedGroupsField.value == '')
                addedGroupsField.value = dialogWindow.result;
            else
                addedGroupsField.value = addedGroupsField.value + "," + dialogWindow.result;
            document.getElementById('<%# AddGroupButton.ClientID %>').click();
        } 
        catch (e)
        {
            // Ignore this IE-specific error (it means the dialog window is no longer available...nothing we can do anyway).  
            // It happens after adding a group, then going back into the add group popup (before saving), and clicking cancel.
            if (e.message.indexOf("Can't execute code from a freed script") >= 0)
                ;
            else
                throw e;
        }
    }
    function AddRole()
    {
        ShowDialog('~/AsiCommon/Controls/Contact/User/UserRoleSelect.aspx?iUniformKey=' + subjectUniformKey, null, 500, 400, 'Select Role', null, 'E', RoleSelectCallback, null, false, true, null);
    }
    function RoleSelectCallback(dialogWindow)
    {
        try 
        {
            if (!dialogWindow.result || dialogWindow.result == '')
                return;
            document.getElementById('<%# AddedRoles.ClientID %>').value = dialogWindow.result;
            document.getElementById('<%# AddRoleButton.ClientID %>').click();
        } 
        catch (e)
        {
            // Ignore this IE-specific error (it means the dialog window is no longer available...nothing we can do anyway).  
            // It happens after adding a role, then going back into the add role popup (before saving), and clicking cancel.
            if (e.message.indexOf("Can't execute code from a freed script") >= 0)
                ;
            else
                throw e;
        } 
    }
</script>

<input type="hidden" runat="server" id="AddedRoles" name="AddedRoles" />
<input type="hidden" runat="server" id="AddedGroups" name="AddedGroups" />

<asiweb:PanelTemplateControl2 runat="server" ID="UserSecurityInfoPanel" ShowHeader="false" FieldSet="true" BorderStyle="None" translate="yes">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" width="60%">
        <asiweb:SmartControl runat="server" ID="Disabled" BoundPropertyName="IsDisabled" DisplayType="EditableField" OnDataChange="Disabled_DataChange" DisplayCaption="true" PositionCaption="Right" />
        <asiweb:SmartControl runat="server" ID="EffectiveDate" BoundPropertyName="EffectiveDate" DisplayType="EditableField" DisplayCaption="true" CaptionCssClass="CapitalizeFirst"/>
        <asiweb:SmartControl runat="server" ID="ExpirationDate" BoundPropertyName="ExpirationDate" DisplayType="EditableField" OnDataChange="ExpirationDate_DataChange" DisplayCaption="true" CaptionCssClass="CapitalizeFirst"/>
    </asiweb:PanelTemplateColumn>
    
    <asiweb:PanelTemplateColumn ID="Column2" runat="server" Width="300px">
        <asp:UpdatePanel runat="server" ID="RoleListContainerUpdatePanel1" ViewStateMode="Enabled" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="RoleList"/>
                <asp:AsyncPostBackTrigger ControlID="AddRoleButton"/>
            </Triggers>
            <ContentTemplate>
                <div id="RoleListContainer" class="AutoWidth ShowFieldset">
                    <fieldset>
                        <legend><%# GetTranslatedPhrase("Roles") %></legend>
                        <asiweb:Lister2 ID="RoleList" runat="server" Title="Roles" OnItemDeleted="RoleList_ItemDeleted" AjaxEnabled="false"
                            HeaderVisible="false" DataSourceAtomComponentName="UserRole" DisplayPropertiesList="RoleKey"
                            OnNeedDataSource="RoleList_NeedDataSource" DataSourceIsRealDataSource="true" PagingEnabled="true"
                            ExportButtonLocation="None" GroupingEnabled="false" SortingEnabled="false" ColumnReorderingEnabled="false"
                            LinkTargetBehavior="NewWindowAllShare" AddTargetClientScript="AddRole()" AddButtonText="Add role" AddButtonLocation="TopRight" 
                            AddButtonToolTip="Assign user to a new role" SelectColumnLocation="None" DeleteColumnLocation="End" DeleteColumnText="remove"  />
                    </fieldset>
                </div>
                <asp:Button ID="AddRoleButton" runat="server" style="display:none" OnClick="RoleList_ItemAdded" data-ajaxUpdatedControlID="RoleListContainer" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="GroupListContainerUpdatePanel1" ViewStateMode="Enabled" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GroupList"/>
                <asp:AsyncPostBackTrigger ControlID="AddGroupButton"/>
            </Triggers>
            <ContentTemplate>
                <div id="GroupListContainer" class="AutoWidth ShowFieldset">
                    <fieldset>
                        <legend><%# GetTranslatedPhrase("Groups") %></legend>
                        <asiweb:Lister2 ID="GroupList" runat="server" Title="Groups" OnItemDeleted="GroupList_ItemDeleted" AjaxEnabled="false"
                            HeaderVisible="false" DataSourceAtomComponentName="GroupMember" DisplayPropertiesList="GroupKey"
                            OnNeedDataSource="GroupList_NeedDataSource" DataSourceIsRealDataSource="true" PagingEnabled="true"
                            ExportButtonLocation="None" GroupingEnabled="false" SortingEnabled="false" ColumnReorderingEnabled="false"
                            LinkTargetBehavior="NewWindowAllShare" AddTargetClientScript="AddGroup()" AddButtonText="Add group" AddButtonLocation="TopRight" 
                            AddButtonToolTip="Add user to a group" DeleteColumnLocation="End" DeleteColumnText="remove" />
                    </fieldset>
                </div>
                <asp:Button ID="AddGroupButton" runat="server" style="display:none" OnClick="GroupList_ItemAdded" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asiweb:PanelTemplateColumn>

</asiweb:PanelTemplateControl2>

<asp:Label ID="NullUserMessage" runat="server" Visible="false" style="font-style:italic"></asp:Label>
<asp:PlaceHolder id='PlaceHolder_editlink' runat='server'/>
