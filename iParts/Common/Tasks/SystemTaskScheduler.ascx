<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SystemTaskScheduler.ascx.cs" Inherits="Asi.Web.iParts.Common.Tasks.SystemTaskScheduler" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="AddTriggerControl" Src="AddTriggerControl.ascx" %>

<asiweb:PanelTemplateControl2 ID="SettingsPanel" ShowHeader="false" BorderStyle="None" runat="server" Translate="Yes">

    <div class="Section">
        <asp:Button ID="RunTaskNowButton" Text="Run Task Now" CssClass="TextButton" runat="server" OnClick="RunTaskNowButton_OnClick"/>
        <asiweb:BusinessLabel runat="server" Text="This process may take several minutes to complete." Font-Italic="True"/>
    </div>
    <div ID="ScheduledTaskPanel" class="NeutralShading ClearFix" runat="server">
         <div class="PanelField AutoWidth FloatNone">
            <asiweb:BusinessCheckbox runat="server" ID="CheckBoxScheduleTask" AutoPostBack="True" OnCheckedChanged="CheckBoxScheduleTask_OnCheckedChanged" Text="Run task on a scheduled basis"/> 
        </div>
        <div class="PanelField">
            <asp:Panel ID="TriggerPanel" runat="server" style="display:none">
                <uc1:AddTriggerControl ID="AddTriggerControl" runat="server"  />
            </asp:Panel>
            </div>
        <div class="PanelField FloatLeft">
            <asp:Button ID="SaveButton" Text="Save" CssClass="TextButton PrimaryButton" runat="server" OnClick="SaveButton_OnClick"/>
            <asp:Button ID="CancelButton" Text="Cancel" CssClass="TextButton" runat="server" OnClick="CancelButton_OnClick"/>
        </div>
    </div>
   
</asiweb:PanelTemplateControl2>

