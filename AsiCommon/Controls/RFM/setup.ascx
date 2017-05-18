<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.Setup" Codebehind="Setup.ascx.cs" %>
<%@ Register TagPrefix="asi" TagName="SetupGroupList" Src="~/asicommon/controls/shared/groups/setupgrouplist.ascx" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 runat="server" ID="RFMSetupPanel" Collapsible="false" TemplateTitle="RFM security groups">
    <asi:SetupGroupList ID="RFMGroupList" runat="server" 
        SelectFromListerDocumentPath="$/Common/Queries/Search/CsContact" />
</asiweb:PanelTemplateControl2>
