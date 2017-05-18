<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NrdsConfigurationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Nrds.NrdsConfigurationDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true">
<telerik:RadAjaxPanel ID="ajaxPanel1" runat="server" LoadingPanelID="loadingPanel" >
	<asiweb:BusinessLabel ID="loadingError" runat="server" CssClass="Error" Visible="false" />
	<asp:Button runat="server" id="refreshTrigger" style="display:none" Text=""></asp:Button>
	<asp:Panel ID="credentialsPanel" runat="server" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent">    
		<div id="credentials" runat="server">
			<table class="FullWidth">
			<tbody class="ContentBorder">
			<tr class="ContentBorder">
				<td colspan="2">
				<h4 class="SectionLabel"><asiweb:StyledLabel ID="credentialsTitle" runat="server" Text="NAR Host Credentials" RenderPanelField="true" DisplayCaption="false"/></h4>
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="associationId" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="userName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="senderId" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="hostName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" CssClass="AutoWidth" />
				</td>
			</tr>            
			</tbody>
			</table>
		</div>
		<div>&nbsp;&nbsp;</div>
		<div id="requestQueue" runat="server">                     
			<table class="FullWidth">
			<tbody class="ContentBorder">
			<tr class="ContentBorder">
				<td colspan="2">
				<asiweb:StyledLabel runat="server" ID="requestTitle" DisplayCaption="true" RenderPanelField="true" PositionCaption="Left" />  
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="requestChannel" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="requestPort" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="requestQMgrName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />                
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="requestQName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			</tbody>
			</table>
		</div>
		<div>&nbsp;&nbsp;</div>
		<div id="replyQueue" runat="server">
			<table class="FullWidth">
			<tbody class="ContentBorder">
			<tr class="ContentBorder">
				<td colspan="2">
				<asiweb:StyledLabel runat="server" ID="replyTitle" DisplayCaption="true" RenderPanelField="true" PositionCaption="Left" />
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="replyChannel" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="replyPort" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="replyQMgrName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />                
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="replyQName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>                
			</tbody>
			</table>           
		</div>
		<div>&nbsp;&nbsp;</div>
		<div id="subQueue" runat="server">
			<table class="FullWidth">
			<tbody class="ContentBorder">
			<tr class="ContentBorder">
				<td colspan="2">
				<asiweb:StyledLabel runat="server" ID="subQueueTitle" DisplayCaption="true" RenderPanelField="true" PositionCaption="Left" />
				 </td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="subChannel" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="subPort" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			<tr>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="subQMgrName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
				<td class="TwoColumns AutoScroll">
				<asiweb:StyledLabel ID="subQName" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
				</td>
			</tr>
			</tbody>
			</table>
		</div>  
		<div>&nbsp;&nbsp;</div>      
	 </asp:Panel>
	<asp:Panel ID="policyPanel" runat="server" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent">
    <asiweb:PanelTemplateControl ID="MemberConfig" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" BorderWidth="0" Width="100%">
        <asiweb:PanelTemplateColumn ID="MemberCol1" runat="server" LabelWidth="12em" Width="25em" >
            <div class="PanelField">
                <asiweb:StyledLabel ID="MemberTypeMappingsHeading" runat="server" AssociatedControlID="MemberTypeMappingsSection" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="MemberTypeMappingsSection" runat="server">
                <asiweb:StyledLabel ID="memberTypeAff" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeDR" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeN" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeR" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeRA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberTypeS" runat="server" RenderPanelField="true" DisplayCaption="true"  />
            </div>
            <div class="PanelField">
                <asiweb:StyledLabel ID="MemberStatusMappingsHeading" runat="server" AssociatedControlID="MemberStatusMappingsSection" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="MemberStatusMappingsSection" runat="server">
                <asiweb:StyledLabel ID="memberStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberStatusP" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberStatusS" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberStatusT" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="memberStatusX" runat="server" RenderPanelField="true" DisplayCaption="true" /> 
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="MemberCol2" runat="server">
            <asiweb:StyledLabel ID="memberIdMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="memberIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asiweb:StyledLabel ID="memberHomeAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="memberMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:StyledLabel ID="memberHomePhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="memberCellPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="memberPersonalFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:StyledLabel ID="memberEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:StyledLabel ID="memberPostSyncSP" runat="server" RenderPanelField="true" DisplayCaption="true" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
    <asiweb:PanelTemplateControl ID="OfficeConfig" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" BorderWidth="0">
        <asiweb:PanelTemplateColumn ID="OfficeCol1" runat="server" Width="25em" >
            <asiweb:StyledLabel ID="officeMemberType" runat="server" RenderPanelField="true" DisplayCaption="true" />            
            <div class="PanelField">
                <asiweb:StyledLabel ID="officeCategoriesHeader" runat="server" RenderPanelField="true" DisplayCaption="true" AssociatedControlID="officeCategories" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="officeCategories" runat="server">
                <asiweb:StyledLabel ID="branchTypeB"  runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="branchTypeM" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="branchTypeS" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
            <div class="PanelField">
                <asiweb:StyledLabel ID="OfficeStatusMappingsHeading" runat="server" AssociatedControlID="OfficeStatusMappingsSection" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="OfficeStatusMappingsSection" runat="server">
                <asiweb:StyledLabel ID="officeStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="officeStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="officeStatusT" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="OfficeCol2" runat="server" >
            <asiweb:StyledLabel ID="officeIdMap" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asiweb:StyledLabel ID="officeIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asiweb:StyledLabel ID="officeStreetAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:StyledLabel ID="officeMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:StyledLabel ID="officePhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:StyledLabel ID="officeAdditionalPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:StyledLabel ID="officeFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:StyledLabel ID="officeEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="officePostSyncSP" runat="server" RenderPanelField="true" DisplayCaption="true" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
	<asiweb:PanelTemplateControl ID="AssociationConfig" runat="server" ShowHeader="true"  Collapsible="false" Collapsed="false" BorderWidth="0">
        <asiweb:PanelTemplateColumn ID="AssociationCol1" runat="server" Width="25em" >
            <asiweb:StyledLabel ID="associationMemberType" runat="server" RenderPanelField="true" DisplayCaption="true" />                        
            <div class="PanelField">
                <asiweb:StyledLabel ID="AssociationStatusMappingsHeading" runat="server" AssociatedControlID="AssociationStatusMappingsSection" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="AssociationStatusMappingsSection" runat="server">
                <asiweb:StyledLabel ID="associationStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="associationStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="associationStatusD" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:StyledLabel ID="associationStatusC" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="AssociationCol2" runat="server" >
            <asiweb:StyledLabel ID="associationIdMap" runat="server" RenderPanelField="true" DisplayCaption="true"/>
            <asiweb:StyledLabel ID="associationIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true"/>
            <asiweb:StyledLabel ID="associationStreetAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:StyledLabel ID="associationMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:StyledLabel ID="associationPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:StyledLabel ID="associationEOFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:StyledLabel ID="associationFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:StyledLabel ID="associationEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>	
	 </asp:Panel>
