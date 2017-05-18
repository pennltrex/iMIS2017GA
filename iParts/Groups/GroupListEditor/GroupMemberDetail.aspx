<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupMemberDetail.aspx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.GroupMemberDetail" %>
<%@ Register TagPrefix="uc1" TagName="MiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="EditGroup" Src="EditGroupMemberDetail.ascx" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">

    <script type="text/javascript">
        function RebindPanel(nodeInfo) {
            GetRadWindow().BrowserWindow.location.reload(true);
            //GetRadWindow().BrowserWindow.refreshPanel(nodeInfo);
            //window.location.href = window.location.href;
        }

        function HideEditGroup() {
            var editGroupControl = document.getElementById("<%=editGroupDiv.ClientID%>");
            editGroupControl.style = "display:none";
        }

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

            return oWindow;
        }
    </script>
    
    <asp:Panel ID="ContentPanel" runat="server">
        <uc1:MiniProfile ID="MiniProfile" runat="server" 
                DisplayContactName="true" 
                DisplayContactTitle="true" 
                DisplayInstitute="true" 
                AddressToDisplay="Preferred Mailing" 
                DisplayCustomerId="false"
                DisplayBillingCat="false"
                DisplayCustomerJoinDate="false"
                DisplayCustomerType="false"
                DisplayCustomerStatus="false"            
                DisplayPaidThru="false"         
                DisplayContactPicture="false" 
                GenerateContactPicture="false" 
                PartyId='<%#DisplayPartyId %>'
                ShowBorder="false"
                Collapsible="false"
                DisableDisplayInstituteLink="true" />
        <div style="padding-left:5px;padding-right:5px;">
            <div runat="server" visible="false" id="MemberNameDiv">
                <asiweb:StyledLabel ID="MemberName" runat="server" />
            </div> 
            <div runat="server" visible="false" id="DivLabelErrorMessage">
                <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
            </div>
            <div id="groupDetailDiv" runat="server">
                <b><asiweb:StyledLabel ID="groupLabel" runat="server" Visible="false" Translate="no"/></b>
                <asiweb:Lister2 ID="DetailGrid" runat="server" Visible="true"
                    OnNeedDataSource="DetailGrid_NeedDataSource" OnItemDataBound="DetailGrid_ItemDataBound"
                    DataKeyNames="GroupMemberId,GroupMemberDetailId"
                    DisplayPropertiesList="RoleDescription,Title,BeginDate,EndDate" 
                    DisplayPropertiesTitleOverride="Role,Title,Begin,End" 
                    AddButtonLocation="TopRight" AddButtonText="Add" OnAddButtonClicked="DetailGrid_AddButtonClicked" AddLinkTargetBehavior="RaiseEvent" 
                    DeleteColumnLocation="End" DeleteColumnText="delete" OnItemDeleted="DetailGrid_ItemDeleted" EnableClientSideDelete="false" 
                    EditColumnLocation="End" EditColumnText="edit" UseEditForms="true" EditFormUserControlPath="EditGroupMemberDetail.ascx" />
            </div>
            <div id="editGroupDiv" runat="server">
                <uc2:EditGroup ID="editGroup" runat="server"/> 
            </div> 
        </div> 
    </asp:Panel>
</asp:Content>
