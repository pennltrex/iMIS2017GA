<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentList" Codebehind="SegmentList.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false">
    <asp:UpdatePanel ID="TreeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
               <ContentTemplate>
                   <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder> 
              </ContentTemplate>
              <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ListerJobSegments" />
              </Triggers>
    </asp:UpdatePanel>

     <asiweb:Lister2 id="ListerJobSegments" runat="server"
        DisableQueryEdit="true"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/SegmentManagement/DefaultSystem/Queries/SegmentList"
        TargetContentCode="SM.Segment"
        EnableClientSideDelete="false"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"
        DeleteColumnLocation="End"
        AddButtonEnabled="true"
        AddLinkTargetBehavior="NewWindowEachLink"
        AddButtonLocation="TopRight"
        LinkTargetBehavior="NewWindowEachLink"
        AddButtonText="Add Segment"
        UseUniformKey="false"
        LinkTargetHeight="85%"
        LinkTargetWidth="85%"
        DialogWindowCallback="RefreshSegment"
    />
</asiweb:PanelTemplateControl2>

<script type="text/javascript">
    function RefreshSegment() {
        if (window != null)
            window.location.href = window.location.href;
    }
</script>