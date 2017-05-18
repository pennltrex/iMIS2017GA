<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentationJobList" AutoEventWireup="true" Codebehind="JobList.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="JobListPanel" runat="server" TemplateTitle="Segmentation Job List" Collapsible="false">

    <asp:placeholder id="Spacer" runat="server" Visible="false"><br /></asp:placeholder> 

    <asp:UpdatePanel ID="TreeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
        <ContentTemplate>
            <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder> 
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ListerJobList"  />
        </Triggers>
    </asp:UpdatePanel>

    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton ID="btnPurgeInactive" runat="server" Text="Purge Inactive" OnClick="btnPurgeInactive_ServerClick" />
    </div>

   <asiweb:Lister2 id="ListerJobList" 
                    DisableQueryEdit="true"
                    runat="server"
                    AjaxEnabled="true" 
                    SortingEnabled="true"
                    PagingEnabled="true"
                    PagerMode="Advanced"
                    PageSize="20"
                    ColumnReorderingEnabled="false"
                    DataSourceDocumentPath="$/SegmentManagement/DefaultSystem/Queries/JobList"
                    DeleteColumnLocation="End"
                    AddButtonLocation="TopRight"
                    AddLinkTargetBehavior="NewWindowEachLink"
                    AddTargetUrl="~/iMIS/SegmentManagement/Job.aspx"
                    TargetUrl="~/iMIS/SegmentManagement/Job.aspx"
                    LinkTargetBehavior="NewWindowAllShare"
                    LinkTargetHeight="95%"
                    LinkTargetWidth="95%"
                    EditColumnLocation="None" 
                    SelectColumnLocation="Beginning"
                    EnableClientSideDelete="False"
                    UseUniformKey="true"
                    AddButtonText="Add a Job"
                    CollapsiblePanelTemplate="False"
                    translate="yes"              
                    DialogWindowCallback="RefreshJobs"
                    />
</asiweb:PanelTemplateControl2>    
<script>
    function RefreshJobs() {
        if (window != null)
            window.location.href = window.location.href;
    }
</script>   