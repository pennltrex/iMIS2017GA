<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupDetail.aspx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.GroupDetail" %>
<%@ Register TagPrefix="uc1" TagName="MiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="EditGroupMember" Src="EditGroupMemberDetail.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">

    <script type="text/javascript">
        function RebindPanel(nodeInfo) {
            GetRadWindow().BrowserWindow.location.reload(true);
            //GetRadWindow().BrowserWindow.refreshPanel(nodeInfo);
            //window.location.href = window.location.href;
        }

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

            return oWindow;
        }

    </script>

    <div runat="server" visible="false" id="DivLabelErrorMessage">
        <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
    </div>
    <uc1:MiniProfile ID="MiniProfile" runat="server" 
        DisplayContactName="true" 
        DisplayContactTitle="true" 
        DisplayInstitute="true" 
        AddressToDisplay="Preferred Mailing" 
        DisplayCustomerTypeAndStatus="true"
        CustomerStatusHeading="Status" 
        DisplayContactPicture="false" 
        GenerateContactPicture="false" 
        PartyId='<%#PartyId %>' />
    <br />

    <asiweb:StyledLabel ID="GroupName" runat="server" Font-Bold="true" Text='<%#Asi.ResourceManager.GetPhrase("GroupName", "Group Name") %>' />
    <div id="groupMemberDiv" runat="server">
        <uc2:EditGroupMember ID="editGroupMember" runat="server" GroupId='<%#GroupId %>' PartyId='<%#PartyId %>'/> 
    </div>
</asp:Content>
