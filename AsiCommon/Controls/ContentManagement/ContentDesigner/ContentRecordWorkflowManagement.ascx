<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentRecordWorkflowManagement" Codebehind="ContentRecordWorkflowManagement.ascx.cs" %>

<script type="text/javascript">
    function ExpirationDate_InitLayout(numDays)
    {
        var expirationDateROPanel = $('<%= ExpirationDateROSpan.ClientID %>');
        var expirationDate = $('<%= ExpirationDate.ClientID %>');
        if (numDays <= 0)
        {
            expirationDateROPanel.style.display = 'none';
            expirationDate.style.display = 'block';
        }
        else
        {
            expirationDateROPanel.style.display = 'block';
            expirationDate.style.display = 'none';
        }
    }
    function NumDaysBeforeExpBox_Change(textBox)
    {
        var numDays = 0; 
        if (textBox.value.length > 0)
            numDays = parseInt(textBox.value);
            
        ExpirationDate_InitLayout(numDays);
            
        if (numDays > 0)
        {
            SetExpirationDateRO(numDays);
        }
        else
        {
            $('<%= ExpirationDate.ClientID %>_Calendar_TextBox').focus();
        }
    }
    function SetExpirationDateRO(numDays)
    {
        PageMethods.ContentRecordEditPageMethod('GetExpireDateRO', '<%= SubjectUniformKey.ToString() %>', numDays + '', '<%= PageInstanceKey.ToString()%>', SetExpirationDateRO_Succeeded, OnFailed);
    }
    function SetExpirationDateRO_Succeeded(result, userContext, methodName)
    {
        var expirationDateROLabel = $('<%= ExpirationDateRO.ClientID %>');
        expirationDateROLabel.innerText = result;
    }
    function OnFailed(error, userContext, methodName)
    {
        if(error !== null) 
        {
            alert('Action failed (' + methodName + '): ' + error._message);
        }
        else
        {
            alert('Action failed without an error message (' + methodName + ').');
        }
    }
</script>

<div class="PanelField AutoWidth">
    <asp:Panel id="OwnerPanel" runat="server" CssClass="PanelField">
        <asiweb:BusinessLabel ID="OwnerCaption" runat="server" AssociatedControlID="OwnerList" />
        <asiweb:BusinessDropDownList ID="OwnerList" runat="server" BoundPropertyName="WorkflowOwnerGroupMemberKey" />
    </asp:Panel>

    <asiweb:SmartControl ID="NumDaysBeforeExpBox" runat="server" BoundPropertyName="WorkflowDaysBeforeExpire" OnClientChange="NumDaysBeforeExpBox_Change(this)" DisplayCaption="false" style="float:left;" TextBoxWidth="50px" >
        <asiweb:StyledLabel ID="NumberOfDaysExpAfterLabel" runat="server" Text="&nbsp;days after last published" AssociatedControlID="<%#NumDaysBeforeExpBox.PrincipalControlID%>" style="float:right;" />
    </asiweb:SmartControl>
    <asiweb:SmartControl ID="ExpirationDate" runat="server" BoundPropertyName="WorkflowExpireDate" DisplayCaption="true" />
    <div id="ExpirationDateROSpan" runat="server" class="PanelField">
        <asiweb:BusinessLabel ID="ExpirationDateROCaption" runat="server" AssociatedControlID="ExpirationDateRO" />
        <asiweb:BusinessLabel ID="ExpirationDateRO" runat="server" CssClass="PanelFieldValue" />
    </div>
    <div class="PanelField AutoWidth">
        <div style="clear:left;">
            <asiweb:SmartControl ID="RecycleAtExpiration" runat="server" BoundPropertyName="WorkflowRecycleAtExpiration" DisplayCaption="true" PositionCaption="Right" style="float:left;" />
        </div>
    </div>

    <asp:PlaceHolder id='PlaceHolder_editlink' runat='server'/>
</div>