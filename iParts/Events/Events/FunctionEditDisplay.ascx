<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FunctionEditDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.FunctionEditDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiCommon" TagName="FileUpload" Src="Common/BusinessFileUpload.ascx" %>
<%@ Register TagPrefix="event" TagName="Pricing" Src="EventFunctionPricing.ascx" %>
<%@ Register TagPrefix="asiCommon1" TagName="AccountInfo1" Src="Common/AccountingInformation.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FormQuestions" Src="~/iParts/Communications/FormDefinition/FormDefinitionDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ProgramOrganizer" Src="ProgramOrganizerDisplay.ascx" %>

<style>
    .HtmlEditorDescription .reToolbarWrapper,
    .HtmlEditorDescription .reToolZone,
    .HtmlEditorDescription .reToolCell,
    .HtmlEditorDescription .reLeftVerticalSide,
    .HtmlEditorDescription .reRightVerticalSide {
        display: none !important;
    }

    .HtmlEditorDescription .reContentCell {
        border: none !important;
    }
</style>
<%@ Import Namespace="Asi" %>

<asiweb:PanelTemplateControl2 ID="ContentPanel" runat="server" Visible="true" translate="yes" BorderStyle="None" Collapsible="false">
	<asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
	<div runat="server" id="DivData">
		<asp:HiddenField runat="server" ID="HiddenTitle" />
		<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" 
			SelectedIndex="0" Visible="true" CausesValidation="False">
			<Tabs>
				<telerik:RadTab Text='<%# ResourceManager.GetWord("Info") %>' Value="info" />
				<telerik:RadTab Text='<%# ResourceManager.GetWord("Pricing") %>' Value="pricing" />
				<telerik:RadTab Text='<%# ResourceManager.GetWord("Accounting") %>' Value="accounting" />
				<%-- questions tab is dynamically added if v100 --%>
			</Tabs>
		</telerik:RadTabStrip>
		<telerik:RadMultiPage ID="RadMultipage1" runat="server" SelectedIndex="0">
			<telerik:RadPageView ID="RadPageViewInfo" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
				<asiweb:PanelTemplateControl2 ID="PanelGeneralInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("GeneralInfo", "General information") %>'
					Collapsible="false" FieldSet="true" ShowBorder="False">
					
						<div class="PanelField Left" id="DivCode" runat="server">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelCode" CssClass="Required" AssociatedControlID="TextCode"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessTextBox runat="server" ID="TextCode" MaxLength="60" />
								<asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="TextCode" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
							</div>
						</div>

						<div class="PanelField Left">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelName" CssClass="Required" AssociatedControlID="TextName"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessTextBox runat="server" ID="TextName" MaxLength="60" CssClass="InputXLarge" />
								<asiweb:AsiRequiredFieldValidator runat="server" ID="RfvName" ControlToValidate="TextName" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
							</div>
						</div>

						<div class="PanelField Left" id="DivRegType" runat="server">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelRegType" CssClass="Label"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue AutoWidth">
								<asp:RadioButtonList runat="server" ID="RadioRegType" RepeatDirection="Vertical" AutoPostBack="True">
								</asp:RadioButtonList>
							</div>
						</div>
						<div class="PanelField">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelDescription" CssClass="Label" />
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessHtmlEditor ID="TextDescription" CssClass="HtmlEditorDescription InputXLarge" EditModes="Design" Height="100px" RenderPanelField="false" runat="server" Width="400px" />                        						
								<asiweb:BusinessTextBox runat="server" ID="TextFacility" RenderPanelField="true" TextMode="MultiLine" Rows="3" MaxLength="200" Visible="False"/>
							</div>
						</div>
						
						<div class="PanelField Left">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelStartDate" aria-hidden="true"  CssClass="Label" />
							</div>
							<div class="PanelFieldValue">
								<asiweb:StyledLabel runat="server" ID="CalendarStartDateLabel" Text="Start Date" CssClass="screen-reader-text" AssociatedControlID="CalendarStartDate"></asiweb:StyledLabel>
								<asiweb:BusinessCalendar2 runat="server" ID="CalendarStartDate" UseSqlDateTimeMinValue="true" DisplayCaption="False" />
								<asiweb:StyledLabel runat="server" id="CalendarStartTimeLabel" Text="Start Time" CssClass="screen-reader-text" AssociatedControlID="CalendarStartTime"></asiweb:StyledLabel>
								<asiweb:BusinessCalendar2 runat="server" ID="CalendarStartTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
								<asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
								<asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsg" />
								<asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>
							</div>
						</div>
						
						<div class="PanelField Left">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelEndDate" aria-hidden="true" CssClass="Label" />
							</div>
							<div class="PanelFieldValue">
								<asiweb:StyledLabel runat="server" id="CalendarEndDateLabel" Text="End Date" CssClass="screen-reader-text" AssociatedControlID="CalendarEndDate"></asiweb:StyledLabel>
								<asiweb:BusinessCalendar2 runat="server" ID="CalendarEndDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
								<asiweb:StyledLabel runat="server" id="CalendarEndTimeLabel" Text="End Time" CssClass="screen-reader-text" AssociatedControlID="CalendarEndTime"></asiweb:StyledLabel>
								<asiweb:BusinessCalendar2 runat="server" ID="CalendarEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
							</div>
						</div>
						
						<asp:Panel runat="server" id="DivConflictOptions" Visible="false">
							<div class="PanelField AutoWidth">    
								<asiweb:BusinessCheckBox runat="server" ID="EnableTimeConflicts" class="PanelFieldValue FloatNone" />
								<asp:Label runat="server" ID="EnableTimeConflictsLabel" AssociatedControlID="EnableTimeConflicts" Text='<%# ResourceManager.GetPhrase("EnableTimeConflicts", "Enable time-based itinerary conflicts")%>'/>                           
							</div>
							<div class="PanelField">
								<div class="PanelFieldLabel">
									<asiweb:StyledLabel ID="ConflictCodeListLabel" runat="server" Text="Conflict codes" CssClass="Label"></asiweb:StyledLabel>        
								</div>
								<div class="PanelFieldValue">
									<asiweb:MultiSelectControl2 ID="ConflictCodeList" Width="22em" NoneSelectedText="Add or select conflict codes" CreateOptionText="Add conflict code" CreateOption="True" SkipNoResults="True" PersistentCreateOption="True" runat="server">
									</asiweb:MultiSelectControl2>
									<asp:HiddenField ID="HiddenMultiSelectControl" runat="server"/>
								</div>
							</div>
							<div class="PanelField Left" runat="server" id="DivLegacyConflictCode" Visible="false">
								<div class="PanelFieldLabel">
									<asp:Label runat="server" ID="LabelLegacyConflictCode" CssClass="Label" text='<%# ResourceManager.GetPhrase("LegacyConflictCode", "Legacy conflict code")%>'></asp:Label>
								</div>
								<div class="PanelFieldValue">
									<asp:Label runat="server" ID="LabelLegacyConflictCodeValue"></asp:Label>   
								</div>
							</div>                        
						</asp:Panel>

						<div class="PanelField Left" runat="server" id="DivCapacity">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelCapacity" AssociatedControlID="TextCapacity"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessTextBox runat="server" ID="TextCapacity" MaxLength="6" CssClass="InputSmall" />
								<asp:RangeValidator ID="CapacityRangeValidator" runat="server" MinimumValue="1" MaximumValue="999999" Type="Integer" Display="Dynamic"
									ControlToValidate="TextCapacity" ValidationGroup='<%# UniqueID %>'
									ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Must be a positive number (or blank for unlimited).")  %>' />
							</div>
						</div>
						<div class="PanelField Left" runat="server" id="DivMaxQty">
							<div style="display: inline;">
								<asiweb:StyledLabel runat="server" ID="LabelMaxQty" AssociatedControlID="TextMaxQty"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessTextBox runat="server" ID="TextMaxQty" MaxLength="3" CssClass="InputSmall"/>
								<asp:RangeValidator runat="server" ID="MaxQtyRangeValidator" MinimumValue="1" MaximumValue="127" Type="Integer" Display="Dynamic"
									ControlToValidate="TextMaxQty" ValidationGroup ='<%# UniqueID %>'
									ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.MaxQtyInteger","Must be a number from 1 to 127.") %>'></asp:RangeValidator>
							</div>
						</div>
                        <asiweb:BusinessCheckBox runat="server" ID="CheckboxPrintTickets" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right" />
						<asiweb:BusinessTextBox runat="server" ID="TextCategory" RenderPanelField="true" DisplayCaption="true" MaxLength="60" />
						<asiweb:BusinessTextBox runat="server" ID="TextTrack" RenderPanelField="true" DisplayCaption="true" MaxLength="60" />
						<div class="PanelField Left" runat="server" id="DivSortSequence">
							<div style="display: inline;">
									<asiweb:StyledLabel runat="server" ID="LabelSortSequence" AssociatedControlID="TextSortSequence"></asiweb:StyledLabel>
							</div>
							<div class="PanelFieldValue">
								<asiweb:BusinessTextBox runat="server" ID="TextSortSequence"  MaxLength="10" CssClass="InputSmall" />
								<asp:RangeValidator ID="SortSequenceRangeValidator" runat="server" MinimumValue="0" MaximumValue="999999" Type="Integer" Display="Dynamic"
									ControlToValidate="TextSortSequence" ValidationGroup='<%# UniqueID %>'
									ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Must be a positive number (or blank for unlimited).")  %>' />
							</div>
						</div>
                        <asp:UpdatePanel runat="server" ID="ContinuingEducationUnitsPanel" Visible="False">
                            <ContentTemplate>
                            <div class="PanelField Right">
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessCheckBox runat="server" ID="AwardEducationUnits" OnCheckedChanged="AwardEducationUnits_OnCheckedChanged" AutoPostBack="true" />
                                </div>
                                <asiweb:StyledLabel runat="server" ID="AwardEducationUnitsLabel" AssociatedControlID="AwardEducationUnits" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.AwardContinuingEducation", "Award continuing education units to attendees when event is closed")%>'></asiweb:StyledLabel>
                            </div>
                            <div runat="server" id="UnitsOptions">
                                <div class="PanelField Left SubItems" >
                                    <div class="PanelField Left" >
	                                    <asiweb:StyledLabel AssociatedControlID="UnitsTypeDropDownList" ID="UnitsTypeLabel" runat="server" Text="Continuing education type" />
	                                    <div class="PanelFieldValue">
                                            <asiweb:BusinessDropDownList id="UnitsTypeDropDownList" runat="server" ShowNullItem="True" />        
	                                    </div>
                                    </div>   
                                    <div class="PanelField Left" >
							            <div style="display: inline;">
								            <asiweb:StyledLabel runat="server" ID="UnitsToAwardLabel" AssociatedControlID="UnitsToAwardTextBox" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.CeuUnit", "Units to award")%>'></asiweb:StyledLabel>
							            </div>
							            <div class="PanelFieldValue">
								            <asiweb:BusinessTextBox runat="server" ID="UnitsToAwardTextBox" MaxLength="6" CssClass="InputSmall" Required="True" />
                                            <asp:RegularExpressionValidator runat="server" ID="UnitsToAwardValidator" ControlToValidate="UnitsToAwardTextBox" Display="Dynamic" SetFocusOnError="True" />
							            </div>
                                    </div>
                                </div>
                            </div>
                            </ContentTemplate>
						</asp:UpdatePanel>
					<div class="PanelField Left">
						<div style="display: inline;">
						    <label runat="server" id="LabelImageUrl" for="<%# SelectImageUrl.ClientID%>"></label>
						</div>
						<div class="PanelFieldValue">
							<asp:UpdatePanel ID="uc2" runat="server">
								<ContentTemplate>
									<div class="Section">
										<asiweb:BusinessDropDownList id="SelectImageUrl" runat="server" OnSelectedIndexChanged="ImageUrlDropDownListSelectedIndexChanged" AutoPostBack="true" />
									</div>
									<%--Loading image may take long time, we don't want to match it with timeouts, instead we fire Fix Panel Height once image is downloaded to the client--%>
									<%--OnLoadClientScript="try{PanelTemplateControl_FixInitialHeight();}catch(exc){}"--%>
									<asp:Panel class="Section" runat="server" id="PanelImageControl">
										<asiweb:StyledImage id="ImageControl" runat="server" Width="200" />
									</asp:Panel>
									<div id="altTextDiv" runat="server" class="Section"> 
										<asiweb:StyledLabel ID="ImageAltTextLabel" runat="server" AssociatedControlID="ImageAltText" CssClass="PanelFieldLabel"/>                   
										<div class="PanelFieldValue">
											<asiweb:BusinessTextBox runat="server" ID="ImageAltText" DisplayCaption="True" PositionCaption="Left"></asiweb:BusinessTextBox>                        
										</div>
									</div>                                                               
									<span id="LabelUploadNewImage" runat="server" class="PanelFieldLabel Label"><%# ResourceManager.GetPhrase("UploadNewImage", "Upload new image")%></span>
									<div style="margin-top: 0 !important;">
										<asiCommon:FileUpload id="BusinessFileUploadControl" runat="Server" OnFileUploaded="FileUploadControlFileUploaded" AllowedExtensions=".jpg,.jpeg,.gif" />
									</div>
								</ContentTemplate>
								<Triggers>
									<asp:AsyncPostBackTrigger ControlID="BusinessFileUploadControl" />
								</Triggers>
							</asp:UpdatePanel>
						</div>
					</div>
				</asiweb:PanelTemplateControl2>
				<asiweb:PanelTemplateControl2 ID="PanelTags" runat="server" TemplateTitle='<%# ResourceManager.GetWord("Tags") %>'
					Collapsible="False" ShowBorder="False">
					<asiweb:TagSelector ID="TagSelector" runat="server"></asiweb:TagSelector>
				</asiweb:PanelTemplateControl2>
				<asiweb:PanelTemplateControl2 ID="PanelAdditionalInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("AdditionalInfo", "Additional information") %>'
					Collapsible="False" ShowBorder="False">
					<%--Using inline styles is not perfect, however HTML Editor will not be displayed correctly unless it is displayed within a block--%>
					<asiweb:BusinessHtmlEditor runat="server" ID="HtmlAdditionalInfo" style="display:block;margin-left:auto;margin-right:auto;margin-top:1.5em;margin-bottom:1.5em;width:95%;" />
				</asiweb:PanelTemplateControl2>
			</telerik:RadPageView>
			<telerik:RadPageView ID="RadPageViewPricing" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
				<asiweb:PanelTemplateControl2 ID="PanelPricing" runat="server" ShowHeader="false" FieldSet="true" ShowBorder="False">
					<event:Pricing ID="Pricing" runat="server" />
				</asiweb:PanelTemplateControl2>
			</telerik:RadPageView>
			<telerik:RadPageView ID="AccountingPageView" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
				<asiweb:PanelTemplateControl2 ID="AccountingPanel" runat="server" ShowHeader="false"
					FieldSet="true" ShowBorder="False">   
					<asiCommon1:AccountInfo1 ID="AccountInfo" runat="server" ></asiCommon1:AccountInfo1>
				</asiweb:PanelTemplateControl2>
			</telerik:RadPageView>
			<telerik:RadPageView ID="QuestionsPageView" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
				<uc1:FormQuestions runat="Server" id="ProgramItemQuestions" ShowBorder="False"/>
			</telerik:RadPageView>
			<telerik:RadPageView ID="ProgramOrganizerView" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
				<uc2:ProgramOrganizer runat="Server" id="ProgramOrganizer" ShowBorder="False"/>
			</telerik:RadPageView>
		</telerik:RadMultiPage>
	</div>
	<div runat="server" id="DesignTimeDetails" visible="false">
		<asiweb:StyledLabel runat="server" ID="EventConfigurationMessage" Visible="false" />
	</div>
</asiweb:PanelTemplateControl2>
<div runat="server" id="DivErrors">
    <asiweb:BusinessLabel runat="server" ID="LabelError" CssClass="Error"></asiweb:BusinessLabel>
</div>
