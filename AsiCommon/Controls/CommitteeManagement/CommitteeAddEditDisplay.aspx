<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommitteeAddEditDisplay.aspx.cs" Inherits="Asi.Web.UI.Common.CommitteeManagement.CommitteeAddEditDisplay" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <telerik:RadAjaxPanel runat="server">
        <asiweb:PanelTemplateControl2 ID="CommitteeEditTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="false">
            <div class="PanelField" runat="server" id="EditCommitteeNameDiv">
                <asp:Label runat="server" Text="Name" AssociatedControlID="CommitteeNameTb" CssClass="Required"></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="CommitteeNameTb" MaxLength="60" CssClass="InputLarge"/>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required" ID="CommitteeNameValidator" ControlToValidate ="CommitteeNameTb"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="PanelField Left" runat="server" id="EditCommitteeCodeDiv">
                <asp:Label runat="server" Text="Code" AssociatedControlID="CommitteeCodeTb" ID="CommitteeCodeLabel" CssClass="Required"></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="CommitteeCodeTb" MaxLength="15"/>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required" ID="CommitteeCodeValidator" ControlToValidate ="CommitteeCodeTb"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="PanelField Left">
                <asp:Label runat="server" ID="LabelStatus" Text="Status" AssociatedControlID="CommitteeStatusDropDown"></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" TranslateOnlyCaptionAndToolTip="True" ID="CommitteeStatusDropDown"/>
                </div>
            </div>
            <div ID="GroupDiv" class="PanelField Left" runat="server">
                <asp:Label runat="server" ID="LabelGroup" Text="Group" AssociatedControlID="CommitteeGroupDropDownList"></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" TranslateOnlyCaptionAndToolTip="True" ID="CommitteeGroupDropDownList"/>
                </div>
            </div>       
            <div class="PanelField Left">
                <asp:Label runat="server" Text="Description" AssociatedControlID="CommitteeDescriptionTb" CssClass="Required"></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputXLarge" Height="100px" ID="CommitteeDescriptionTb" runat="server" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required" ID="CommitteeDescriptionValidator" ControlToValidate="CommitteeDescriptionTb"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="PanelField Left">
                <asp:Label runat="server" Text="Notes" AssociatedControlID="CommitteeNotesTb" ></asp:Label>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox CssClass="InputXLarge" Height="200px" ID="CommitteeNotesTb" runat="server" TextMode="MultiLine" />              
                </div>
            </div>
        </asiweb:PanelTemplateControl2>
    </telerik:RadAjaxPanel>   
</asp:Content>