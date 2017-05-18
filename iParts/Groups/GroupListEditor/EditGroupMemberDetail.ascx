<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditGroupMemberDetail.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.EditGroupMemberDetail" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<div runat="server" visible="false" id="DivLabelErrorMessage">
    <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
</div>
<asiweb:PanelTemplateControl2 ID="GroupMemberEdit" runat="server" FieldSet="true" ShowHeader="false" Collapsible="False" BorderStyle="None">
    
    <div runat="server" ID="RoleInfoDiv" class="AsiInformation" Visible="False">
        <asiweb:BusinessLabel runat="server" ID="RoleInfoMessage"  translate="no"/>
    </div>
    <div runat="server" ID="RoleWarningDiv" class="AsiWarning" Visible="False">
        <asiweb:StyledLabel runat="server" ID="RoleWarningMessage" translate="no"/>
    </div>

    <div class="PanelField" ID="DivRole" runat="server">
        <asiweb:StyledLabel runat="server" ID="LabelRole" CssClass="Required" AssociatedControlID="Role" />
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList ID="Role" runat="server" translate="no" Required="true" AutoPostBack="true" 
                OnSelectedIndexChanged="Role_SelectedIndexChanged" />
            <asiweb:AsiRequiredFieldValidator Text="Required" ID="RoleRequiredFieldValidator" ControlToValidate="Role" runat="server" Enabled="true"  />
        </div>
    </div>
    
    <div class="PanelField" ID="DivReciprocalRole" runat="server">
        <asiweb:StyledLabel runat="server" ID="LabelReciprocalRole" AssociatedControlID="ReciprocalRole" />
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList ID="ReciprocalRole" runat="server" translate="no" OnSelectedIndexChanged="ReciprocalRole_SelectedIndexChanged"/>            
        </div>
    </div>
    <asiweb:BusinessTextBox ID="ContactTitle" runat="server" Visible="False" DisplayCaption="true" RenderPanelField="true" />    
    <asiweb:BusinessCalendar2 ID="EffectiveDate" runat="server" DisplayCaption="true" RenderPanelField="true" Visible="false" />
    <asiweb:BusinessCalendar2 ID="ExpirationDate" runat="server" DisplayCaption="true" RenderPanelField="true" Visible="false" />
    <asp:CompareValidator  ID="ExpirationDateCompareValidator" runat="server" Display="None" Operator="GreaterThanEqual" Enabled="true" ></asp:CompareValidator>

    <div id="buttonDiv" runat="server" >
        <span class="LabelSpacer"></span>
        <asp:Button ID="SaveButton" Text='<%#Asi.ResourceManager.GetPhrase("SaveAndClose","Save & Close") %>' runat="server" CommandName="Save" OnClientClick='disableAndPost();' OnClick="SaveButton_Click" CssClass="TextButton PrimaryButton" />
        <asp:Button ID="CancelButton" Text='<%#Asi.ResourceManager.GetWord("Cancel") %>' runat="server" CommandName="CancelAll" CausesValidation="false" OnClick="CancelButtonClick"  CssClass="TextButton" />		
    </div>
   <div id="summaryDiv" runat="server">
        <asp:ValidationSummary ID="DetailValidationSummary" runat="server" ShowSummary="true" DisplayMode="BulletList"  />
    </div> 
</asiweb:PanelTemplateControl2>
<script type="text/javascript">
    //<![CDATA[    
    function disableAndPost() {
        var isPageValid = Page_IsValid;
        if (isPageValid) {
            <%#Page.ClientScript.GetPostBackEventReference(SaveButton, "") %>;
            document.getElementById('<%#SaveButton.ClientID%>').disabled = "disabled";
            document.getElementById('<%#SaveButton.ClientID%>').value = '<%# Asi.ResourceManager.GetPhrase("Saving", "Saving...") %>';
        }
    }
    //]]>
</script>