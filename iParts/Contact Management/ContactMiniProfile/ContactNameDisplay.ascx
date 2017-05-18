<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactNameDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactNameDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" TagName="PrimaryOrgSelector" src="~/iParts/Contact Management/PrimaryOrganizationSelector/PrimaryOrganizationSelectorDisplay.ascx" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true" CssClass="ClearFix" BorderStyle="None" BackColor="Transparent">
   
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel">
    
        <asp:Button runat="server" id="refreshTrigger" style="display:none" Text="text"></asp:Button>        

        <div id="divFullName" class="BreakWord" runat="server">
            <asiweb:StyledLabel CssClass="SectionLabel" ID="fullName" runat="server" RenderPanelField="true" DisplayCaption="false"/>
        </div>        
        <div id="divTitle" runat="server">
            <asiweb:StyledLabel ID="contactTitle" runat="server" RenderPanelField="true" DisplayCaption="false"/>
        </div>    
        <div id="divInstitute" runat="server">
            <asiweb:StyledLabel ID="institute" runat="server" RenderPanelField="true" DisplayCaption="false"/>
            <asiweb:StyledHyperlink runat="server" ID="InstituteNameLink" RenderPanelField="true" DisplayCaption="false" />
            <asiweb:StyledLabel ID="primaryInstitute" runat="server" RenderPanelField="true" DisplayCaption="false" Visible="False"/>
        </div>
        <div id="divMobilePhone" runat="server">
            <asiweb:StyledLabel ID="mobilePhone" runat="server" RenderPanelField="true"  PositionCaption="Top"/>
        </div>
    </telerik:RadAjaxPanel>    
</asp:Panel>

<asp:Panel ID="contentPanelContactEdit" runat="server" Visible="false" translate="yes">
                                      
    <table class="Form">
    <tbody>
        <tr runat="server" id="tableRow0" visible="true">
            <td colspan="5">
                &nbsp;<asiweb:StyledLabel runat="server" ID="labelOrganizationName" CssClass="Required" AssociatedControlID="txtOrganizationName" />
            </td>
        </tr>
        <tr runat="server" id="tableRow1" visible="true">
            <td colspan="5">
                <asiweb:BusinessTextBox runat="server" ID="txtOrganizationName" RenderPanelField="true" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="requiredOrganizationName" ControlToValidate="txtOrganizationName" /><br />&nbsp;
            </td>
        </tr>
        <tr runat="server" id="tableRow2" visible="true">
            <td colspan="5"><asiweb:StyledLabel runat="server" ID="labelPrimaryContact" /></td>
        </tr>
        <tr runat="server" id="tableRow3" visible="true">
            <td><asiweb:BusinessDropDownList runat="server" ID="ddlPrefix" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" TranslateOnlyCaptionAndToolTip="True"/></td>
            <td><asiweb:BusinessTextBox runat="server" ID="txtFirstName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
            <td><asiweb:BusinessTextBox runat="server" ID="txtMiddleName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" Width="100px" /></td>
            <td><asiweb:BusinessTextBox runat="server" ID="txtLastName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
            <td><asiweb:BusinessDropDownList runat="server" ID="ddlSuffix" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" TranslateOnlyCaptionAndToolTip="True"/></td>
        </tr>
        <tr runat="server" id="tableRow4" visible="true">
            <td colspan="2"><asiweb:BusinessTextBox runat="server" ID="txtDesignation" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
            <td colspan="3"><asiweb:BusinessTextBox runat="server" ID="txtTitle" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
        </tr>
        <tr runat="server" id="tableRow5" visible="true">
            <td colspan="2"><asiweb:BusinessTextBox runat="server" ID="txtInformalName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
            <td colspan="3"><asiweb:BusinessTextBox runat="server" ID="txtFullName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" Enabled="false" ReadOnly="true" Width="98%" /></td>
        </tr>
        <tr runat="server" id="tableRow6" Visible="true">
            <td colspan="5">
                <asp:UpdatePanel runat="server" ID="PrimaryOrganizationUpdatePanel" RenderMode="Block">
                    <ContentTemplate>
                        <asiweb:PrimaryOrgSelector runat="server" id="primaryOrganizationSelector" CssClass="PanelNoPadding" OnPrimaryOrganizationSelectionChanged="PrimaryOrganizationSelectionChanged" PrimaryOrganizationSelectorComboBoxAutoPostback="true" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>            
        </tr>
        <tr runat="server" id="tableRow7" Visible="True">
            <td colspan="5">
                <asiweb:BusinessListBox runat="server" ID="OrganizationsListBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Top" ShowNullItem="true" />
            </td>
        </tr>
        <tr runat="server" id="tableRow8" Visible="True">
            <td colspan="5">
                <asiweb:BusinessTextBox runat="server" ID="txtMobilePhone" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />
            </td>
        </tr>
    </tbody>
    </table>
</asp:Panel>
<script>jQuery('div').removeClass('ContentItemContainer');</script>