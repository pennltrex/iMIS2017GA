<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupActionPlanEditor" Codebehind="SetupActionPlanEditor.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/ProcessManager/StageCollectionEdit.ascx" TagName="StageCollection" TagPrefix="ProcessBlueprint" %>

<div style="width:99%;">
    <div class="CommandBar">
        <asiWeb:StyledButton ID="btnSaveAs" runat="server" Text="Save As" OnClick="btnSaveAs_Click"/>
    </div>
</div>
        
<asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" TemplateTitle="Action Plan Definition" FieldSet="true" Width="99%">
    <asiweb:SmartControl ID="Name" runat="server" BoundPropertyName="Name" DisplayCaption="true" />
    <asiweb:SmartControl ID="ProcessType" runat="server" BoundPropertyName="OpportunityTypeKey" DisplayCaption="true" DisplayType="EditOnce" ListSearchEnabled="false" RefAtomComponentName="OpportunityType" />
    <asiweb:SmartControl ID="Description" runat="server" BoundPropertyName="Description" DisplayCaption="true" />
</asiweb:PanelTemplateControl>

<ProcessBlueprint:StageCollection ID="stageCollection" runat="server" />
