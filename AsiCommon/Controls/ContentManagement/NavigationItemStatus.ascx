<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_NavigationItemStatus" Codebehind="NavigationItemStatus.ascx.cs" %>

<asp:Panel id="NotPublishedPanel" runat="server" visible="False" CssClass="PanelField">
    <asiweb:BusinessLabel ID="NotPublishedCaption" runat="server" AssociatedControlID="NotPublished" />
    <asiweb:BusinessLabel ID="NotPublished" runat="server" Text="Not yet published" />
</asp:Panel>
<asiweb:SmartControl ID="PublishedDateTimeDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="PublishedDateTime" DisplayCaption="true"  />
<asiweb:SmartControl ID="UpdatedByDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="UpdatedByUserKey" DataTextField="FullName" DisplayCaption="true" RefBusinessObjectType="User" />
<asiweb:SmartControl ID="UpdatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="UpdatedOn" DisplayCaption="true" />
<asiweb:SmartControl ID="CreatedByDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="CreatedByUserKey" DataTextField="FullName" DisplayCaption="true" RefBusinessObjectType="User"/>
<asiweb:SmartControl ID="CreatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="CreatedOn" DisplayCaption="true" />
<!-- HACK: set the target on the link to popup new window when the user clicks on it using javascript.  Need to just create another property on SmartControl, WebAddressTarget -->
<asiweb:SmartControl ID="PostPublishUrlDisplay" runat="server" DisplayType="ReadOnlyField" BoundPropertyName="ResolvedURL" DisplayCaption="true" UseParentControlBusinessItem="false" OnClientMouseDown="this.target='_blank'" ToolTip='<%# Asi.ResourceManager.GetWord("View the target of this navigation item") %>' translate="no"/>
