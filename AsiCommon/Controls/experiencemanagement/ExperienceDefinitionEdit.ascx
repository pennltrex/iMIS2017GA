<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.ExperienceDefinitionEdit" Codebehind="ExperienceDefinitionEdit.ascx.cs" %>

<asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
    Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" >
        <div class="PanelField Left">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="lblProgram" Text="Program" />
            <div class="PanelFieldValue">
                    <asiweb:StyledLabel id="lblProgram" runat="server" />
		    </div>
    	</div>
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" Id="NumberOfUnits" BoundPropertyName="NumberOfUnits" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresGradeFlag" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="RequiresApprovalFlag" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="ExperienceDefinitionStatusCode" DisplayCaption="true" OnDataChange="StatusDataChange"/>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>
