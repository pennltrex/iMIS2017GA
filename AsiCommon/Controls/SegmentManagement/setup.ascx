<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.Setup" Codebehind="Setup.ascx.cs" %>
<%@ Register TagPrefix="asi" TagName="SetupGroupList" Src="~/asicommon/controls/shared/groups/setupgrouplist.ascx" %>

<asiweb:PanelTemplateControl2 ID="SegSetupPanel" runat="server"
    Collapsible="false" TemplateTitle="Segmentation security groups">
    <asi:SetupGroupList runat="server" ID="SetupGroupList1" />
</asiweb:PanelTemplateControl2>