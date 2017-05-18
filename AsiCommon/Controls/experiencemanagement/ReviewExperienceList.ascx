<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ExperienceManagement_ReviewExperienceList" Codebehind="ReviewExperienceList.ascx.cs" %>

<script type="text/javascript">
    function ReviewList_Callback(dialogWindow)
    {
        if (dialogWindow.result != "RejectDialog")
            return;

        // Set values to be used during postback.
        var hdnRejectAction = document.getElementById("<%= hdnRejectAction.ClientID %>");
        hdnRejectAction.value = dialogWindow.RejectAction;
        var hdnRejectNote = document.getElementById("<%= hdnRejectNote.ClientID %>");
        hdnRejectNote.value = dialogWindow.RejectNote;
        var hdnRejectKey = document.getElementById("<%= hdnRejectKey.ClientID %>");
        hdnRejectKey.value = dialogWindow.RejectKey;

        // Trigger a postback .
        InitiateControlEventWithArgument('<%= rejectTrigger.ClientID %>', "");
    }
</script>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Requirement completions" ShowHeader="True" Collapsible="False" BorderStyle="None">

    <input type="hidden" id="hdnRejectAction" runat="server" />
    <input type="hidden" id="hdnRejectNote" runat="server" />
    <input type="hidden" id="hdnRejectKey" runat="server" />
    
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    
    <div class="FloatRight" style="padding-bottom:10px;">
        <asiweb:StyledButton ID="btnApproveAll" OnClick="ApproveAllCommand" CommandName="ApproveAll" runat="server" />
    </div>
    <div style="clear: both;"></div> 
  
    <asiweb:Lister2 runat="server" ID="ReviewList"
        AjaxEnabled="false"
        SortingEnabled="true"
        PagingEnabled="true"
        BorderStyle="None"
        CollapsiblePanelTemplate="False"
        ColumnReorderingEnabled="false"
        LinkTargetBehavior="NewWindowAllShare"
        TargetUrl="~/Core/AccountManagement/CustomerExperiencesEdit.aspx"
        Custom1ColumnLocation="End"
        Custom1TargetBehavior="RaiseEvent"
        Custom2ColumnLocation="End"
        Custom2TargetBehavior="NewWindowEachLink"
        Custom2TargetUrl="~/AsiCommon/Controls/ExperienceManagement/ReviewExperienceReject.aspx"
        Custom2TargetHeight="300"
        Custom2TargetWidth="400" 
        DialogWindowCallback="ReviewList_Callback"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/ReviewExperienceList"
        SelectColumnLocation="None"
        LinkProperty="Program"
        DisableQueryEdit="true"
        TargetUrlKeyParameterName="iCustomerExperienceKey" 
        TargetWindowTitle="Reject"
         />
     
    <asp:Button runat="server" id="rejectTrigger" style="display:none" Text="Reject Trigger" aria-hidden="true"></asp:Button>

</asiweb:PanelTemplateControl2>