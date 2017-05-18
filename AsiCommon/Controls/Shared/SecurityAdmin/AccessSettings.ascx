<%@ Control Language="C#" Inherits="AsiCommon_Controls_Shared_SecurityAdmin_AccessSettings" Codebehind="AccessSettings.ascx.cs" %>
<%@ Register TagPrefix="asi" TagName="Permission" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettingsPermissions.ascx" %>
<%@ Register TagPrefix="asi" TagName="ModuleAuthorization" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettingsModuleAuthorization.ascx" %>
<%@ Register TagPrefix="radG" Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="Access Settings" Collapsed="true" FieldSet="true" >
    
    <asp:Panel ID="AccessSettingsPanel" runat="server" >
        
        <div style="padding-top:10px;padding-bottom:10px;" runat="server" Visible="<%# HierarchyKey != Guid.Empty && Asi.Business.Common.DocumentHierarchy.HasChildren(HierarchyKey) %>">          
            <asp:CheckBox ID="AssignToDescendentsCheckBox" runat="server" Text="Apply changes to all descendants" TextAlign="Right" />
        </div>
        <asp:RadioButton ID="SecurityType_AccessArea" runat="server" GroupName="SecurityType" AutoPostBack="true" OnCheckedChanged="SecurityType_Changed" Text="Use a preconfigured security set"/>    
        <asiweb:PanelTemplateControl2 ID="AccessAreaPanel" runat="server" style="padding-top:10px;padding-bottom:10px;margin-left:20px;" ShowHeader="false" BorderStyle="none">
            <asp:Label runat="server" ID="AccessAreaDropDownLabel" Text="Security Set" AssociatedControlID="AccessAreaDropDown"></asp:Label>
            <asiweb:BusinessDropDownList ID="AccessAreaDropDown" runat="server" DataSourceComponentName="AccessArea" ShowNullItem="true" DataSortField="Name" AutoPostBack="true" OnDataChanged="AccessAreaDropDown_Changed"/>
        </asiweb:PanelTemplateControl2>
        <asp:RadioButton ID="SecurityType_Custom" runat="server" GroupName="SecurityType" AutoPostBack="true" OnCheckedChanged="SecurityType_Changed" Text="Make this available to"/>
        <asp:Panel ID="CustomSecurityPanel" runat="server">
            <asiweb:PanelTemplateControl2 ID="RoleListPanel" runat="server" Text="Specific Roles" style="margin-left: 20px;">
                <radG:RadGrid ID="RoleList" runat="server" AutoGenerateColumns="false"
                    OnDataBinding="RoleList_DataBinding" OnItemCreated="RoleList_ItemCreated"
                    OnItemDataBound="RoleList_ItemDataBound" BorderStyle="none">
                    <MasterTableView ItemStyle-Height="30px">
                        <Columns>
                            <radG:GridTemplateColumn UniqueName="AccessGranted" HeaderText="Access Granted">
                                <ItemTemplate>
                                    <asp:CheckBox ID="AccessGranted" runat="server" ToolTip="Select to grant access" onclick="RoleAccessGranted_Click(this)" />
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <radG:GridTemplateColumn HeaderText="Name" UniqueName="Name">
                                <ItemTemplate>
                                    <asp:Label ID="GranteeName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <radG:GridTemplateColumn HeaderText="Permissions" UniqueName="Permissions">
                                <ItemTemplate>
                                    <asi:Permission ID="PermissionControl" runat="server" />
                                    <div style="float: right; white-space:nowrap;">&nbsp;</div>
                                    <%--NZ 12/14/2015 Commented because InitializePermissionControls function in AccessSettings.js is being called.--%>
                                    <%--<script type="text/javascript">RoleAccessGranted_Click($get('<asp:Literal id="InitAccessGrantedLiteral" runat="server" />'), true);</script>--%>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </radG:RadGrid>
            </asiweb:PanelTemplateControl2>
            <asiweb:PanelTemplateControl2 ID="GroupListPanel" runat="server" style="margin-left: 20px;" Text="Specific Groups" Collapsed="true">
                <asp:UpdatePanel ID="GroupListUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="DeletedGroupKeys" runat="server" Value="" EnableViewState="true" />
                        <div style="margin:5px;">
                            <asp:LinkButton ID="AddGroupButton" runat="server" Text="Add group" />
                        </div>
                        <radG:RadGrid ID="GroupList" runat="server" AutoGenerateColumns="false" 
                            AllowAutomaticDeletes="true"
                            OnDataBinding="GroupList_DataBinding" OnItemCreated="GroupList_ItemCreated" 
                            OnItemDataBound="GroupList_ItemDataBound" OnItemCommand="GroupList_ItemCommand" BorderStyle="none">
                            <MasterTableView AdditionalDataFieldNames="GroupKey" DataKeyNames="GroupKey">
                                <Columns>
                                    <radG:GridTemplateColumn HeaderText="Group">
                                        <ItemTemplate>
                                            <asp:Label ID="GranteeName" runat="server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn HeaderText="Permissions">
                                        <ItemTemplate>
                                            <asi:Permission ID="PermissionControl" runat="server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" HeaderText="Remove" ButtonType="LinkButton" Text="remove" ConfirmText="Are you sure you want to remove this Group?"></radG:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </radG:RadGrid>
                        <asp:Button ID="GroupAddedButton" Text="Group Added" runat="server" Style="display:none;" OnClick="GroupAddedButton_Click" CausesValidation="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asiweb:PanelTemplateControl2>
            <asiweb:PanelTemplateControl2 ID="UserListPanel" runat="server" style="margin-left: 20px;" Text="Specific Users" Collapsed="true">
                <asp:UpdatePanel ID="UserListUpdatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="DeletedUserKeys" runat="server" Value="" EnableViewState="true" />
                        <div style="margin:5px;">
                            <asp:LinkButton ID="AddUserButton" runat="server" Text="Add user" />
                        </div>
                        <radG:RadGrid ID="UserList" runat="server" AutoGenerateColumns="false" 
                            AllowAutomaticDeletes="true"
                            OnDataBinding="UserList_DataBinding" OnItemCreated="UserList_ItemCreated" 
                            OnItemDataBound="UserList_ItemDataBound" OnItemCommand="UserList_ItemCommand" BorderStyle="none">
                            <MasterTableView AdditionalDataFieldNames="UserKey" DataKeyNames="UserKey">
                                <Columns>
                                    <radG:GridTemplateColumn HeaderText="User">
                                        <ItemTemplate>
                                            <asp:Label ID="GranteeName" runat="server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridTemplateColumn HeaderText="Permissions">
                                        <ItemTemplate>
                                            <asi:Permission ID="PermissionControl" runat="server" />
                                        </ItemTemplate>
                                    </radG:GridTemplateColumn>
                                    <radG:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" HeaderText="Remove" ButtonType="LinkButton" Text="remove" ConfirmText="Are you sure you want to remove this User?"></radG:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </radG:RadGrid>
                        <asp:Button ID="UserAddedButton" Text="User Added" runat="server" Style="display:none;" OnClick="UserAddedButton_Click" CausesValidation="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asiweb:PanelTemplateControl2>
            <asiweb:PanelTemplateControl2 ID="MemberTypePanel" runat="server" Style="margin-left: 20px;" Text="Specific Member Types" Collapsed="true">
                <radG:RadGrid ID="MemberTypeList" runat="server" AutoGenerateColumns="false"
                    OnDataBinding="MemberTypeList_DataBinding" OnItemCreated="MemberTypeList_ItemCreated"
                    OnItemDataBound="MemberTypeList_ItemDataBound" BorderStyle="none">
                    <MasterTableView ItemStyle-Height="30px">
                        <Columns>
                            <radG:GridTemplateColumn HeaderText="Access Granted">
                                <ItemTemplate>
                                    <asp:CheckBox ID="AccessGranted" runat="server" ToolTip="Select to grant access" onclick="RoleAccessGranted_Click(this)" />
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <radG:GridTemplateColumn HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="GranteeName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <radG:GridTemplateColumn HeaderText="Permissions">
                                <ItemTemplate>
                                    <asi:Permission ID="PermissionControl" runat="server" />
                                    <%--NZ 12/14/2015 Commented because InitializePermissionControls function in AccessSettings.js is being called.--%>
                                    <%--<script type="text/javascript">RoleAccessGranted_Click($get('<asp:Literal id="InitAccessGrantedLiteral" runat="server" />'), true);</script>--%>
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </radG:RadGrid>
            </asiweb:PanelTemplateControl2>

            <%-- Dues to issues between IE, FF and Chrome and displaying nested controls as disabled this is needed --%>  
            <asp:Panel ID="CustomSecurityPanelPre" runat="server" Style="margin-left:20px;margin-top:8px;">
                <div runat="server" id="RoleListPanelPre" style="color:#a0a0a0">&#183; Specific Roles</div>
                <div runat="server" id="GroupListPanelPre" style="color:#a0a0a0">&#183; Specific Groups</div>
                <div runat="server" id="UserListPanelPre" style="color:#a0a0a0">&#183; Specific Users</div>
                <div runat="server" id="MemberTypePanelPre" style="color:#a0a0a0">&#183; Specific Member Types</div>
            </asp:Panel> 
                                   
        </asp:Panel>
        
        <div style="padding-top:10px;padding-bottom:5px;"> 
            <label runat="server" ID="ModuleAuthorizationLabel" Visible="false" style="padding-top:10px;padding-bottom:10px;">Additional Staff Module Authorization</label>
        </div>
        <asiweb:PanelTemplateControl2 ID="ModuleAuthorizationPanel" runat="server" Visible="false" style="margin-left: 18px;" Collapsed="true" Text="Level Assignment">
            <asi:ModuleAuthorization ID="ModuleAuthorization1" runat="server" />
        </asiweb:PanelTemplateControl2>
    
    </asp:Panel>

    <asp:Label ID="NoItemLabel" runat="server" Visible="false" Text="Please save your work before setting security." Font-Italic="true"></asp:Label>

</asiweb:PanelTemplateControl2>
