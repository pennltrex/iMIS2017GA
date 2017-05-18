<%@ Page Title="Rapid Gift Entry" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.GiftEntry" AutoEventWireup="True" MaintainScrollPositionOnPostback="true" Codebehind="GiftEntry.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<script type="text/javascript">
	function changeHeadline(text){
		AJS.getElement('headline').innerHTML = text;
	}
	var PopupObject;
	
	//The following are used to set values in their respective text boxes in the GiftGrid datagrid.
	//The values for the variables should match the ID value for the control.
	var GridDonorContactIdServerControlId = "GridDonorContactId";
	var GridGridCheckCardNumberServerControlId = "GridCheckCardNumber";
	var GridCardCSCServerControlId = "GridCardCSC";
	var GridCardExpirationServerControlId = "GridCardExpiration";
	var GridCardHolderNameServerControlId = "GridCardHolderName";
	var GridDebitCardIssueDateServerControlId = "GridDebitCardIssueDate";
	var GridDebitCardIssueNumberServerControlId = "GridDebitCardIssueNumber";
	var GridSolicitorContactIdServerControlId = "GridSolicitorContactId";
	var GridDistributionCodeServerControlId = "GridDistributionCode";
	var GridAppealCodeServerControlId = "GridAppealCode";
	var GridCampaignCodeServerControlId = "GridCampaignCode";
	var GridFundCodeServerControlId = "GridFundCode";

	function Popup(object, title, url, height, width) {

	    var top = window.top.outerHeight / 2 + window.top.screenY - (height / 2);
	    var left = window.top.outerWidth / 2 + window.top.screenX - (width / 2);

		PopupObject = object;
		var newurl = url;
	    newurl += (url.indexOf("?") > -1 ? "&" : "?") + "TemplateType=E";
	    if(websiteKey != '00000000-0000-0000-0000-000000000000')
    	    newurl += "&WebsiteKey=" + websiteKey;
    	    
	    SmartScroller_GetCoords();
	    ShowDialog_NoReturnValue(newurl, null, width, height, title, null, null, CallCallback);
	}

	function CallCallback(dialogWindow) {
	    var args = dialogWindow.Argument;
	    if (args !== "undefined" && args != null) {
	        var funcName = args.shift();
	        var func = window[funcName];
	        func.apply(this, args);
	    }
	}

	function PopupEditor(object, title, url, height, width)
	{
		var textBox = object.parentNode.getElementsByTagName("input");
		var newurl = url;
	    newurl += (url.indexOf("?") > -1 ? "&" : "?") + "IsDialog=1&ContactId=" + textBox[0].value;
		Popup(object, title, newurl, height, width);
	}
	
	function PopupRequest(object, title, url, height, width)
	{
	    var textBox = object.parentNode.parentNode.getElementsByTagName("input");
		if (textBox[0].value.length == 0) {
			alert("Please enter a Donor Id first.");
			textBox[0].focus();
		}
		else
			Popup(object, title, url + "?ContactId=" + textBox[0].value, height, width);
	}
	
	function PopupReturn(value)
	{
	    var textBox = PopupObject.parentNode.getElementsByTagName("input");
		textBox[0].value = value;
		textBox[0].focus();
	    jQuery(textBox[0]).trigger('change');
	}

	//Auto-populate Appeal, Campaign, Fund when Distribution is selected
	function PopupReturnDist(value, appeal, campaign, fund)
	{
	    var textBox = '';
	    var textBox2 = '';
	    if (value.length > 0)
		{
		    textBox = PopupObject.parentNode.getElementsByTagName("input");
		    textBox[0].value = value;
	    	textBox[0].focus();		    
		}
		
	    if (appeal.length > 0)
		{
		    textBox2 = document.getElementById(document.getElementById('AppealCode_ClientID').value);
		    if (textBox2.value.length == 0)
		        textBox2.value = appeal;
		}
	    if (campaign.length > 0)
		{
		    textBox2 = document.getElementById(document.getElementById('CampaignCode_ClientID').value);
		    if (textBox2.value.length == 0)
		        textBox2.value = campaign;
		}
	    if (fund.length > 0)
		{
		    textBox2 = document.getElementById(document.getElementById('FundCode_ClientID').value);
		    textBox2.value = fund;
		}		
	}
	
	//Auto-populate Campaign, Fund when Appeal is selected
	function PopupReturnAppeal(appeal, campaign, fund)
	{	
	    var textBox = '';
	    if (appeal.length > 0)
		{
		    textBox = document.getElementById(document.getElementById('AppealCode_ClientID').value);
		    textBox.value = appeal;
		}
	    if (campaign.length > 0)
		{
		    textBox = document.getElementById(document.getElementById('CampaignCode_ClientID').value);
		    if (textBox.value.length == 0)
		        textBox.value = campaign;
		}
	    if (fund.length > 0)
		{
		    textBox = document.getElementById(document.getElementById('FundCode_ClientID').value);
		    if (textBox.value.length == 0)
		        textBox.value = fund;
		}	
	}
	
	//Auto-populate Fund when Campaign is selected
	function PopupReturnCampaign(campaign, fund) {
	    var textBox = '';
	    if (campaign.length > 0)
		{
		    textBox = document.getElementById(document.getElementById('CampaignCode_ClientID').value);
		    textBox.value = campaign;
		}
	    if (fund.length > 0)
		{
		    textBox = document.getElementById(document.getElementById('FundCode_ClientID').value);
		    if (textBox.value.length == 0)
		        textBox.value = fund;
		}	
	}
			
	//Auto-populate Appeal, Campaign, Fund when Distribution is selected.
	//This variant differs from PopupReturnDist in that it writes results to the GiftsGrid data line.
	function PopupReturnDistLine(value, appeal, campaign, fund, focusIndex)
	{    
	    if (value.length > 0)
		{    
		    SetGridTextBoxValue(GridDistributionCodeServerControlId, value);
		}
	    if (appeal.length > 0 && GetGridTextBoxControl(GridAppealCodeServerControlId).value.length == 0)
		{
		    SetGridTextBoxValue(GridAppealCodeServerControlId, appeal);
		}
	    if (campaign.length > 0 && GetGridTextBoxControl(GridCampaignCodeServerControlId).value.length == 0)
		{
		    SetGridTextBoxValue(GridCampaignCodeServerControlId, campaign);
		}
	    if (fund.length > 0)
		{
		    SetGridTextBoxValue(GridFundCodeServerControlId, fund);
		}
		
		if (focusIndex.length > 0)
		{
		    if (focusIndex == 1)
		        GetGridTextBoxControl(GridDistributionCodeServerControlId).focus();
		    else if (focusIndex == 2)
		        GetGridTextBoxControl(GridAppealCodeServerControlId).focus();
		    else if (focusIndex == 3)
		        GetGridTextBoxControl(GridCampaignCodeServerControlId).focus();
		}		
		SmartScroller_Scroll();
	}
	
	//Auto-populate Campaign, Fund when Appeal is selected.
	//This variant differs from PopupReturnAppeal in that it writes results to the GiftsGrid data line.
	function PopupReturnAppealLine(appeal, campaign, fund, focusIndex)
	{
	    if (appeal.length > 0)
		{
		    SetGridTextBoxValue(GridAppealCodeServerControlId, appeal);    
		}
	    if (campaign.length > 0 && GetGridTextBoxControl(GridCampaignCodeServerControlId).value.length == 0)
		{
		    SetGridTextBoxValue(GridCampaignCodeServerControlId, campaign);
		}
	    if (fund.length > 0 && GetGridTextBoxControl(GridFundCodeServerControlId).value.length == 0)
		{
		    SetGridTextBoxValue(GridFundCodeServerControlId, fund);
		}
		
		if (focusIndex.length > 0)
		{
		    if (focusIndex == 1)
		        GetGridTextBoxControl(GridDistributionCodeServerControlId).focus();
		    else if (focusIndex == 2)
		        GetGridTextBoxControl(GridAppealCodeServerControlId).focus();
		    else if (focusIndex == 3)
		        GetGridTextBoxControl(GridCampaignCodeServerControlId).focus();
		}		
		SmartScroller_Scroll();
	}	
	
	//Auto-populate Fund when Campaign is selected.
	//This variant differs from PopupReturnCampaign in that it writes results to the GiftsGrid data line.
	function PopupReturnCampaignLine(campaign, fund, focusIndex)
	{
	    if (campaign.length > 0)
		{
		    SetGridTextBoxValue(GridCampaignCodeServerControlId, campaign);
		}
	    if (fund.length > 0 && GetGridTextBoxControl(GridFundCodeServerControlId).value.length == 0)
		{
		   SetGridTextBoxValue(GridFundCodeServerControlId, fund);
		}
		
		if (focusIndex.length > 0)
		{
		    if (focusIndex == 1)
		        GetGridTextBoxControl(GridDistributionCodeServerControlId).focus();
		    else if (focusIndex == 2)
		        GetGridTextBoxControl(GridAppealCodeServerControlId).focus();
		    else if (focusIndex == 3)
		        GetGridTextBoxControl(GridCampaignCodeServerControlId).focus();
		}		
		SmartScroller_Scroll();
	}	
	
	//Auto-populate CC Holder name when ID is selected
	function PopupReturnDonor(contactId, name, solicitorId)
	{
	    var textBox = PopupObject.parentNode.parentNode.getElementsByTagName("input");
		textBox[0].value = contactId;
		textBox[0].focus();
		if (textBox[6] != null) {
	    textBox[6].value = name;
		}
        SetGridTextBoxValue(GridSolicitorContactIdServerControlId, solicitorId);
	    SmartScroller_Scroll();
	}	
	
	//Set the value of a particular textbox in the GiftGrid datagridrow based on the text box's server control ID.
	function SetGridTextBoxValue(textBoxServerControlId, value)
	{
	    var textBoxControl = GetGridTextBoxControl(textBoxServerControlId);
	    textBoxControl.value = value;	
	}		
	
	//Get a particular textbox in the GiftsGrid datagridrow based on the text box's server control ID.
	function GetGridTextBoxControl(textBoxServerControlId)
	{
	    //Server ControlID of the GridDonorContactId textbox.  This is the first textbox control in the grid row. 
	    var textBox = PopupObject.parentNode.parentNode.getElementsByTagName("input");
        var GridDonorContactId = textBox[0];
        //Get the client name of the GridDonorContactId control.
	    var GridDonorContactIdClientControlName = GridDonorContactId.name;
	    //Trim of the prefix which included everything up to the Server ControlID.
	    var indexOfGridDonorContactId = GridDonorContactIdClientControlName.indexOf(GridDonorContactIdServerControlId);	    
	    var controlNamePrefix = GridDonorContactIdClientControlName.slice(0, indexOfGridDonorContactId);
	    //Build the client name of the control identified by the textBoxServerControlId param passed in.
	    var textBoxControlName = controlNamePrefix + textBoxServerControlId;
	    //alert("textBoxControlName: " + textBoxControlName);
	    //Set the value of the textbox
	    var textBoxControl = document.getElementsByName(textBoxControlName);
	    return textBoxControl[0];
	}
	
	//Get a particular textbox in the GiftsGrid datagridrow based on the text box's server control ID.
	function GetGridTextBoxControlAlt(object, textBoxServerControlId)
	{
	    //Server ControlID of the GridDonorContactId textbox.  This is the first textbox control in the grid row. 
	    var textBox = object.parentNode.parentNode.getElementsByTagName("input");
        var GridDonorContactId = textBox[0];
        //Get the client name of the GridDonorContactId control.
	    var GridDonorContactIdClientControlName = GridDonorContactId.name;
	    //Trim of the prefix which included everything up to the Server ControlID.
	    var indexOfGridDonorContactId = GridDonorContactIdClientControlName.indexOf(GridDonorContactIdServerControlId);	    
	    var controlNamePrefix = GridDonorContactIdClientControlName.slice(0, indexOfGridDonorContactId);
	    //Build the client name of the control identified by the textBoxServerControlId param passed in.
	    var textBoxControlName = controlNamePrefix + textBoxServerControlId;
	    //alert("textBoxControlName: " + textBoxControlName);
	    //Set the value of the textbox
	    var textBoxControl = document.getElementsByName(textBoxControlName);
	    return textBoxControl[0];
	}
	
	//Auto-populate Description when Gift Type is selected
	function GiftTypeSelection(value)
	{
	    var giftDescription = document.getElementById("<asp:Literal id='GiftDescriptionID' runat='server' />");
	    if (value == 0)
            giftDescription.value = "Gift";		    

	    if (value == 1)
            giftDescription.value = "Pledges";		
            
	    if (value == 2)
            giftDescription.value = "";	                                      
	}	
		
    // Used to allow the up arrow and down arrow to navigate rows in the gift grid
	function checkKey(event, upRowElementId, downRowElementId)
	{
        var key = event.keyCode;
        // if the up arrow has been pressed and we're not in the first row
        if( key == 38 && upRowElementId != '')
        {
            document.getElementById(upRowElementId).focus();
            return false;
        }    
        // if the down arrow has been pressed and we're not in the last row
        else if( key == 40 && downRowElementId != '')
        {
            document.getElementById(downRowElementId).focus();
            return false;
        }

        return true;
    }	
    
	function validateCreditCardDate(element) {
	    if (element && element.value) {
	        var tidied = ("0000" + element.value).slice(-4);
	        if (/^(0[1-9]|1[0-2])[0-9]{2}$/.test(tidied))
	            element.value = tidied;
	        else
	            element.value = "";
	    }
	}

    // Called when the dialog window is unloaded to allow this parent to reset the proper scroll position
    function dialogUnloaded() {    
        SmartScroller_Scroll();
        var textBox = PopupObject.parentNode.getElementsByTagName("input");
        if(!textBox[0].disabled && textBox[0].style.display != "none" )
                textBox[0].focus();
    }
     
    // Gets the current scroll position and stores it in hidden variables.
    // This is called this form's Popup javascript function to help retain the current scroll position.  
    // This is needed because window.open shifts the scroll position to far left.
    function SmartScroller_GetCoords() {
        var scrollX, scrollY;
        
        if (document.all) {
            if (!document.documentElement.scrollLeft)
                scrollX = document.body.scrollLeft;
            else
                scrollX = document.documentElement.scrollLeft;
            if (!document.documentElement.scrollTop)
                scrollY = document.body.scrollTop;
            else
                scrollY = document.documentElement.scrollTop; 
        }
        else {
            scrollX = window.pageXOffset;
            scrollY = window.pageYOffset;
        }
            
        document.getElementById('smartScrollLeft').value = scrollX;
        document.getElementById('smartScrollTop').value = scrollY;
    }

    // Sets the scroll position to the last position set by SmartScroller_GetCoords().
    function SmartScroller_Scroll() {
        var x = document.getElementById('smartScrollLeft').value;
        var y = document.getElementById('smartScrollTop').value;
        window.scrollTo(x, y);
    }
    
    function EnableCreditCardFields(sender) {

        var cashAccountType = CCAccountArray[sender.selectedIndex].toUpperCase();
    
        if(sender.selectedIndex > 0)
            GetGridTextBoxControlAlt(sender, GridGridCheckCardNumberServerControlId).disabled = false;
        else
            GetGridTextBoxControlAlt(sender, GridGridCheckCardNumberServerControlId).disabled = true;

        var cardHolderNameControl;
        var issueDateControl;
        var issueNumberControl;

        if (cashAccountType === "CREDITCARD" || cashAccountType === "DEBITCARD")
        {            
            GetGridTextBoxControlAlt(sender, GridCardCSCServerControlId).disabled = false;
            GetGridTextBoxControlAlt(sender, GridCardExpirationServerControlId).disabled = false;
            cardHolderNameControl = GetGridTextBoxControlAlt(sender, GridCardHolderNameServerControlId);
            if(cardHolderNameControl) {
                cardHolderNameControl.disabled = false;
                if(cardHolderNameControl.value.length == 0)
                    cardHolderNameControl.value = "<Default: Donor's Name>";
            }
            issueDateControl = GetGridTextBoxControlAlt(sender, GridDebitCardIssueDateServerControlId);
            if(issueDateControl)
                issueDateControl.disabled = cashAccountType !== "DEBITCARD";
            issueNumberControl = GetGridTextBoxControlAlt(sender, GridDebitCardIssueNumberServerControlId);
            if(issueNumberControl)
                issueNumberControl.disabled = cashAccountType !== "DEBITCARD";
        }
        else
        {            
            var gridCscControl = GetGridTextBoxControlAlt(sender, GridCardCSCServerControlId);
            if (gridCscControl) {
                gridCscControl.disabled = true;
                gridCscControl.value = "";
            }
            var cardExpirationControl = GetGridTextBoxControlAlt(sender, GridCardExpirationServerControlId);
            if (cardExpirationControl) {
                cardExpirationControl.disabled = true;
                cardExpirationControl.value = "";
            }
            cardHolderNameControl = GetGridTextBoxControlAlt(sender, GridCardHolderNameServerControlId);
            if (cardHolderNameControl) {
                cardHolderNameControl.disabled = true;
                if (cardHolderNameControl.value == "<Default: Donor's Name>")
                    cardHolderNameControl.value = "";
            }
            issueDateControl = GetGridTextBoxControlAlt(sender, GridDebitCardIssueDateServerControlId);
            if (issueDateControl) {
                issueDateControl.disabled = true;
                issueDateControl.value = "";
            }
            issueNumberControl = GetGridTextBoxControlAlt(sender, GridDebitCardIssueNumberServerControlId);
            if (issueNumberControl) {
                issueNumberControl.disabled = true;
                issueNumberControl.value = "";
            }
        }
    }
	</script>	
    
    <asiweb:PanelTemplateControl2 ID="RPEPanel" runat="server" FieldSet="true" TemplateTitle="Enter gifts" DefaultButton="GoButton" Collapsible="true" translate="yes">       
	    <asp:label id="ErrorMessageLabel" CssClass="Error" runat="server" Visible="False"></asp:label>
	    
        <asp:Panel runat="server" ID="InstructionsPanel" CssClass="Section" Visible="True">
            <asp:label id="InstructionsLabel" runat="server">To create a customized rapid gift entry table, specify default values for gift properties and the number of gifts to enter, and then click Go.</asp:label>       
        </asp:Panel>
        <div class="PanelField">
            <asp:label id="TransactionDateLabel" runat="server" CssClass="Label">Transaction date</asp:label>
            <div class="PanelFieldValue">
                <asp:label id="TransactionDateReadOnly" runat="server"></asp:label>
            </div>
        </div>
        <div style="clear:both; width: 100%;">
            <asiweb:PanelTemplateColumn ID="Column1" runat="server" style="clear:left; width:49%;">
                <div class="PanelField">
                    <asp:label id="DateReceivedLabel" runat="server" AssociatedControlID="DateReceived" CssClass="Required">Date received</asp:label>
                    <div class="PanelFieldValue">
                        <asp:textbox id="DateReceived" runat="server" Columns="12" AccessKey="B"></asp:textbox>
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="DistributionCodeLabel" runat="server" AssociatedControlID="DistributionCode">Distribution</asp:label>
                    <div class="PanelFieldValue">
                        <asp:textbox id="DistributionCode" Columns="20" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="DistributionCode_TextChanged"></asp:textbox>
                        <a onclick="return Popup(this, 'Distributions', 'DistributionPremiumList.aspx', 500, 600)" id="DistributionCodeLink" runat="server" title="Find distribution code"><asp:Image id="DistributionCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="AppealCodeLabel" runat="server" AssociatedControlID="AppealCode">Appeal</asp:label>
                    <div class="PanelFieldValue">
                        <asp:textbox id="AppealCode" Columns="20" MaxLength="40" Runat="server" AutoPostBack="true" OnTextChanged="AppealCode_TextChanged"></asp:textbox>
                        <a onclick="return Popup(this, 'Apeals', 'AppealList.aspx', 500, 600)" id="AppealCodeLink" runat="server" title="Find appeal code"><asp:Image id="AppealCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="CampaignCodeLabel" runat="server" AssociatedControlID="CampaignCode">Campaign</asp:label>
                    <div class="PanelFieldValue">
                        <asp:textbox id="CampaignCode" Columns="20" MaxLength="10" Runat="server" AutoPostBack="true" OnTextChanged="CampaignCode_TextChanged"></asp:textbox>
                        <a onclick="return Popup(this, 'Campaigns', 'CampaignList.aspx', 500, 600)" id="CampaignCodeLink" runat="server" title="Find campaign code"><asp:Image id="CampaignCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="FundCodeLabel" runat="server" AssociatedControlID="FundCode">Fund</asp:label>
                    <div class="PanelFieldValue">
                        <asp:textbox id="FundCode" Columns="20" MaxLength="60" Runat="server"></asp:textbox>
                        <a onclick="return Popup(this, 'Funds', 'FundList.aspx', 500, 600)" id="FundCodeLink" runat="server" title="Find fund code"><asp:Image id="FundCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                    </div>
                </div>
                <div class="ClearFix"></div>
                <fieldset class="ShowLegend">
                    <legend class="Label"><asp:Label runat="server" ID="GiftTypeLabel" Text="Gift Type"></asp:Label></legend>
                    <div class="PanelFieldValue AutoWidth FloatNone" style="padding-left:20px;padding-top:10px;">
                        <asp:radiobuttonlist id="GiftType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
				            <asp:ListItem Value="Gift" onclick="GiftTypeSelection(0);" Selected="True">Gift&nbsp;&nbsp;</asp:ListItem>
				            <asp:ListItem Value="Pledge" onclick="GiftTypeSelection(1);">Pledge&nbsp;&nbsp;</asp:ListItem>
				            <asp:ListItem Value="" onclick="GiftTypeSelection(2);">Specified below</asp:ListItem>
			            </asp:radiobuttonlist>
                    </div>
                </fieldset>
            </asiweb:PanelTemplateColumn>
            <asiweb:PanelTemplateColumn ID="Column2" runat="server">
                <div class="PanelField">
                    <asp:label id="BatchNumberLabel" runat="server" AssociatedControlID="BatchNumber" CssClass="Required">Batch</asp:label>
                    <div class="PanelFieldValue">
                        <asp:dropdownlist id="BatchNumber" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BatchNumber_SelectedIndexChanged"></asp:dropdownlist>
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="SalutationCodeLabel" runat="server" AssociatedControlID="SalutationCode">Salutation</asp:label>
                    <div class="PanelFieldValue">
		                <asp:textbox id="SalutationCode" Columns="20" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="SalutationCode_TextChanged" />					            
		                <a onclick="return Popup(this, 'Salutation', 'SalutationList.aspx', 500, 600)" id="SalutationCodeLink" runat="server" title="Find salutation code"><asp:Image id="SalutationCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a><br/>
		                <asp:label id="SalutationValueLabel" runat="server" style="display:block;padding-top:5px" />
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="MergeCodeLabel" runat="server" AssociatedControlID="MergeCode">Merge</asp:label>
                    <div class="PanelFieldValue">
		                <asp:textbox id="MergeCode" Columns="20" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="MergeCode_TextChanged" />					            
		                <a onclick="return Popup(this, 'Merge', 'MergeList.aspx', 500, 600)" id="MergeCodeLink" runat="server" title="Find merge code"><asp:Image id="MergeCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a><br/>
		                <asp:label id="MergeValueLabel" runat="server" style="display:block;padding-top:5px" />
                    </div>
                </div>

                <div class="PanelField">
                    <asp:label id="SenderCodeLabel" runat="server" AssociatedControlID="SenderCode">Sender</asp:label>
                    <div class="PanelFieldValue">
		                <asp:textbox id="SenderCode" Columns="20" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="SenderCode_TextChanged" />
		                <a onclick="return Popup(this, 'Sender', 'SenderList.aspx', 500, 600)" id="SenderCodeLink" runat="server" title="Find sender code"><asp:Image id="SenderCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" /></a><br/>
		                <asp:label id="SenderValueLabel" runat="server" style="display:block;padding-top:5px" />
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="PayByLabel" runat="server" AssociatedControlID="PayByDropDownList">Pay by</asp:label>
                    <div class="PanelFieldValue">
                        <asp:DropDownList runat="server" id="PayByDropDownList" DataValueField="Key" DataTextField="Value" />
                    </div>
                </div>
                <div class="PanelField">
                    <asp:label id="AmountLabel" runat="server" AssociatedControlID="Amount">Gift amount</asp:label>
                    <div class="PanelFieldValue" style="white-space: nowrap">
		                <asp:textbox id="Amount" runat="server" Columns="12" MaxLength="18" style="text-align:right" />&nbsp;
		                <asp:CompareValidator runat="server" ControlToValidate="Amount" ValidationGroup="RowCount" Type="Currency" Display="Dynamic" CssClass="Important" Operator="GreaterThanEqual" ValueToCompare="0" ErrorMessage="Must be a positive value." />
                    </div>
                </div>
            </asiweb:PanelTemplateColumn>
        </div>
        <div class="PanelField">
            <asp:label id="DescriptionLabel" runat="server" AssociatedControlID="Description">Description</asp:label>
            <asp:textbox id="Description" runat="server" MaxLength="247" CssClass="InputXLarge"></asp:textbox>
        </div>
        <div class="PanelField Section">
            <asp:label id="NoteLabel" runat="server" AssociatedControlID="Note">Notes</asp:label>
            <asp:textbox id="Note" runat="server" Columns="80" Rows="3" TextMode="MultiLine" CssClass="InputXXLarge"></asp:textbox>
        </div>
        <div class="PanelField AutoWidth FloatNone">
	        <asp:label id="RowCountLabel" runat="server" AssociatedControlID="RowCount">How many rows would you like?</asp:label>
	        <asp:textbox id="RowCount" runat="server" AccessKey="R" Columns="3" MaxLength="2">5</asp:textbox>&nbsp;&nbsp;
	        <asiweb:StyledButton id="GoButton" runat="server" Text="Go" onclick="GoButtonClick" ValidationGroup="RowCount" CausesValidation="true" AccessKey="G" />
	        <asiweb:RequiredFieldValidator runat="server" ControlToValidate="RowCount" ValidationGroup="RowCount" />
	        <asp:CompareValidator runat="server" ControlToValidate="RowCount" ValidationGroup="RowCount" Type="Integer" Operator="GreaterThan" ValueToCompare="0" ErrorMessage="Must be a number greater than zero." />
        </div>
    </asiweb:PanelTemplateControl2>
    <div style="clear: both;"></div>
    <asp:Panel id="GridPanel" runat="server" Visible="false" Width="100%" ScrollBars="Horizontal" style="border:solid 1px #999; padding:0;" translate="yes">
        <asiweb:BusinessDataGrid id="GiftsGrid" runat="server" OnItemDataBound="GiftsGridItemDataBound" 
            AutoGenerateColumns="False" OnItemCommand="GiftsGridItemSelected">
            <Columns>
                <asp:TemplateColumn HeaderText="* Donor ID" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="GridDonorContactIdLabel" Text="Donor ID" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridDonorContactId" Columns="10" MaxLength="10" CssClass="InputSmall" Runat="server" OnTextChanged="GridDonorContactId_TextChanged" />
	                    <a id="GridDonorFindContact" runat="server" href="javascript:void(0)" onclick="return Popup(this, 'FindContact', 'ContactFinder.aspx?ReturnDonor=1', 800, 600)" title="Find contact">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
	                    <a id="GridDonorEditContact" runat="server" href="javascript:void(0)" onclick="return PopupEditor(this, 'EditContact', 'ContactEdit.aspx?ReturnDonor=1', 800, 600)" title="Edit contact">
	                        <asp:Image runat="server" SkinID="ContactImage" AlternateText="Edit" /></a>
                        <div style="clear: both;width:155px"></div>                     
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="* Amount">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridAmountLabel" Text="Amount" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridAmount" Columns="10" MaxLength="15" CssClass="InputSmall" Runat="server" style="text-align:right" />
	                    <asp:CompareValidator runat="server" ControlToValidate="GridAmount" ValidationGroup="GiftsGrid" Type="Currency" Operator="GreaterThanEqual" ValueToCompare="0" ErrorMessage="Positive value" Display="Dynamic" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Pledge?" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
	                    <asp:CheckBox ID="GridIsPledge" Runat="server" AutoPostBack="true" cssClass="text-hide" Text="This gift is a pledge" OnCheckedChanged="GridIsPledge_CheckedChanged"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Pay By" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridPayByLabel" Text="Pay by" CssClass="screen-reader-text"></asp:Label>
	                    <asp:DropDownList id="GridPayBy" runat="server" DataValueField="Key" DataTextField="Value" DataSource='<%# GetCashAccountTypeList() %>' onChange='javascript:EnableCreditCardFields(this)' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Check/Card Number">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridCheckCardNumberLabel" Text="Check/Card Number" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridCheckCardNumber" Columns="16" MaxLength="25" Runat="server" AutoComplete="off"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="CSC">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridCardCSCLabel" Text="CSC" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridCardCSC" Columns="4" MaxLength="10" CssClass="InputSmall" Runat="server" AutoComplete="off"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>	
                <asp:TemplateColumn HeaderStyle-Wrap="True">
                    <HeaderTemplate>
                         Exp Date<br/>(MMYY)
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridCardExpirationLabel" Text="Expiration Date" CssClass="screen-reader-text"></asp:Label>
                        <asp:TextBox ID="GridCardExpiration" Columns="4" MaxLength="4" CssClass="InputSmall" Runat="server" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>					
                <asp:TemplateColumn HeaderText="Name on Credit Card">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridCardHolderNameLabel" Text="Name on Credit Card" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridCardHolderName" Columns="20" MaxLength="40" Runat="server" ValidateRequestMode="Disabled"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Authorization" Visible="false">
                    <ItemTemplate>
	                    <asp:TextBox ID="GridAuthorization" Columns="4" MaxLength="10" Runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>						
                <asp:TemplateColumn HeaderStyle-Wrap="True">
                    <HeaderTemplate>
                        Issue Date<br/>(MMYY)
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridDebitCardIssueDateLabel" Text="Authorization" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridDebitCardIssueDate" Columns="4" MaxLength="4" CssClass="InputSmall"  Runat="server" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Issue #" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridDebitCardIssueNumberLabel" Text="Issue Number" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridDebitCardIssueNumber" Columns="3" MaxLength="2" CssClass="InputSmall" Runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>						
                <asp:TemplateColumn HeaderText="Request" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridRequestActivitySeqnLabel" Text="Request" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridRequestActivitySeqn" Columns="6" MaxLength="10" CssClass="InputSmall" Runat="server"></asp:TextBox>
	                    <a href="#" onclick="return PopupRequest(this, 'ChooseRequest', 'RequestList.aspx', 500, 600)" title="Find request">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                        <div style="clear: both;width:120px"></div>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Solicitor ID" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridSolicitorContactIdLabel" Text="Solicitor ID" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridSolicitorContactId" Columns="12" CssClass="InputSmall" runat="server"></asp:textbox>
	                    <a href="#" onclick="return Popup(this, 'FindContact', 'SolicitorFinder.aspx', 500, 600)" title="Find solicitor">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                        <div style="clear: both;width:120px"></div>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Memorial ID" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridMemorialContactIdLabel" Text="Memorial ID" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridMemorialContactId" Columns="10" MaxLength="10" CssClass="InputSmall" Runat="server"></asp:TextBox>
	                    <a href="#" onclick="return Popup(this, 'FindContact', 'ContactFinder.aspx', 800, 600)" title="Find contact">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
	                    <a href="#" onclick="return PopupEditor(this, 'EditContact', 'ContactEdit.aspx', 800, 600)" title="Edit contact">
		                    <asp:Image runat="server" SkinID="ContactImage" AlternateText="Edit" /></a>
                        <div style="clear: both;width:155px"></div>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="List as">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridListAsLabel" Text="List as" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridListAs" Columns="18" MaxLength="253" Runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Soft Credit ID" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridSoftCreditIDLabel" Text="Soft Credit ID" CssClass="screen-reader-text"></asp:Label>
	                    <asp:TextBox ID="GridSoftCreditID" Columns="10" MaxLength="10" CssClass="InputSmall" Runat="server"></asp:TextBox>
	                    <a href="#" onclick="return Popup(this, 'FindContact', 'ContactFinder.aspx', 800, 600)" title="Find contact">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
	                    <a href="#" onclick="return PopupEditor(this, 'EditContact', 'ContactEdit.aspx', 800, 600)" title="Edit contact">
		                    <asp:Image runat="server" SkinID="ContactImage" AlternateText="Edit" /></a>
                        <div style="clear: both;width:155px"></div>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Receipt Num" ItemStyle-Wrap="False" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridReceiptNumberLabel" Text="Receipt Number" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridReceiptNumber" runat="server" Columns="6" MaxLength="10" CssClass="InputSmall" ></asp:textbox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Do not print receipt" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
	                    <asp:CheckBox ID="GridPrintReceiptDisabled" Runat="server" Text="Do not print receipt" CssClass="text-hide"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
				
                <asp:TemplateColumn HeaderText="* Distribution" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridDistributionCodeLabel" Text="Distribution" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridDistributionCode" runat="server" AutoPostBack="true" CssClass="InputSmall" OnTextChanged="GridDistributionCode_TextChanged"></asp:textbox>
	                    <a onclick="return Popup(this, 'Distributions', 'DistributionPremiumList.aspx?ReturnLine=1', 500, 600)" href="#" title="Find distribution code"><asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                        <div style="clear: both;width:120px"></div> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Appeal" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridAppealCodeLabel" Text="Appeal" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridAppealCode" Columns="20" MaxLength="40" Runat="server" AutoPostBack="true" CssClass="InputSmall" OnTextChanged="GridAppealCode_TextChanged"></asp:textbox>
	                    <a onclick="return Popup(this, 'Apeals', 'AppealList.aspx?ReturnLine=1', 500, 600)" href="#" title="Find appeal code"><asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                        <div style="clear: both;width:120px"></div> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Campaign" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridCampaignCodeLabel" Text="Campaign" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridCampaignCode" Columns="20" MaxLength="10" Runat="server" AutoPostBack="true" CssClass="InputSmall" OnTextChanged="GridCampaignCode_TextChanged"></asp:textbox>
	                    <a onclick="return Popup(this, 'Campaigns', 'CampaignList.aspx?ReturnLine=1', 500, 600)" href="#" title="Find campaign code">
		                    <asp:Image runat="server" SkinID="FindImage" AlternateText="Find" /></a>
                        <div style="clear: both;width:120px"></div> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Fund" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridFundCodeLabel" Text="Fund" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridFundCode" Columns="20" MaxLength="60" Runat="server" CssClass="InputSmall"></asp:textbox>
	                    <a onclick="return Popup(this, 'Funds', 'FundList.aspx', 500, 600)" href="#" title="Find fund code">
	                        <asp:Image id="GridFundCodeImage" runat="server" SkinID="FindImage" AlternateText="Find" />
                            <div style="clear: both;width:120px"></div> 
	                    </a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Description" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridDescriptionLabel" Text="Description" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridDescription" runat="server" Columns="20" MaxLength="247"></asp:textbox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Notes" ItemStyle-Wrap="False">
                    <ItemTemplate>
                        <asp:Label runat="server" id="GridNoteLabel" Text="Note" CssClass="screen-reader-text"></asp:Label>
	                    <asp:textbox id="GridNote" runat="server" Columns="20"></asp:textbox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn ItemStyle-Wrap="False" HeaderStyle-Wrap="False">
                    <ItemTemplate>
	                    <asp:CheckBox ID="GridFRCheckbox" Runat="server" AutoPostBack="false"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                
                <asp:TemplateColumn>
                    <ItemTemplate>
	                    <asp:ImageButton id="GridUndoButton" SkinId="UndoButton" runat="server" 
	                        CommandName="Select" ToolTip='<%# Asi.ResourceManager.GetWord("Undo changes") %>' AlternateText="Undo" />
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asiweb:BusinessDataGrid>
    </asp:Panel>
</asp:Content>
<asp:Content ID="ButtonContent" runat="server" ContentPlaceHolderID="TemplateButtonBar">
    <div class="CommandBar" >
        <asiweb:StyledButton id="SaveButton" Visible="false" runat="server" CommandButtonType="Save" onclick="SaveButtonClick" AccessKey="S" CausesValidation="true" ValidationGroup="GiftGrid" CssClass="PrimaryButton" />
        <asiweb:StyledButton ID="CancelButton" Visible="false" runat="server" CommandButtonType="Cancel" OnClick="CancelButton_Click" AccessKey="C" />
    </div>
</asp:Content>
