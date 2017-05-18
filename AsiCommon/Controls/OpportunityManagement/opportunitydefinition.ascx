<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityDefinition" Codebehind="OpportunityDefinition.ascx.cs" %>

<asiweb:PanelTemplateControl ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn id="DefinitionPanelColumn1" runat="server">
        <asiweb:SmartControl ID="Description" runat="server" BoundPropertyName="Description" DisplayCaption="true" TextBoxColumns="40" />
        <asiweb:SmartControl ID="Prospect" runat="server" BoundPropertyName="ProspectKey" DisplayCaption="true" HIControlType="Finder"
            FinderAddTargetUrl="~/AsiCommon/Controls/ContactAdder/Adder.aspx"
            NothingSelectedFormatText='<%# Asi.ResourceManager.GetPhrase("ProcessManager.NoContactSelected", "<i>(no Contact selected)</i>") %>' />
        <asiweb:SmartControl ID="SourceCode" runat="server" BoundPropertyName="SourceCodeKey" DisplayCaption="true" 
            NothingSelectedFormatText='<%# Asi.ResourceManager.GetPhrase("ProcessManager.NoSourceControlSelected", "<i>(no Source Code selected)</i>") %>' />
        <asiweb:SmartControl ID="ExpirationDate" runat="server" BoundPropertyName="ExpirationDate" DisplayCaption="true" />
        <asiweb:SmartControl ID="OpportunityStatusCode" runat="server" BoundPropertyName="OpportunityStatusCode" DisplayCaption="true" />
        <asiweb:SmartControl ID="WinProbability" runat="server" BoundPropertyName="WinProbability" DisplayCaption="true" ListSearchEnabled="false" />
        <asp:PlaceHolder ID="DynamicControls" runat="server"></asp:PlaceHolder>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
