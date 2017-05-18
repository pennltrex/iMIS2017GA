<%@ Page language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Segment Editor" %>
<%@ Register TagPrefix="uc1" TagName="Segment" Src="~/AsiCommon/Controls/SegmentManagement/Segment.ascx" %>
<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/SegmentManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="uc3" TagName="SegmentTop" Src="~/AsiCommon/Controls/SegmentManagement/SegmentTop.ascx" %>

<asp:Content id="SegmentListContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<uc1:Segment id="Segment2" runat="server"></uc1:Segment>
</asp:Content>
