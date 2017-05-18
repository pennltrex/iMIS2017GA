<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_LegacySecurityAccess" Codebehind="LegacySecurityAccess.ascx.cs" %>

<script language="javascript"">
//     var securityBox;
//     var systemLevel;
//     function pageLoad(obj, arg){
//        securityBox = $get('<%=SystemBox.ClientID%>');
//        systemLevel = $get('<%=SystemSecurityLevel.ClientID%>');
//     }
//     function ValidateLegacyAccess() {
//        var controlArrays = new Array(2);
//        controlArrays[0] =  new ControlPair('<%=SystemBox.ClientID%>','<%=SystemSecurityLevel.ClientID%>');
//        controlArrays[1] = new ControlPair('<%=Membership.ClientID%>','<%=MembershipSecurityLevel.ClientID%>');
//        
//        for(i=0; i< controlArrays.length; i++){
//            controlPair = controlArrays[i];
//            if(controlPair.CheckBox.checked && controlPair.DropDown.selectedIndex == 0){
//            }
//        }
//     }
//     
//     function ControlPair(checkBoxId, dropDownId){
//        checkbox = document.getElementById(checkBoxId);
//        dropdown = document.getElementById(dropDownId);
//        this.CheckBox = checkbox;
//        this.DropDown = dropdown;
//     }
      
</script>

<table cellspacing="2" cellpadding="2" border="0">
    <tr>
        <td colspan="2">
            <asiweb:StyledLabel ID="LegacyAccessLevelLabel" runat="server" Text="Legacy Access Level"
                CssClass="mdTitle"></asiweb:StyledLabel>
        </td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="SystemBox" runat="Server" Text="System" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="SystemSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Membership" runat="Server" Text="Membership" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="MembershipSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Dues" runat="Server" Text="Dues" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="DuesSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Events" runat="Server" Text="Events" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="EventsSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="ARCash" runat="Server" Text="A/R Cash" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="ARCashSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Orders" runat="Server" Text="Order Entry" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="OrdersSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Referral" runat="Server" Text="Referral" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="ReferralSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Certification" runat="Server" Text="Certification" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="CertificationSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Fundraising" runat="Server" Text="Fundraising" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="FundraisingSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="Exposition" runat="Server" Text="Exposition" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="ExpositionSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
    <tr>
        <td>
            <asiweb:BusinessCheckBox ID="ServiceCentral" runat="Server" Text="Service Central" /></td>
        <td>
            <asiweb:BusinessDropDownList ID="SCSecurityLevel" runat="Server">
            </asiweb:BusinessDropDownList></td>
    </tr>
</table>
