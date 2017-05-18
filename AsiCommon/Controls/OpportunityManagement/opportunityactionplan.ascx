<%@ Reference Control="~/asicommon/controls/opportunitymanagement/opportunityactionplanstage.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityActionPlan" Codebehind="OpportunityActionPlan.ascx.cs" %>

<script type="text/javascript">
    function EnableChangeStage() {
        if (document.getElementById('<%# CurrentStageList.ClientID %>').selectedIndex != 0) {
            document.getElementById('<%# PreviousStageStatusLabel.ClientID %>').removeAttribute("disabled");
            document.getElementById('<%# PreviousStageStatus.ClientID %>').removeAttribute("disabled");
            document.getElementById('<%# ChangeStageButton.ClientID %>').removeAttribute("disabled");
        }
        else {
            document.getElementById('<%# PreviousStageStatusLabel.ClientID %>').setAttribute("disabled", "disabled");
            document.getElementById('<%# PreviousStageStatus.ClientID %>').setAttribute("disabled", "disabled");
            document.getElementById('<%# ChangeStageButton.ClientID %>').setAttribute("disabled", "disabled");
        }
    }
    // This function is called after creating an Experience is created to refresh the list
    function OpenTaskCallBackFunction(radwindow) {
        if (radwindow.result) {
            var hidden = document.getElementById('<%#newTaskReturn.ClientID %>');
            hidden.value = radwindow.result;
            document.forms[0].submit();
        }
    }
    
</script>

<asp:HiddenField ID="newTaskReturn" runat="server"/>
    
<asiweb:PanelTemplateControl ID="SummaryPanel" runat="server" TemplateTitle="Action Plan Summary" FieldSet="true">
    <div style="display:table; width:100%">
    <div style="display:table-row">
    <asiweb:PanelTemplateColumn ID="SummaryColumn1" runat="server" style="width:49%;">
        <div class="PanelField">
            <asp:Label ID="StatusLabel" runat="server" Text="Status" AssociatedControlID="Status" />
            <asp:Label ID="Status" runat="server" />
        </div>
        <div class="PanelField">
            <asp:Label ID="BeginDateLabel" runat="server" Text="Begin Date" AssociatedControlID="BeginDate" />
            <asp:Label ID="BeginDate" runat="server" />
        </div>
        <div class="PanelField">
            <asp:Label ID="CompletedDateLabel" runat="server" Text="Completed Date" AssociatedControlID="CompletedDate" />
            <asp:Label ID="CompletedDate" runat="server" />
        </div>
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="SummaryColumn2" runat="server">
        <asp:Panel ID="ActionPlanManagementPanel" runat="server" CssClass="PanelField Left">
            <div class="PanelFieldLabel">
                <asp:Label ID="ChangeActionPlanLabel" runat="server" AssociatedControlID="ActionPlanList" Text='<%# Asi.ResourceManager.GetPhrase("ChangeActionPlanLabelText", "Replace Action Plan With") %>' />
            </div>
            <div class="PanelFieldValue">
                <asp:DropDownList ID="ActionPlanList" runat="server"/>
                <asp:Button ID="ChangeActionPlanButton" runat="server" Text="Change Action Plan" OnClick="ChangeActionPlanButton_Click" Enabled="false" />
                <asiweb:InfoControl ID="ChangeActionPlanHelp" runat="server" Text="Select a new action plan for this project and click the Change Action Plan button." />
            </div>
        </asp:Panel>
        <asp:Panel ID="StageManagementPanel" runat="server">
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asp:Label ID="CurrentStageLabel" runat="server" Text="Current Stage" AssociatedControlID="CurrentStageList" />
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="CurrentStageList" runat="server" onchange="EnableChangeStage()"  />
                    <asiweb:InfoControl ID="PreviousStageStatusHelp" runat="server" Text="Select a new stage for this project and select a status for all stages previous to the selected stage.  Click the Change Current Stage button." />
                </div>
            </div>
            <div id="PreviousStagePanel" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asp:Label ID="PreviousStageStatusLabel" runat="server" Text="Update Previous Stage Status" AssociatedControlID="PreviousStageStatus" disabled="disabled" />
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="PreviousStageStatus" runat="server" disabled="disabled" />
                    <asp:Button ID="ChangeStageButton" runat="server" Text="Change Current Stage" OnClick="ChangeStageButton_Click" disabled="disabled" />
                </div>
            </div>
        </asp:Panel>
    </asiweb:PanelTemplateColumn>
    </div>
    </div>
</asiweb:PanelTemplateControl>

<div style="height:5px;">&nbsp;</div>

<asiweb:PanelTemplateControl ID="StagesPanel" runat="server" TemplateTitle="Stages" Collapsible="false">
    <asp:PlaceHolder ID="StagesPlaceHolder" runat="server"></asp:PlaceHolder>
</asiweb:PanelTemplateControl>

<asp:PlaceHolder id='PlaceHolder_editlink' runat='server'/>

