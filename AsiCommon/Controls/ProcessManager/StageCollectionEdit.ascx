<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ProcessManager.StageCollectionEdit" Codebehind="StageCollectionEdit.ascx.cs" %>
<%@ Register Src="StageEdit.ascx" TagName="Stage" TagPrefix="ProcessBlueprint" %>

    <script type="text/javascript">
    
    function ActionItemEditCallBackFunction(window)
    {
        var input = document.getElementById('<%# ActionItemEditReturnValues.ClientID %>');
        input.value = window.result;
    }
    
    function ActionItemEditCloseFunction(window)
    {
        var button = document.getElementById('<%# hiddenButton.ClientID %>');
        button.click();
    }
    
    function btnDelete_OnClientClick(stageId)
    {
        var input = document.getElementById('<%# btnDelete_StageID.ClientID %>');
        input.value = stageId;
    }
    
    function btnUp_OnClientClick(stageId)
    {
        var input = document.getElementById('<%# btnUp_StageID.ClientID %>');
        input.value = stageId;
    }
    
    function btnDown_OnClientClick(stageId)
    {
        var input = document.getElementById('<%# btnDown_StageID.ClientID %>');
        input.value = stageId;
    }
    
    </script>

<asiweb:StyledButton ID="hiddenButton" OnClick="hiddenButton_Click" style="display:none" runat="server" />
<input type="hidden" id="ActionItemEditReturnValues" runat="server" />
<input type="hidden" id="btnDelete_StageID" runat="server" />
<input type="hidden" id="btnUp_StageID" runat="server" />
<input type="hidden" id="btnDown_StageID" runat="server" />

<ProcessBlueprint:Stage ID="completionStage"
        StageId='<%# (ProcessBlueprint.CompletionStage != null)? ProcessBlueprint.CompletionStage.ID : "" %>' 
        IsCertificationStage='<%# IsCertificationProcess %>'  runat="server" />

<asiweb:PanelTemplateControl2 ID="pnlProcessBluerint" runat="server" TemplateTitle='<%# Asi.ResourceManager.GetWord("Stages") %>' FieldSet="true" Collapsible="false" BorderStyle="None" >

    <div class="CommandBar">
        <asp:Button ID="btnAddStage" runat="server" CssClass="TextButton" Text='<%# Asi.ResourceManager.GetPhrase("AddStage", "Add Stage") %>' OnClick="btnAddStage_Click" />
    </div>

    <ajaxToolKit:Accordion id="StagesContainer" runat="server" AutoSize="None" FadeTransitions="true"
        HeaderCssClass="StageHeader StageSetup" ContentCssClass="PanelBody" CssClass="StageBlock">
    </ajaxToolKit:Accordion>

</asiweb:PanelTemplateControl2>
