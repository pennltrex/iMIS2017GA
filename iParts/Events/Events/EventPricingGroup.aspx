<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventPricingGroup.aspx.cs" Inherits="Asi.Web.iParts.Events.EventPricingGroup" %>
<%@ Import Namespace="Asi" %>
<%@Register tagPrefix="asiweb" namespace="Asi.Web.UI.WebControls" assembly="Asi.Web"  %>

<asp:Content ContentPlaceHolderID="TemplateBody" ID="ContentPanel" runat="server">
    <asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="False" Collapsible="false" ScrollBars="None" BorderStyle="None" >
        <asp:UpdatePanel ID="PricingGroupPanel" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <asp:Panel runat="server" ID="AddOptionsPanel" Visible="False">
            <div class="Section">
                <asiweb:StyledRadioButton runat="server" ID="UseExistingRadioButton" GroupName="PricingGroup" Value="0" AutoPostBack="True" Text='<%# ResourceManager.GetPhrase("UseExistingPricingGroup", "Use existing pricing group")%>' OnCheckedChanged="PricingGroup_CheckedChanged" />
            </div>
            <div class="Section">
                <asiweb:BusinessDropDownList runat="server" ID="ExistingPriceSheetsDropDownList" RenderPanelField="False" Visible="False" />
            </div>
            <div class="Section">
                <asiweb:StyledRadioButton runat="server" ID="AddNewRadioButton" GroupName="PricingGroup" Value="1" AutoPostBack="True" Checked="True" Text='<%# ResourceManager.GetPhrase("AddNewPricingGroup", "Add new pricing group")%>'  OnCheckedChanged="PricingGroup_CheckedChanged" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="AddNewPanel">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="DisplayNameLabel" AssociatedControlID="DisplayNameTextBox" CssClass="Required" Text='<%# ResourceManager.GetPhrase("DisplayName", "Display name")%>' />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="DisplayNameTextBox" RenderPanelField="False" Required="True" onchange="javascript:DisplayNameUpdate()" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="DisplayNameRequiredValidator" ControlToValidate="DisplayNameTextBox" CssClass="Important" Display="Dynamic" SetFocusOnError="True"></asiweb:AsiRequiredFieldValidator>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="GroupTypeLabel" AssociatedControlID="GroupTypeDropDownList" Text='<%# ResourceManager.GetPhrase("GroupType", "Group type")%>' />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" ID="GroupTypeDropDownList" RenderPanelField="False" AutoPostBack="True" OnSelectedIndexChanged="GroupTypeDropDownList_SelectedIndexChanged"/>
                </div>
            </div>
            <div class="PanelField Left" id="Div1">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="GroupLabel" Text='<%# ResourceManager.GetPhrase("Group", "Group")%>'  />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:MultiSelectControl2 runat="server" ID="GroupSelector" RenderPanelField="False" Height="150px" Width="300px" AutoPostBack="True" />
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="RoleLabel" Visible="False" Text='<%# ResourceManager.GetPhrase("Role", "Role")%>' />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:MultiSelectControl2 runat="server" ID="RoleSelector" RenderPanelField="False" Visible="False" Height="150px" Width="300px" AutoPostBack="True" />
                </div>
            </div>        
            <div class="PanelField Left">
                 <div runat="server" ID="PreviewDiv" class="NeutralShading">
                     <asiweb:StyledLabel runat="server" ID="DisplayNamePreview" CssClass="TextBold"></asiweb:StyledLabel> 
                     <asiweb:BusinessLiteral runat="server" ID="PreviewLiteral" />
                 </div>
            </div>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </asiweb:PanelTemplateControl2>                        
<script type="text/javascript">
    function DisplayNameUpdate() {
        if (!jQuery("#<%=PreviewDiv.ClientID%>").is(':visible')) {
            jQuery("#<%=PreviewDiv.ClientID%>").show();
        }
        jQuery("#<%=DisplayNamePreview.ClientID%>").html('<b>' + jQuery("#<%=DisplayNameTextBox.ClientID%>").val() + '</b>');
    }
</script>
</asp:Content>


        