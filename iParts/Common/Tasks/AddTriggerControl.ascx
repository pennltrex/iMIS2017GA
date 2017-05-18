<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddTriggerControl.ascx.cs" Inherits="Asi.Web.iParts.Common.Tasks.AddTriggerControl" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<style scoped>
    span.InlineRb label {
        width: 5em;
    }
</style>
<asiweb:PanelTemplateControl2 ID="TriggerTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="false">
	
	<div class="PanelField ">
		<div class="PanelFieldValue AutoWidth FloatNone">
			<asp:CheckBox ID="TriggerEnabledCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" />
		</div>
	</div>        
	
	<asp:Panel ID="TriggerTypesPanel" runat="server">
		<div class="PanelField">
			<div style="display:inline;">
				<asiweb:StyledLabel runat="server" ID="TriggerTypeLabel" 
					AssociatedControlID="TriggerTypeScheduleRadioButton"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:StyledRadioButton ID="TriggerTypeScheduleRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
					RenderPanelField="true" Checked="true" AutoPostBack="true" GroupName="TriggerType"/>
				<asiweb:StyledRadioButton ID="TriggerTypeSystemEventRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
					RenderPanelField="true" Checked="false" AutoPostBack="true" GroupName="TriggerType" />
				<asiweb:StyledRadioButton ID="TriggerTypeDataChangeRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
					RenderPanelField="true" Checked="false" AutoPostBack="true" GroupName="TriggerType" />
			</div>
		</div>          
		<div style="clear:both;"></div>  
	</asp:Panel>
	
	<asp:UpdatePanel ID="ScheduleTriggerPanel" UpdateMode="Conditional" runat="server" Visible="false">
		<ContentTemplate>
			
			<div class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="FrequencySelect" ID="FrequencyLabel" runat="server" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList ID="FrequencySelect" runat="server" OnSelectedIndexChanged="UpdateScheduleControls" AutoPostBack="True" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:InfoControl ID="TimeHelp" runat="server" Visible="False" Translate="no"/>
			</div>
			</div>
	
			<div runat="server" ID="ScheduleDiv" class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="ScheduleTextBox" ID="ScheduleLabel" runat="server" />
				</div>
				<div class="PanelFieldValue">
					Run every 
					<telerik:RadNumericTextBox Type="Number" showspinbuttons="true" MinValue="1" MaxValue="999"  
						incrementsettings-interceptarrowkeys="true" 
						incrementsettings-interceptmousewheel="true" 
						runat="server" id="ScheduleTextBox" width="55">
						<NumberFormat AllowRounding="false" KeepNotRoundedValue="false" DecimalDigits="0" />
					</telerik:RadNumericTextBox>
					<div runat="server" ID="ScheduledFrequency" style="display:inline;"></div>
					<asiweb:BusinessCalendar2 runat="server" ID="DailyTime" ControlType="TimePicker" UseSqlDateTimeMinValue="true" DisplayTimeZone="True" />
				</div>
			</div>
				
			<div runat="server" ID="WeeklyDiv" class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="WeeklySelect" ID="WeeklyLabel" runat="server" CssClass="Required" />
				</div>
				<div class="PanelFieldValue">                        
					<telerik:RadComboBox ID="WeeklySelect" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="False" EnableTextSelection="True" DropDownAutoWidth="Enabled" />
					<asiweb:AsiRequiredFieldValidator runat="server" ID="WeeklySelectValidator" ControlToValidate="WeeklySelect" CssClass="Important"/>
				</div>
			</div>
				
			<div runat="server" ID="MonthlyDiv" class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="MonthlySelect" ID="MonthlyLabel" runat="server" CssClass="Required" />
				</div>
				<div class="PanelFieldValue">
					<telerik:RadComboBox ID="MonthlySelect" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="False"  EnableTextSelection="True" DropDownAutoWidth="Enabled" OnClientItemChecked="CheckSelectedMonthValue"/>
					<asiweb:AsiRequiredFieldValidator runat="server" ID="MonthlySelectValidator" ControlToValidate="MonthlySelect" CssClass="Important"/>
				</div>
			</div>

			<div class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelStartDate" AssociatedControlID="CalendarStartDate" ToolTip='<%# ResourceManager.GetPhrase("Start Date", "Start Date and Time")%>'></asiweb:StyledLabel>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessCalendar2 runat="server" ID="CalendarStartDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
					<asiweb:BusinessCalendar2 runat="server" ID="CalendarStartTime" ControlType="TimePicker" UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
					<asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
					<asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsg" />
					<asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>
				</div>
			</div>
						
		   <div runat="server" ID="EndDateTimeDiv" class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelEndDate" AssociatedControlID="CalendarEndDate" ToolTip='<%# ResourceManager.GetPhrase("End Date", "End Date and Time")%>'></asiweb:StyledLabel>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessCalendar2 runat="server" ID="CalendarEndDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
					<asiweb:BusinessCalendar2 runat="server" ID="CalendarEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
				</div>
			</div>
							
			<div style="clear: both;"></div>    
		</ContentTemplate>                        
	</asp:UpdatePanel>
		
	<asp:UpdatePanel ID="SystemEventTriggerPanel" UpdateMode="Conditional" runat="server" Visible="false">
		<ContentTemplate>
			<div class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="SystemEventSelect" ID="SystemEventLabel" runat="server" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList ID="SystemEventSelect" runat="server" />
				</div>
			</div>                
			<div style="clear: both;"></div>    
		</ContentTemplate>                        
	</asp:UpdatePanel>    
		
	<asp:UpdatePanel ID="DataChangeTriggerPanel" UpdateMode="Conditional" runat="server" Visible="false">
		<ContentTemplate>
			<div class="PanelField Left" style="display:none;">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="DataObjectSelect" ID="DataObjectLabel" runat="server" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList ID="DataObjectSelect" runat="server" AutoPostBack="true" OnChange="SpecificPropertyChangeEnabled()" />
				</div>
			</div>  
		   
			<div class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel ID="TasksCommonTableLabel" runat="server" AssociatedControlID="TasksCommonTableDropDown" CssClass="Required" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList ID="TasksCommonTableDropDown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="TaskCommonTableDropDown_DataChanged" />
				</div>
				<div class="PanelFieldValue">
					<asiweb:StyledLabel ID="TriggerIdLabel" runat="server"></asiweb:StyledLabel>
				</div>
				 <div class="PanelFieldValue">
					  <asiweb:InfoControl ID="TriggerIdHelp" runat="server" Visible="False"/>
				 </div> 
			</div>
			
			<div id="TableNameDiv" runat="server" class="PanelField Left" style="display:none;">
				<div style="display:inline;">
					<asiweb:StyledLabel ID="TaskCommonTableNameLabel" runat="server" AssociatedControlID="TaskCommonTableNameTextBox" CssClass="Required" />
				</div>
				<div style="display:inline;">
					<asiweb:BusinessTextBox ID="TaskCommonTableNameTextBox" runat="server" AutoPostBack="True" CausesValidation="True" OnDataChanged="TaskCommonTableNameTextBox_DataChanged"/>
				</div>
			</div>

			<div class="PanelField Left">
				<div style="display:inline;">
					<asiweb:StyledLabel AssociatedControlID="CreateCheckBox" ID="TriggerOnLabel" runat="server" />
				</div>
				<div class="PanelFieldValue AutoWidth">
					<asp:CheckBox id="CreateCheckBox" Visible="true" runat="server" CssClass="FloatNone" /><br/>
					<asp:CheckBox id="DeleteCheckBox" Visible="true" runat="server" CssClass="FloatNone" /><br/>
					<asp:CheckBox id="AnyUpdateCheckBox" Visible="true" runat="server" CssClass="FloatNone" OnClick="UpdateSectionEnabled()"/><br/>
					<asp:CheckBox id="SpecificPropertyChangeCheckBox" Visible="False" runat="server" TextAlign="Right" CssClass="FloatNone" OnClick="SpecificPropertyChangeEnabled()" />
					<div class="SubItems">
						<div id="UpdateDiv" runat="server" class="SubItems" style="display:none;" >
							<asp:RadioButton GroupName="UpdateGroup" ID="AnyUpdateRadioButton" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="SpecificColumnChangeEnabled()" /><br/>
							<asp:RadioButton GroupName="UpdateGroup" ID="SpecificColumnRadioButton" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="SpecificColumnChangeEnabled()" />
						</div>
					</div>
				</div>
			</div>                 
			<div id="SpecificPropertySection" runat="server" style="display:none;">
				<div class="PanelField Left">
					<div style="display:inline;">
						<asiweb:StyledLabel AssociatedControlID="DataObjectPropertySelect" ID="DataObjectPropertyLabel" runat="server" CssClass="Required" />
					</div>
					<div class="PanelFieldValue">
						<asiweb:BusinessDropDownList ID="DataObjectPropertySelect" runat="server" OnDataChanged="SpecificColumnChanged" AutoPostBack="true" />
					</div>
				</div>    
				<div class="SubItems">
					<div class="PanelField Left">
						<div style="display: inline;">
							<asiweb:StyledLabel runat="server" ID="ValueChangedFromLabel" AssociatedControlID="ValueChangedFromTextBox"/>
						</div>
						<div class="PanelFieldValue">
							<asiweb:BusinessTextBox runat="server" ID="ValueChangedFromTextBox"/>  
								
							<asp:RadioButton GroupName="ValueChangedFrom" ID="ValueChangedFromRadioButtonT" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="ChangeFrom()" Visible="false" />
							<asp:RadioButton GroupName="ValueChangedFrom" ID="ValueChangedFromRadioButtonF" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="ChangeFrom()" Visible="false" />
															 
							<asiweb:BusinessCalendar2 runat="server" ID="ValueChangedFromCalendar" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" Visible="false" />                    
								
							<asiweb:BusinessDropDownList ID="ValueChangedFromEnumList" runat="server" AutoPostBack="False" />
						</div>
					</div>     
				
					<div class="PanelField Left">
						<div style="display: inline;">
							<asiweb:StyledLabel runat="server" ID="ValueChangedToLabel" AssociatedControlID="ValueChangedToTextBox"/>
						</div>
						<div class="PanelFieldValue">
							<asiweb:BusinessTextBox runat="server" ID="ValueChangedToTextBox"/>  
								
							<asp:RadioButton GroupName="ValueChangedTo" ID="ValueChangedToRadioButtonT" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="ChangeTo()" Visible="false" />
							<asp:RadioButton GroupName="ValueChangedTo" ID="ValueChangedToRadioButtonF" runat="server" TextAlign="Right" CssClass="InlineRb" OnClick="ChangeTo()" Visible="false" />
								
							<asiweb:BusinessCalendar2 runat="server" ID="ValueChangedToCalendar" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" Visible="false" />                               
									   
							<asiweb:BusinessDropDownList ID="ValueChangedToEnumList" runat="server" AutoPostBack="False" />             
						</div>
					</div>                    
				</div>
			</div>                                                                
			<div style="clear: both;"></div>    
		</ContentTemplate>                        
	</asp:UpdatePanel>  
				 
