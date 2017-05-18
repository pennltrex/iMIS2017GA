<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.OfferingSummary" Codebehind="OfferingSummary.ascx.cs" %>
<asiweb:PanelTemplateControl2 ID="TablePanel1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn runat="server" LabelWidth="14em">
        <asp:Panel id="pnlExperienceDefinition" runat="server" Visible="false">
            <div class="PanelField Left">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="lnkExperience" Text="Experience" />
                <div class="PanelFieldValue">
                    <asiweb:StyledHyperlink id="lnkExperience" runat="server" />
		        </div>
        	</div>
            <div class="PanelField Left">
                <asp:Label ID="Label2" runat="server" AssociatedControlID="lnkProgram" Text="Program" />
                <div class="PanelFieldValue">
                    <asiweb:StyledHyperlink id="lnkProgram" runat="server" />
	    	    </div>
    	    </div>
        </asp:Panel>
        <asp:Panel id="pnlCertificationModule" runat="server" Visible="false">
            <div class="PanelField Left">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="lnkCertificationModule" Text="Component" />
                <div class="PanelFieldValue">
                    <asiweb:StyledHyperlink id="lnkCertificationModule" runat="server" />
	    	    </div>
        	</div>
        </asp:Panel>
        <asiweb:SmartControl runat="server" BoundPropertyName="Name" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Code" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" BoundPropertyName="StatusCode" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Date" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" ID="allowChangesControl" BoundPropertyName="AllowChanges" DisplayCaption="true" DisplayType="ReadOnlyField"/> 
        <asiweb:SmartControl runat="server" BoundPropertyName="Provider" DisplayCaption="true" DisplayType="ReadOnlyField" />
        <asiweb:SmartControl runat="server" BoundPropertyName="Location" DisplayCaption="true" DisplayType="ReadOnlyField" />
       
  </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>

<asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Display" UseParentAtomObject="true" 
    PropertiesToHide="Name, Code, Description, Provider, StatusCode, Date, Location, MarkedForDeleteOn, CreatedByUserKey, 
        CreatedOn, UpdatedByUserKey, UpdatedOn, ExperienceDefinitionKey, OfferingKey"
        ColumnLabelWidth="14em" HideIfNoProperties="true" />
