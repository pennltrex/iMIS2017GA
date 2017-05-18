<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.ExperienceDefinitionSummary" Codebehind="ExperienceDefinitionSummary.ascx.cs" %>

<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" >
        <div class="PanelField Left">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="lnkProgram" Text="Program" />
            <div class="PanelFieldValue">
    		    <asiweb:StyledHyperlink id="lnkProgram" runat="server" />
		    </div>
    	</div>
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" id="NumberOfUnits" BoundPropertyName="NumberOfUnits" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresGradeFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApprovalFlag" DisplayCaption="true" DisplayType="ReadOnlyField"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceDefinitionStatusCode" DisplayCaption="true" DisplayType="ReadOnlyField"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
