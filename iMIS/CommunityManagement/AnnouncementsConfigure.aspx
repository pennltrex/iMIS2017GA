<%@ Page Language="C#" AutoEventWireup="true" Inherits="iMIS_CommunityManagement_AnnouncementsConfigure" Codebehind="AnnouncementsConfigure.aspx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Forum/ForumConfigure.ascx" TagPrefix="Cmty" TagName="ForumConfigure" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Forum/AnnouncementConfigure.ascx" TagPrefix="Cmty" TagName="AnnouncementConfigure" %>

<asp:Content id="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <Cmty:ForumConfigure ID="ForumConfigure1" runat="server"></Cmty:ForumConfigure>
    <Cmty:AnnouncementConfigure ID="ForumConfigure2" runat="server"></Cmty:AnnouncementConfigure>
</asp:Content>
