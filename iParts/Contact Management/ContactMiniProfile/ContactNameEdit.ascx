<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactNameEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactNameEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="ContactNameFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="EditContactName" runat="server" OnDataChange="EditContactNameAllowedChange" AutoPostBack="True"
            BoundPropertyName="EditContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <div class="SubItems"> 
            <asiweb:SmartControl runat="server" ID="IncludePrimaryOrganizationSelectionControl"
                BoundPropertyName="IncludePrimaryOrganizationSelection" DisplayCaption="True"
                OnDataChange="IncludePrimaryOrganizationSelectionChanged" AutoPostBack="True"
                PositionCaption="Right" DataSaveUponStateChange="False" />
            <asiweb:SmartControl runat="server" id="RequirePrimaryOrganizationSelectionControl"
                BoundPropertyName="RequirePrimaryOrganizationSelection" DisplayCaption="True" 
                PositionCaption="Right" DataSaveUponStateChange="False" />
            <asiweb:SmartControl ID="OrganizationListQueryPathControl" runat="server" 
                BoundPropertyName="OrganizationListQueryPath" DisplayCaption="True"
                DataSaveUponStateChange="False" DocumentTypesAllowed="IQD" HIControlType="DocumentPathSelector" />
        </div>
        <asiweb:SmartControl ID="DisplayContactName" runat="server" BoundPropertyName="DisplayContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayContactTitle" runat="server" BoundPropertyName="DisplayContactTitle" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayInstitute" runat="server" BoundPropertyName="DisplayInstitute" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
      
        <div class="AutoWidth">
            <asiweb:SmartControl ID="DisplayMobilePhone" runat="server" BoundPropertyName="DisplayMobilePhone" DisplayCaption="true" PositionCaption="Right"  AutoPostBack="true" DataSaveUponStateChange="false" />
        </div>
        <div class="SubItems">             
            <asiweb:SmartControl ID="MobilePhoneHeading" runat="server" BoundPropertyName="MobilePhoneHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
        </div>
    </div>
</asiweb:PanelTemplateControl>