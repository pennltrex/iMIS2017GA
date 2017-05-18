<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_Security" Codebehind="Security.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" TagName="AccessSettings" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radTS" %>

<div ID="SecurityParentPanel" runat="server">
    <radTS:RadTabStrip ID="SetUpModuleTabs" runat="server" MultiPageID="MultiPage1" SelectedIndex="0" AutoPostBack="false">
        <Tabs>
            <radTS:RadTab ID="AdminTab" Text="Community Administrators" runat="server" PageViewID="CommunityAdminPage"></radTS:RadTab>
            <radTS:RadTab ID="ModeratorTab" Text="Community Moderators" runat="server" PageViewID="ModeratorPage"></radTS:RadTab>
            <radTS:RadTab ID="WikiAuthorTab" Text="Community Wiki Authors" runat="server" PageViewID="WikiAuhorPage"></radTS:RadTab>
            <radTS:RadTab ID="AccessTab" Text="Access Settings" runat="server" PageViewID="AccessPage"></radTS:RadTab>
        </Tabs>
    </radTS:RadTabStrip>

    <radTS:RadMultiPage ID="MultiPage1" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay">
        <radTS:RadPageView ID="CommunityAdminPage" runat="server">
            <asiweb:PanelTemplateControl2 ID="PanelTemplateControl" runat="server" Collapsible="false"> 
                <asiweb:Lister2 runat="server" ID="CurrentMembersLister" 
                    Title="" ExportButtonLocation="None" EditColumnLocation="None"
                    DeleteColumnLocation="End" DeleteColumnText="remove" EnableClientSideDelete="false"
                    DataKeyNames="GroupMemberKey" DisplayPropertiesList="Sort Name,ID" 
                    DisplayPropertiesTitleOverride="Name,ID" />
                <asiweb:Lister2 runat="server" AjaxEnabled="false"
                    ID="AvailableMembersLister" Title=""
                    LinkTargetBehavior="RaiseEvent" PageSize="10"
                    SelectMode="true" SelectColumnText="Add"
                    UseUniformKey="True" ExportButtonLocation="None"
                    DataSourceDocumentPath="$/Common/Queries/Search/User" DataKeyNames="key_UniformKey"
                    /> 
             </asiweb:PanelTemplateControl2>          
        </radTS:RadPageView>
        <radTS:RadPageView ID="ModeratorPage" runat="server">
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false"> 
                <asiweb:Lister2 runat="server" ID="CurrentMembersListerCM" 
                    Title="" ExportButtonLocation="None" EditColumnLocation="None"
                    DeleteColumnLocation="End" DeleteColumnText="remove" EnableClientSideDelete="false"
                    DataKeyNames="GroupMemberKey" DisplayPropertiesList="Sort Name,ID" 
                    DisplayPropertiesTitleOverride="Name,ID" />
                <asiweb:Lister2 runat="server" AjaxEnabled="false"
                    ID="AvailableMembersListerCM" Title=""
                    LinkTargetBehavior="RaiseEvent" PageSize="10"
                    SelectMode="true" SelectColumnText="Add"
                    UseUniformKey="True" ExportButtonLocation="None"
                    DataSourceDocumentPath="$/Common/Queries/Search/User" DataKeyNames="key_UniformKey" 
                    />
            </asiweb:PanelTemplateControl2>                     
        </radTS:RadPageView>
        <radTS:RadPageView ID="WikiAuhorPage" runat="server">
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl2" runat="server" Collapsible="false"> 
                <asiweb:Lister2 runat="server" ID="CurrentMembersListerWA" 
                    Title="" ExportButtonLocation="None" EditColumnLocation="None"
                    DeleteColumnLocation="End" DeleteColumnText="remove" EnableClientSideDelete="false"
                    DataKeyNames="GroupMemberKey" DisplayPropertiesList="Sort Name,ID" 
                    DisplayPropertiesTitleOverride="Name,ID" />
                <asiweb:Lister2 runat="server" AjaxEnabled="false"
                    ID="AvailableMembersListerWA" Title=""
                    LinkTargetBehavior="RaiseEvent" PageSize="10"
                    SelectMode="true" SelectColumnText="Add"
                    UseUniformKey="True" ExportButtonLocation="None"
                    DataSourceDocumentPath="$/Common/Queries/Search/User" DataKeyNames="key_UniformKey"
                    />
              </asiweb:PanelTemplateControl2>               
        </radTS:RadPageView>
        <radTS:RadPageView ID="AccessPage" runat="server">
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl3" runat="server" Collapsible="false"> 
                <uc1:AccessSettings ID="CommunityDocumentSecurity" CollapsePanelSetting="false" runat="server"  />
                <div style="clear: both;"></div>
                <div class="CommandBar" >
                    <asiweb:StyledButton ID="SaveButton" CssClass="PrimaryButton" runat="server" OnClick="SaveButtonClick" Text="Save" />
                    <asiweb:StyledButton ID="CancelButton" runat="server" OnClick="CancelButtonClick" CausesValidation="False" Text="Cancel"/>
                </div>
                </asiweb:PanelTemplateControl2> 
        </radTS:RadPageView>
    </radTS:RadMultiPage>
</div>



