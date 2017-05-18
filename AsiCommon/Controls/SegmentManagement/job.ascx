<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.Job" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Job.ascx.cs" %>
<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/SegmentManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="Job" TagName="Summary" Src="~/AsiCommon/Controls/SegmentManagement/JobSummary.ascx" %>
<%@ Register TagPrefix="Job" TagName="Definition" Src="~/AsiCommon/Controls/SegmentManagement/JobDefinition.ascx" %>
<%@ Register TagPrefix="Job" TagName="NSelect" Src="~/AsiCommon/Controls/SegmentManagement/JobNselect.ascx" %>
<%@ Register TagPrefix="Job" TagName="Security" Src="~/AsiCommon/Controls/SegmentManagement/JobSecurity.ascx" %>
<%@ Register TagPrefix="Job" TagName="Segments" Src="~/AsiCommon/Controls/SegmentManagement/Segmentlist.ascx" %>

<asiweb:PanelTemplateControl2 ID="JobPanel" runat="server" Collapsible="false">
    <asiweb:TitleBar ID="TitleBar" runat="server" DoNotTranslateTitle="True"></asiweb:TitleBar>
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    
    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton ID="btnCreateSegments" runat="server" />
        <asiweb:StyledButton ID="btnPurge" runat="server" />
        <asiweb:StyledButton ID="btnSaveAs" runat="server" />
        <uc2:taskbuttons id="TB1" runat="server" ButtonPortfolioType="Job"/>
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop"  
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" >
        <Tabs>
            <telerik:RadTab Text="Summary" PageViewID="SummaryPage" Value="0" />
            <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" Value="1" />
            <telerik:RadTab Text="n-Select" PageViewID="NSelectPage" Value="2" />
            <telerik:RadTab Text="Segments" PageViewID="SegmentsPage" Value="3" />
            <telerik:RadTab Text="Security" PageViewID="SecurityPage" Value="4" /> 
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server"
        CssClass="ContentTabbedDisplay" RenderSelectedPageOnly="true">

        <telerik:RadPageView runat="server" ID="SummaryPage">
            <Job:Summary ID="Summary" runat="server" /> 
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="DefinitionPage">
            <Job:Definition ID="Definition" runat="server" /> 
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="NSelectPage">
            <Job:NSelect ID="NSelect" runat="server" />   
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SegmentsPage">
            <Job:Segments ID="Segments" runat="server" />    
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="SecurityPage">
            <Job:Security ID="Security" runat="server" />
        </telerik:RadPageView>

    </telerik:RadMultiPage>

    <div style="white-space:nowrap; text-align:right;padding-top:5px; width:100%;">
        <asiweb:StyledButton ID="btnSave" class="TextButtonWithImage Save" runat="server" CommandButtonType="Save" />
        <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" />
    </div>

</asiweb:PanelTemplateControl2>