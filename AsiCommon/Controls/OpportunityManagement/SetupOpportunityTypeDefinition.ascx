<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupOpportunityTypeDefinition" Codebehind="SetupOpportunityTypeDefinition.ascx.cs" %>
 
<asp:PlaceHolder runat="server" ID="ErrorMsgPlaceHolder"/>

  <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
  
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server">
  
		<asiweb:SmartControl id="scName" runat="server" DisplayCaption="true" BoundPropertyName="Name" DisplayType="EditableField" />
		<asiweb:SmartControl id="scDescription" runat="server" DisplayCaption="true" BoundPropertyName="Description" />
        
	    <asiweb:SmartControl id="scOpportunityClass_Editable" runat="server" DisplayCaption="true" BoundPropertyName="OpportunityClass" DisplayType="EditableField"/>
	    <asiweb:SmartControl id="scOpportunityClass_ReadOnly" runat="server" DisplayCaption="true" BoundPropertyName="OpportunityClass" DisplayType="ReadOnlyField" />

        <div class="PanelField Left">
	        <asp:Label ID="lblActionPlan" runat="server" AssociatedControlID="ActionPlanList" Text="Default Action Plan"/>
	        <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="ActionPlanList" runat="server" BoundPropertyName="DefaultActionPlanKey"/>
	        </div>
        </div>
        
	    <asiweb:SmartControl ID="DefaultOwnerControl" runat="server" DisplayCaption="true" BoundPropertyName="DefaultOwnerKey" DisplayType="EditableField" />

	    <div class="PanelField Left">
	        <asp:Label ID="lbOwnerRoleNames" runat="server" AssociatedControlID="tbOwnerRoleNames" Text="Owner Roles" />
            <div class="PanelFieldValue" id="tbOwnerRoleNames" runat="server">
			    <table cellspacing="0" cellpadding="0" border="0">
				    <tr>
					    <td>
						    <asp:listbox id="lstOwnerRoleNames" runat="server" width="180px" rows="4"></asp:listbox></td>
					    <td style="width:25px;padding-left:15px;">
					        <asiweb:StyledButton id="btnOwnerRoleNamesAdd" Text="<" CausesValidation="false" runat="server" /><br />
						    <asiweb:StyledButton id="btnOwnerRoleNamesRemove" Text=">" CausesValidation="false" runat="server" />
					    </td>
					    <td style="padding-left:5px;">
						    <asp:textbox id="txtOwnerRoleNamesEdit" runat="server" Width="140"></asp:textbox></td>
                    </tr>
			    </table>
			</div>
        </div>
	    <div class="PanelField Left">	    
	        <asp:Label ID="lbContactRoleNames" runat="server" AssociatedControlID="tbContactRoleNames" Text="Contact Roles" />
            <div class="PanelFieldValue" id="tbContactRoleNames" runat="server">
			    <table cellspacing="0" cellpadding="0" border="0">
				    <tr>
					    <td>
						    <asp:listbox id="lstContactRoleNames" runat="server" width="180px" rows="4"></asp:listbox></td>
					    <td style="width:25px;padding-left:15px;">
					        <asiweb:StyledButton id="btnContactRoleNamesAdd" Text="<" CausesValidation="false" runat="server" /><br />
						    <asiweb:StyledButton id="btnContactRoleNamesRemove" Text=">" CausesValidation="false" runat="server" />
					    </td>
					    <td style="padding-left:5px;">
						    <asp:textbox id="txtContactRoleNamesEdit" runat="server" Width="140"></asp:textbox></td>
                    </tr>
			    </table>
			</div>
		</div>
				
        <asiweb:SmartControl id="scAllowCompetitors" runat="server" DisplayCaption="true" BoundPropertyName="AllowCompetitorsFlag" />
        
        <div class="PanelField Left">
            <asp:Label ID="lblProjectAccess" runat="server" AssociatedControlID="SmartControl5" Text="Grant Project Access" />
	        <asiweb:StyledButton id="btnAssignCreators" Text="..." CausesValidation="false" runat="server" />
	        <asiweb:SmartControl ID="SmartControl5" runat="server" BoundPropertyName="OpportunityCreationGroupKey" DisplayType="None" />
	    </div>
	    
      </asiweb:PanelTemplateColumn>
    
</asiweb:PanelTemplateControl>