</asiweb:PanelTemplateControl2>
<script type="text/javascript">
    var prm = window.Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(SpecificColumnChangeEnabled);
    prm.add_endRequest(SpecificColumnChangeEnabled);

    function ReturnIndex() {
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null) {
            var url = GetRadWindow().BrowserWindow.location.href;
            if (url.indexOf('SelectedIndex') < 0) url = url + '&SelectedIndex=0';
            else {
                var re = /SelectedIndex=(\d*)/g;
                url = url.replace(re, 'SelectedIndex=0');
            }
            oWindow.IsDirty = true;
            GetRadWindow().BrowserWindow.location.href = url;
        }
    }
    function CheckSelectedMonthValue() {
        var combo = $find('<%=MonthlySelect.ClientID%>');
        if (combo != null && combo._text != "") {
            if (combo._text.search('L') >= 0 && combo._text.search(',') > 0) {
                alert('Last may not be used with another day of the month.\n\nPlease create a separate trigger to run on the last day of the month.');
                combo.get_items().getItem(31).set_checked(false);
            }
        }
    }
    SpecificPropertyChangeEnabled();
    function SpecificPropertyChangeEnabled() {
        var specificPropertySection = jQuery('#<%=SpecificPropertySection.ClientID%>');
        if (specificPropertySection != null) {
            var checkbox = $('<%=SpecificPropertyChangeCheckBox.ClientID%>');
            specificPropertySection.css("display", "none");
            if (checkbox != null)
                if (checkbox.checked)
                    specificPropertySection.css("display", "inline");
        }
    }
    function ChangeFrom() {
        var valueChangedFromRadioButtonT = $('<%=ValueChangedFromRadioButtonT.ClientID%>');
        var valueChangedFromRadioButtonF = $('<%=ValueChangedFromRadioButtonF.ClientID%>');
        var valueChangedToRadioButtonT = $('<%=ValueChangedToRadioButtonT.ClientID%>');
        var valueChangedToRadioButtonF = $('<%=ValueChangedToRadioButtonF.ClientID%>');

        if (valueChangedFromRadioButtonT.checked)
            valueChangedToRadioButtonF.checked = true;
        if (valueChangedFromRadioButtonF.checked)
            valueChangedToRadioButtonT.checked = true;
    }
    function ChangeTo() {
        var valueChangedFromRadioButtonT = $('<%=ValueChangedFromRadioButtonT.ClientID%>');
        var valueChangedFromRadioButtonF = $('<%=ValueChangedFromRadioButtonF.ClientID%>');
        var valueChangedToRadioButtonT = $('<%=ValueChangedToRadioButtonT.ClientID%>');
        var valueChangedToRadioButtonF = $('<%=ValueChangedToRadioButtonF.ClientID%>');

        if (valueChangedToRadioButtonT.checked)
            valueChangedFromRadioButtonF.checked = true;
        if (valueChangedToRadioButtonF.checked)
            valueChangedFromRadioButtonT.checked = true;
    }
    function UpdateSectionEnabled() {
        var updateDivSection = jQuery('#<%=UpdateDiv.ClientID%>');
        if (updateDivSection != null) {
            var checkbox = $('<%=AnyUpdateCheckBox.ClientID%>');
            updateDivSection.css("display", "none");
            var specificPropertySection = jQuery('#<%=SpecificPropertySection.ClientID%>');
            specificPropertySection.css("display", "none");
            if (checkbox != null)
                if (checkbox.checked) {
                    updateDivSection.css("display", "inline");
                    SpecificColumnChangeEnabled();
                }
        }
    }

    SpecificColumnChangeEnabled();
    function SpecificColumnChangeEnabled() {
        var updateDivSection = jQuery('#<%=UpdateDiv.ClientID%>');
        var specificPropertySection = jQuery('#<%=SpecificPropertySection.ClientID%>');
        var checkbox = $('<%=AnyUpdateCheckBox.ClientID%>');
        if (updateDivSection != null) {
            updateDivSection.css("display", "none");
            if (checkbox != null)
                if (checkbox.checked) {
                    updateDivSection.css("display", "inline");
                    if (specificPropertySection != null) {
                        var radiobutton = $('<%=SpecificColumnRadioButton.ClientID%>');
                        specificPropertySection.css("display", "none");
                        if (radiobutton != null)
                            if (radiobutton.checked)
                                specificPropertySection.css("display", "inline");
                    }
                }
        }
        registerNumericTransformation();
    }

    registerNumericTransformation();
    function registerNumericTransformation() {
        var debounce;
        jQuery("[data-precision]").on("keyup", function (e) {
            if (debounce != undefined && debounce != null) {
                clearTimeout(debounce);
            }
            debounce = setTimeout(
                function () { formatField(e.currentTarget); }, 2000);
        });
        jQuery("[data-precision]").on("blur", function (e) {
            if (debounce != undefined && debounce != null) {
                clearTimeout(debounce);
            }
            formatField(e.currentTarget);
        });
    }
    function formatField(field) {
        console.log(field);
        try {
            if (field.value.length > 0) {
                if (jQuery(field).attr("data-precision") === "money") {
                    field.value = parseFloat(field.value).toFixed(4);
                } else {
                    field.value = parseFloat(field.value).toFixed(6);
                }
            }
        } catch (e) {
            console.log(e);
            //field.value = "";
        }
    }
</script>
