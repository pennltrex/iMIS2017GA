<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.ReviewProgramCompletions" Codebehind="ReviewProgramCompletions.ascx.cs" %>

<script type="text/javascript">
    function ReviewList_Callback(dialogWindow)
    {
        if (dialogWindow.result != "RejectDialog")
            return;

        // Set values to be used during postback.
        var hdnRejectNote = document.getElementById("<%= hdnRejectNote.ClientID %>")
        hdnRejectNote.value = dialogWindow.RejectNote;
        var hdnRejectKey = document.getElementById("<%= hdnRejectKey.ClientID %>")
        hdnRejectKey.value = dialogWindow.RejectKey;

        // Trigger a postback .
        InitiateControlEventWithArgument('<%= rejectTrigger.ClientID %>', "");       
    }
</script>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Program completions" ShowHeader="True" Collapsible="False" BorderStyle="None">

    <input type="hidden" id="hdnRejectNote" runat="server" />
    <input type="hidden" id="hdnRejectKey" runat="server" />

    <div class="FloatRight" style="padding-bottom:10px;">
        <asiweb:StyledButton id="btnCheckForCompletions" runat="server" OnClick="CheckForCompletionsClick" />
        <asiweb:StyledButton id="btnApproveAll" runat="server" OnClick="ApproveAllClick" />
    </div>
    
    <asiweb:Lister2 runat="server" ID="ReviewList"
        AjaxEnabled="false"
        SortingEnabled="true"
        PagingEnabled="true"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/ReviewProgramCompletions"
        Custom1ColumnLocation="End"
        Custom1TargetBehavior="RaiseEvent"
        Custom2ColumnLocation="End"
        Custom2TargetBehavior="NewWindowEachLink"
        Custom2TargetUrl="~/AsiCommon/Controls/CertificationManagement/ReviewProgramCompletionsReject.aspx"
        Custom2TargetHeight="180"
        Custom2TargetWidth="280"
        DialogWindowCallback="ReviewList_Callback"
        OnItemDataBound="ReviewListItemDataBound"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
         />
     
    <asp:Button runat="server" id="rejectTrigger" style="display:none" Text="Reject Trigger" aria-hidden="true"></asp:Button>
    
</asiweb:PanelTemplateControl2>