</telerik:RadAjaxPanel>
</asp:Panel>
<asp:Panel ID="contentPanelEdit" runat="server" Visible="false" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent">
	<asiweb:BusinessLabel ID="errorText" runat="server" CssClass="Error" Visible="false" />
	<table class="FullWidth">
	<tbody class="ContentBorder">
       <tr class="ContentBorder">
				<td colspan="2">
				<h4 class="SectionLabel"><asiweb:StyledLabel ID="editCredentialsTitle" runat="server" Text="NAR Host Credentials" RenderPanelField="true" DisplayCaption="false"/></h4>
				</td>
		</tr>
		<tr>
			<td><asiweb:BusinessTextBox runat="server" ID="txtAssociationId" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtSenderId" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>       
			<td><asiweb:BusinessTextBox runat="server" ID="txtUserName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtPassword" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" TextMode="Password" /></td>
		</tr>
		<tr>
			<td colspan="4"><asiweb:BusinessTextBox runat="server" ID="txtHostName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
		</tr>
	</tbody>
	</table>
	<div>&nbsp;</div>
	<table class="FullWidth">
	<tbody class="ContentBorder">
		<tr>
			<td colspan="4" class="ContentBorder"><asiweb:StyledLabel runat="server" ID="requestLabel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/></td>  
		</tr>
		<tr>                 
			<td><asiweb:BusinessTextBox runat="server" ID="txtRequestChannel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtRequestPort" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />
			<asp:RangeValidator ID="requestPortRangeValidator" runat="server"  ControlToValidate="txtRequestPort" Type="Integer"  Display="Dynamic" MinimumValue="0" MaximumValue="65550"></asp:RangeValidator>            
			</td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtRequestQMgrName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtRequestQName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
		</tr>
	</tbody>
	</table>
	<div>&nbsp;</div>
	<table class="FullWidth">
	<tbody class="ContentBorder">
		<tr>
			<td colspan="4" class="ContentBorder"><asiweb:StyledLabel runat="server" ID="replyLabel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/></td>                   
		</tr>
		<tr>
			<td ><asiweb:BusinessTextBox runat="server" ID="txtReplyChannel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtReplyPort" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />
			<asp:RangeValidator ID="replyPortRangeValidator" runat="server"  ControlToValidate="txtReplyPort" Type="Integer"  Display="Dynamic" MinimumValue="0" MaximumValue="65550"></asp:RangeValidator>
			</td>       
			<td><asiweb:BusinessTextBox runat="server" ID="txtReplyQMgrName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtReplyQName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
		</tr>
	</tbody>
	</table>
	<div>&nbsp;</div>
	<table class="FullWidth">
	<tbody class="ContentBorder">
		<tr>
			<td colspan="4" class="ContentBorder"><asiweb:StyledLabel runat="server" ID="subQueueLabel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" /></td>                   
		</tr>
		<tr>
			<td><asiweb:BusinessTextBox runat="server" ID="txtSubChannel" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtSubPort" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />
			 <asp:RangeValidator ID="subPortRangeValidator" runat="server"  ControlToValidate="txtSubPort" Type="Integer"  Display="Dynamic" MinimumValue="0" MaximumValue="65550"></asp:RangeValidator>
			</td>       
			<td><asiweb:BusinessTextBox runat="server" ID="txtSubQMgrName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
			<td><asiweb:BusinessTextBox runat="server" ID="txtSubQName" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" /></td>
		</tr>
	</tbody>
	</table>
	<div>&nbsp;</div>
    	
    <asiweb:PanelTemplateControl ID="selectedMemberConfig" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" BorderWidth="0" Width="100%" translate="yes">
        <asiweb:PanelTemplateColumn ID="selectMemberCol1" runat="server" LabelWidth="12em" Width="30em" >
            <div class="PanelField">
                <asiweb:StyledLabel ID="selectMemberTypeMappingsHeading" runat="server" AssociatedControlID="selectMemberTypeMappings" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="selectMemberTypeMappings" runat="server">
                <asiweb:BusinessTextBox ID="selectMemberTypeAff" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeDR" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeN" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeR" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeRA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberTypeS" runat="server" RenderPanelField="true" DisplayCaption="true"  />
            </div>
            <div class="PanelField">
                <asiweb:StyledLabel ID="selectMemberStatusMappingsHeading" runat="server" AssociatedControlID="selectMemberStatusMappings" CssClass="AutoWidth" />
            </div>            
            <div class="SubItems" id="selectMemberStatusMappings" runat="server">
                <asiweb:BusinessTextBox ID="selectMemberStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberStatusP" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberStatusS" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberStatusT" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectMemberStatusX" runat="server" RenderPanelField="true" DisplayCaption="true" /> 
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="selectMemberCol2" runat="server">
            <asiweb:BusinessDropDownList ID="selectMemberIdMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:BusinessTextBox ID="selectMemberIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asp:RegularExpressionValidator ID="MemberIdPrefixValidator" runat="server" ControlToValidate="selectMemberIdPrefix" Display="Dynamic" 
            ValidationExpression="(\s|.){0,5}" ></asp:RegularExpressionValidator>
            <asiweb:BusinessDropDownList ID="selectMemberHomeAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:BusinessDropDownList ID="selectMemberMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:BusinessDropDownList ID="selectMemberHomePhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:BusinessDropDownList ID="selectMemberCellPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:BusinessDropDownList ID="selectMemberPersonalFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:BusinessDropDownList ID="selectMemberEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="false" />
            <asiweb:BusinessTextBox ID="selectMemberPostSyncSP" runat="server" RenderPanelField="true" DisplayCaption="true" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
    <asiweb:PanelTemplateControl ID="selectOfficeConfig" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" BorderWidth="0">
        <asiweb:PanelTemplateColumn ID="selectOfficeCol1" runat="server" Width="30em" >
            <div class="PanelField">            
            <label class="PanelFieldValue Required" id="LabelOfficeMemberType" runat="server">Office member type</label>                    
            <div class="PanelFieldValue" >
            <asiweb:BusinessTextBox ID="selectOfficeMemberType" runat="server" />  
            <asiweb:AsiRequiredFieldValidator ID="OfficeTypeValidator" runat="server" ControlToValidate="selectOfficeMemberType" ErrorMessage="Required Field"
             Enabled="False"></asiweb:AsiRequiredFieldValidator>         
            </div>
            </div>
            <div class="PanelField">
                <asiweb:StyledLabel ID="selectOfficeCategoriesHeader" runat="server" RenderPanelField="true" DisplayCaption="true" AssociatedControlID="selectOfficeCategories" CssClass="AutoWidth" />
            </div>
            <div class="SubItems" id="selectOfficeCategories" runat="server">
                <asiweb:BusinessTextBox ID="selectedBranchTypeB" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectedBranchTypeM" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectedBranchTypeS" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
            <div class="PanelField">
                <asiweb:StyledLabel ID="selectOfficeStatusMappingsHeading" runat="server" AssociatedControlID="selectOfficeStatusMappingsSection" CssClass="AutoWidth" />
            </div>           
            <div class="SubItems" id="selectOfficeStatusMappingsSection" runat="server">
                <asiweb:BusinessTextBox ID="selectOfficeStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectOfficeStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectOfficeStatusT" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="selectOfficeCol2" runat="server" >
            <asiweb:StyledLabel ID="selectOfficeIdMap" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asiweb:BusinessTextBox ID="selectOfficeIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asp:RegularExpressionValidator ID="OfficeIdPrefixValidator" runat="server" ControlToValidate="selectOfficeIdPrefix" Display="Dynamic"
             ValidationExpression="(\s|.){0,5}" ></asp:RegularExpressionValidator>
            <asiweb:BusinessDropDownList ID="selectOfficeStreetAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:BusinessDropDownList ID="selectOfficeMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectOfficePhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectOfficeAdditionalPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectOfficeFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:BusinessDropDownList ID="selectOfficeEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
            <asiweb:BusinessTextBox ID="selectOfficePostSyncSP" runat="server" RenderPanelField="true" DisplayCaption="true" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
    <asiweb:PanelTemplateControl ID="selectAssociationConfig" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" BorderWidth="0">
        <asiweb:PanelTemplateColumn ID="selectAssociationCol1" runat="server" Width="30em" >
            <div class="PanelField">            
            <label class="PanelFieldValue Required" id="LabelAssociationMemberType" runat="server">Association member type</label>                    
            <div class="PanelFieldValue" >
            <asiweb:BusinessTextBox ID="selectAssociationMemberType" runat="server" />  
            <asiweb:AsiRequiredFieldValidator ID="AssociationTypeValidator" runat="server" ControlToValidate="selectAssociationMemberType" ErrorMessage="Required Field"
             Enabled="False"></asiweb:AsiRequiredFieldValidator>         
            </div>
            </div>           
            <div class="PanelField">
                <asiweb:StyledLabel ID="selectAssociationStatusMappingsHeading" runat="server" AssociatedControlID="selectAssociationStatusMappingsSection" CssClass="AutoWidth" />
            </div>           
            <div class="SubItems" id="selectAssociationStatusMappingsSection" runat="server">
                <asiweb:BusinessTextBox ID="selectAssociationStatusA" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectAssociationStatusI" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectAssociationStatusD" runat="server" RenderPanelField="true" DisplayCaption="true" />
                <asiweb:BusinessTextBox ID="selectAssociationStatusC" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="selectAssociationCol2" runat="server" >
            <asiweb:StyledLabel ID="selectAssociationIdMap" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asiweb:BusinessTextBox ID="selectAssociationIdPrefix" runat="server" RenderPanelField="true" DisplayCaption="true" />
            <asp:RegularExpressionValidator ID="AssociationIdPrefixValidator" runat="server" ControlToValidate="selectAssociationIdPrefix" Display="Dynamic"
             ValidationExpression="(\s|.){0,5}" ></asp:RegularExpressionValidator>
            <asiweb:BusinessDropDownList ID="selectAssociationStreetAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>
			<asiweb:BusinessDropDownList ID="selectAssociationMailAddressMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectAssociationPhoneMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectAssociationEOFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
			<asiweb:BusinessDropDownList ID="selectAssociationFaxMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true" />
            <asiweb:BusinessDropDownList ID="selectAssociationEmailMap" runat="server" RenderPanelField="true" DisplayCaption="true" ShowNullItem="true"/>            
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
</asp:Panel>       
                      