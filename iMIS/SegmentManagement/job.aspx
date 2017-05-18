<%@ Page language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Segmentation Portfolio" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Register TagPrefix="uc1" TagName="Job" Src="~/AsiCommon/Controls/SegmentManagement/Job.ascx" %>
<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/SegmentManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="uc3" TagName="JobTop" Src="~/AsiCommon/Controls/SegmentManagement/JobTop.ascx" %>
<%@ Register TagPrefix="uc4" TagName="LeftNav" Src="~/AsiCommon/Controls/SegmentManagement/navigation.ascx" %>

<asp:Content id="SegPortfolioContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:job id="Job1" runat="server"></uc1:job>
</asp:Content>
