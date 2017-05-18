
    //not sure what fuser is used for but don't remove it...breaks things -- MarkG
    var fuser;
     function checksubmit(sender) {
        // Check if fuser is cler or burn
        if (fuser === 0) {
            fuser = 1; //Burn the fuser
            sender._enabled = false; // disable the control until postback occurs
        }

    };

    //This AJAX Callback Function that should be fired after AJAX postback is complete
     function OnajaxPostbackComplete(sender, args) {
        ResetBlocker();
    };

    // Function to reset Fuser
    function ResetBlocker() {
        // Reset Fuser
        fuser = 0;
    };

    function NoDecimal(sender, eventArgs) {
        var charStr = eventArgs.get_keyCharacter();
        // Disable both the decimal and comma to cover all localizations
        if (/[.,]+/.test(charStr))
            eventArgs.set_cancel(true);
    }

    function DisableEnter(sender, eventArgs) {
        if (eventArgs.get_domEvent().rawEvent.keyCode === 13) {
            eventArgs.get_domEvent().preventDefault();
            eventArgs.get_domEvent().stopPropagation();
        }
    }

    //form control event
    function QuantityOrDisplayOrderKeyPressed(sender, eventArgs) {
        NoDecimal(sender, eventArgs);
        DisableEnter(sender, eventArgs);
    }


function Asi_Web_iParts_Commerce_ItemCreatorDisplay(standardPriceId, discountPriceId, minPrice, maxPrice, maxComponentCount, publishStartDatePickerId, publishStartTimePickerId, publishEndDatePickerId, publishEndTimePickerId, publishDateRangeValidator, charitableItemId, tabStripControlId, multiPageControlId, isImis100, txtMinimumComponentSelectionsId, txtMaximumComponentSelectionsId,CollectionItemsGridId) {
        //
        // private variables 
        var eventsAttached = false;
        var settingTime = false;
        var settingDate = false;
        // Variables
        //'<%#CollectionItemsGrid.ClientID%>'
/*
        this.CollectionItemsGrid;
        this.RefreshButtonId;
        this.HiddenProductGuidTextBoxId;
        this.MinComponentSelectionsTextBoxId;
        this.MaxComponentSelectionsTextBoxId;
        this.ComponentSelectionsCustomValidatorClientId;
        this.FairMarketValueLabelId;
        this.FairMarketValueId;
        this.MinimumGiftAmountLabelId;
        this.MinimumGiftAmountTextBoxId;
        this.MinimumGiftAmountDivId;
        this.MinimumGiftAmountRequiredValidatorId;
        this.IsPremiumCheckBoxId;
        this.CollectionItemsGridId;
*/

        // keep a reference to "this" to use when "this" means something else
        var me = this;

        //cache standard price...
        var stdPriceId = standardPriceId;
        var disPriceId = discountPriceId;
        //cache price, and make sure it's within bounds....
        var stdPriceOld = jQuery("#" + stdPriceId).val();
        
        var componentSelectionsCustomValidatorValidateSelectedOnly = false;
        var tabIndexOnSave = 99;

        // called when all the controls have been initialised and loaded
        this.OnLoad = function() {

            // attach events to min and max text boxes
            // remove existing events first or the event runs multiple times
            // attach events
            if (!eventsAttached) {

                // attach events to the publish time pickers so we can tell when a time has been entered/edited
                // added try catch to avoid javascript null errors.
                try {
                    $find(publishStartDatePickerId).add_dateSelected(OnPublishStartDateChanged);
                } catch (err) { }

                try {
                    $find(publishStartTimePickerId).add_dateSelected(OnPublishStartTimeChanged);
                } catch (err) { }

                try {
                    $find(publishEndDatePickerId).add_dateSelected(OnPublishEndDateChanged);
                } catch (err) { }

                try {
                    $find(publishEndTimePickerId).add_dateSelected(OnPublishEndTimeChanged);
                } catch (err) { }
                jQuery("#" + this.MinComponentSelectionsTextBoxId).unbind("change", OnMinComponentsChange);
                jQuery("#" + this.MaxComponentSelectionsTextBoxId).unbind("change", OnMaxComponentsChange);
                jQuery("#" + this.MinComponentSelectionsTextBoxId).change(this, OnMinComponentsChange);
                jQuery("#" + this.MaxComponentSelectionsTextBoxId).change(this, OnMaxComponentsChange);

                // attach events to price text fields
                // remove existing events first or the event runs multiple times
                jQuery("#" + stdPriceId).unbind("blur", OnStandardPriceBlur);
                jQuery("#" + disPriceId).unbind("blur", OnDiscountPriceBlur);
                jQuery("#" + stdPriceId).blur(OnStandardPriceBlur);
                jQuery("#" + disPriceId).blur(OnDiscountPriceBlur);

                jQuery("#" + charitableItemId).unbind("change", OnCharitableItemChange);
                jQuery("#" + charitableItemId).change(this, OnCharitableItemChange);

                jQuery("#" + this.IsPremiumCheckBoxId).unbind("change", OnPremiumChange);
                jQuery("#" + this.IsPremiumCheckBoxId).change(this, OnPremiumChange);


                eventsAttached = true;

                var isPremiumCheckBox = jQuery("#" + this.IsPremiumCheckBoxId);
                var isChecked = isPremiumCheckBox.is(':checked');
                PremiumChangeEvent(isChecked,
                    this.MinimumGiftAmountTextBoxId,
                    this.MinimumGiftAmountDivId,
                    this.FairMarketValueLabelId,
                    this.FairMarketValueId,
                    this.MinimumGiftAmountRequiredValidatorId);
            }

            //make sure we stay on the tab we pressed the save button on unless there is issue with page - otherwise we could switch tabs between focus and click (Telerik issue?)
            var saveButton = jQuery("[id$='SaveButton']");//this would be our command button
            var saveAndCloseButton = jQuery("[id$='SaveAndCloseButton']");//command button on existing item
            var commandButtons = [saveButton, saveAndCloseButton];

            commandButtons.forEach(function (cmdButton) {
                cmdButton.focus(function () {
                    var multiPage = $find(multiPageControlId);
                    if (multiPage == null)
                        return;
                    window.tabIndexOnSave = multiPage.get_selectedIndex();
                });
                cmdButton.click(function () {
                    var multiPage = $find(multiPageControlId);
                    var tabControl = $find(tabStripControlId);
                    if (multiPage === null || tabControl === null)
                        return;
                    if (multiPage.get_selectedIndex() === window.tabIndexOnSave)
                        return;
                    if (!Page_IsValid)
                        return;
                    multiPage.set_selectedIndex(window.tabIndexOnSave);
                    tabControl.get_tabs().getTab(window.tabIndexOnSave).select();
                });
            });
            // fire the component selection validator
            this.Fire_ComponentSelectionsCustomValidator(true);

        };




        //called when leaving standard price 
        function OnStandardPriceBlur() {
            var diTidy = TidyPriceString(jQuery("#" + disPriceId).val());
            var oldstTidy = TidyPriceString(stdPriceOld);
            if (diTidy === oldstTidy || diTidy.length === 0)
                jQuery("#" + disPriceId).val(jQuery("#" + stdPriceId).val());

            stdPriceOld = jQuery("#" + stdPriceId).val();
        }

        //called when leaving discount price
        function OnDiscountPriceBlur() {
            // map standard to discount if discount is now empty
            if (jQuery("#" + disPriceId).val().length === 0)
                jQuery("#" + disPriceId).val(jQuery("#" + stdPriceId).val());
        }

        // called when the Min components field changes
        // senderData.data contains a reference to this
        function OnMinComponentsChange(senderData) {
            senderData.data.Fire_ComponentSelectionsCustomValidator();
        }

        // called when the Max components field changes
        // senderData.data contains a reference to this
        function OnMaxComponentsChange(senderData) {
            senderData.data.Fire_ComponentSelectionsCustomValidator();
        }

        // when the Charitable Item checkbox changes, enable or disable/clear
        // out the Fair Market Value textbox based on the current checkbox state.
        // senderData.data contains a reference to this
        function OnCharitableItemChange(senderData) {
            var fmvLabel = jQuery("#" + senderData.data.FairMarketValueLabelId);
            var fmvTextbox = jQuery("#" + senderData.data.FairMarketValueId);
            if (this.checked) {
                fmvLabel.removeClass("aspNetDisabled");
                fmvTextbox.attr('disabled', false);
                fmvTextbox.removeClass("aspNetDisabled");
            } else {
                fmvLabel.addClass("aspNetDisabled");
                fmvTextbox.attr('disabled', true);
                fmvTextbox.addClass("aspNetDisabled");
                fmvTextbox.val("");
            }
        }

        function OnPremiumChange(senderData) {
            PremiumChangeEvent(this.checked,
                senderData.data.MinimumGiftAmountTextBoxId,
                senderData.data.MinimumGiftAmountDivId,
                senderData.data.FairMarketValueLabelId,
                senderData.data.FairMarketValueId,
                senderData.data.MinimumGiftAmountRequiredValidatorId);
        }

        function PremiumChangeEvent(
            premiumCheckBoxIsChecked,
            minimumGiftAmountTextBoxId,
            minimumGiftAmountDivId,
            fairMarketValueLabelId,
            fairMarketValueId,
            minimumGiftAmountRequiredValidatorId) {
            var minimumGiftAmountTextBox = jQuery("#" + minimumGiftAmountTextBoxId);
            var minimumGiftAmountDiv = jQuery("#" + minimumGiftAmountDivId);
            var fmvLabel = jQuery("#" + fairMarketValueLabelId);
            var fmvTextbox = jQuery("#" + fairMarketValueId);
            var minimumGiftAmountRequiredValidator = document.getElementById(minimumGiftAmountRequiredValidatorId);
            if (minimumGiftAmountRequiredValidator === null) {
                return;
            }

            var fmvDiv = fmvLabel.closest('#FMVDiv');
            var fmvPanel = fmvLabel.closest('[id$="FMVTemplate"');
            var jQueryFairMarketValidator = null;
            var premiumDiv = null;
            if (fmvDiv) {
                jQueryFairMarketValidator = fmvDiv.find('[id$="FairMarketRequiredFieldValidator"]');
            }
            if (fmvPanel) {
                premiumDiv = fmvPanel.find('[id$="PremiumSetDiv"]');
            }

            if (premiumCheckBoxIsChecked) {
                minimumGiftAmountDiv.show();
                fmvLabel.removeClass("aspNetDisabled");
                fmvTextbox.attr('disabled', false);
                fmvTextbox.removeClass("aspNetDisabled");
                minimumGiftAmountRequiredValidator.enabled = true;
                ValidatorUpdateDisplay(minimumGiftAmountRequiredValidator);
                indentFmvFieldAndMakeRequired(fmvLabel, fmvDiv, jQueryFairMarketValidator);
                showPremiumDiv(premiumDiv, true);
                var premiumSetSelectionListBox = premiumDiv.find('[id$="chosen"]');
                if (premiumSetSelectionListBox != null && premiumSetSelectionListBox.width() < 1)
                    premiumSetSelectionListBox.width(250);
            } else {
                minimumGiftAmountDiv.hide();
                minimumGiftAmountTextBox.val("0");
                fmvLabel.addClass("aspNetDisabled");
                fmvTextbox.attr('disabled', true);
                fmvTextbox.addClass("aspNetDisabled");
                fmvTextbox.val("");
                minimumGiftAmountRequiredValidator.enabled = false;
                ValidatorUpdateDisplay(minimumGiftAmountRequiredValidator);
                unindentFmvFieldAndRemoveRequired(fmvLabel, fmvDiv, jQueryFairMarketValidator);
                showPremiumDiv(premiumDiv, false);
            }
        }

        function showPremiumDiv(premiumDiv, show) {
            if (!premiumDiv) return;
            if (show) {
                premiumDiv.show();
                return;
            }
            premiumDiv.hide();
        }

        function indentFmvFieldAndMakeRequired(fmvLabel, fmvDiv, jQueryFairMarketValidator) {
            if (!fmvDiv || !jQueryFairMarketValidator) return;

            fmvLabel.addClass("Required");
            fmvDiv.removeClass("Left");
            fmvDiv.addClass("SubItems");
            var fairMarketValidatorElement = jQueryFairMarketValidator.get(0);
            fairMarketValidatorElement.enabled = true;
            ValidatorUpdateDisplay(fairMarketValidatorElement);
        }

        function unindentFmvFieldAndRemoveRequired(fmvLabel, fmvDiv, jQueryFairMarketValidator) {
            if (!fmvDiv || !jQueryFairMarketValidator) return;

            fmvDiv.addClass("Left");
            fmvDiv.removeClass("SubItems");
            var fairMarketValidatorElement = jQueryFairMarketValidator.get(0);
            fairMarketValidatorElement.isvalid = true;
            fairMarketValidatorElement.enabled = false;
            ValidatorUpdateDisplay(fairMarketValidatorElement);
            fmvLabel.removeClass("Required");
        }

        // public functions

        // add an item
        this.AddItem = function (url) {
            if (url === null || url === "") return;
            var dialog = window.ShowDialog(url, null, "95%", "95%", "Add Item", null, "E", null, null, false, false, AddItemOnClose, null);


        };

        // confirm clear of the components list
        this.ConfirmClearComponents = function (radioButton, message) {

            var grid = $find(this.CollectionItemsGrid);
            var MasterTable = grid.get_masterTableView();
            var numItems = MasterTable.get_dataItems().length;

            if (numItems == 0 || confirm(message)) {
                __doPostBack(radioButton.id, '');
            } else {
                return false;
            }
        };

        // validate Min component selection can be met by item set, checks
        // selected components >= min components
        // max components >= min components
        this.ComponentSelectionsCustomValidator = function (source, args) {

            // optional setting to allow us to just validate the component selection
            var validateSelectedOnly = typeof (componentSelectionsCustomValidatorValidateSelectedOnly) == typeof (Boolean()) ? componentSelectionsCustomValidatorValidateSelectedOnly : false;
            componentSelectionsCustomValidatorValidateSelectedOnly = false;    // reset

            // calculate the number of selected components
            var numItems = 0;
            var grid = $find(this.CollectionItemsGrid);
            if (grid) {
                var masterTable = grid.get_masterTableView();
                if (masterTable) {
                    numItems = masterTable.get_dataItems().length;
                }
            }

            // get the min and max values as integers
            var minValue = parseInt(jQuery("#" + this.MinComponentSelectionsTextBoxId).val());
            var maxValue = parseInt(jQuery("#" + this.MaxComponentSelectionsTextBoxId).val());

            // check the standard validators for the minimum and max controls
            // this doesn't run the validators, it just tells us whether they are currently reporting a problem
            var minValid = CheckAllValidatorsForControl(this.MinComponentSelectionsTextBoxId, source.id) && !isNaN(minValue);
            var maxValid = CheckAllValidatorsForControl(this.MaxComponentSelectionsTextBoxId, source.id) && !isNaN(maxValue);

            // are there enough items selected
            // only run if we arent currently reporting another problem with the min field
            if (minValid) {
                if (minValue > 0 && minValue > numItems && minValue <= maxComponentCount) {
                    args.IsValid = false;
                    jQuery(source).text("Item set does not have enough components");
                    return;
                }
            }

            // validate the range
            if (!validateSelectedOnly) {
                // only run if we arent currently reporting another problem with the min or max field
                if (minValid && maxValid) {
                    // only run if we arent currently reporting another problem
                    if (maxValue > 0 && minValue > maxValue && minValue <= maxComponentCount && maxValue <= maxComponentCount) {
                        args.IsValid = false;
                        jQuery(source).text("Invalid range");
                        return;
                    }
                }
            }

        };

        // Fires the component selection custom validator
        // validateSelectedOnly = only validate the minimum component
        this.Fire_ComponentSelectionsCustomValidator = function (validateSelectedOnly) {
            if (me.ComponentSelectionsCustomValidatorClientId != null && me.ComponentSelectionsCustomValidatorClientId.length > 0 && $(me.ComponentSelectionsCustomValidatorClientId) != null) {
                componentSelectionsCustomValidatorValidateSelectedOnly = typeof (validateSelectedOnly) == typeof (Boolean()) ? validateSelectedOnly : false;
                ValidatorValidate($(me.ComponentSelectionsCustomValidatorClientId));
            }
        }

        // private functions



        // Tidies a price string
        // Uses locale settings to format the number
        // Zero prices will be returned as empty
        function TidyPriceString(priceString) {

            // cleanup whitespace
            priceString = jQuery.trim(String(priceString));
            if (priceString === null || priceString.length === 0) return "";

            // determine if we have the Base Type Extensions that .NET injects to test and format numbers based on a locale
            // we should have them
            var useMsExtensions = typeof (Number.parseLocale) != "undefined";

            // convert string to a number
            var n = useMsExtensions ? Number.parseLocale(priceString) : parseFloat(priceString);
            if (isNaN(n) || !isFinite(n)) n = 0;

            // check the range
            if (n < minPrice) n = minPrice;
            if (n > maxPrice) n = maxPrice;

            // return formatted for display
            if (n === 0) return "";
            return useMsExtensions ? n.localeFormat("N2") : n.toFixed(2);

        }

        // called when closing the item edit popup
        function AddItemOnClose(radWin) {
            if (radWin != null &&
                radWin.result != null &&
                radWin.result.length > 0) {

                var result = radWin.result[0];

                radWin.result = null; // clear out radWin.result in case we press the "cancel" button next time in the finder adder
                if (me.HiddenProductGuidTextBoxId != null) {
                    $(me.HiddenProductGuidTextBoxId).value = result;
                }
            }

            if (me.RefreshButtonId != null) {
                $(me.RefreshButtonId).click();
            }

        };

        // Check all validators for a specific control
        // Returns true if they are all IsValid
        function CheckAllValidatorsForControl(controlId, exclude) {
            exclude = "," + exclude + ",";
            valid = true;
            for (var i = 0; i < Page_Validators.length; i++) {
                var v = Page_Validators[i];
                if (v.controltovalidate == controlId && exclude.indexOf("," + v.id + ",") < 0) {
                    // ValidatorValidate(v);
                    valid = valid && v.isvalid;
                }
            }
            return valid;
        }

        this.ValidateDateRanges = function (startDateId, startTimeId, endDateId, endTimeId) {

            // if we have times, then ensure we have dates
            EnsureDateIfTime(startDateId, startTimeId, endDateId);
            EnsureDateIfTime(endDateId, endTimeId, startDateId);

            // construct the return object
            var r = { IsValid: true, ErrorType: "" };

            // get a combined start date and time
            var startDate = $find(startDateId).get_selectedDate();
            var startTime = $find(startTimeId).get_selectedDate();
            var startDateTime = null;
            if (startDate != null && startTime != null)
                startDateTime = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), startTime.getHours(), startTime.getMinutes(), 0, 0);

            // get a combined end date and time
            var endDate = $find(endDateId).get_selectedDate();
            var endTime = $find(endTimeId).get_selectedDate();
            var endDateTime = null;
            if (endDate != null && endTime != null)
                endDateTime = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate(), endTime.getHours(), endTime.getMinutes(), 0, 0);

            // now compare them
            // if dates and times are present for both, then do a range check including the time
            if (startDateTime != null && endDateTime != null) {
                r.ErrorType = "datetime";
                r.IsValid = !(startDateTime > endDateTime);
                return r;
            }
            // if we have both dates, but not necessarily both times, then just check the dates
            if (startDate != null && endDate != null) {
                r.ErrorType = "date";
                r.IsValid = !(startDate > endDate);
                return r;
            }

            return r;
        };

        //private function; checks that if we have a time entered, we also have a date
        // we can't have a time without a date
        function EnsureDateIfTime(datePickerId, timePickerId, defaultDatePickerId) {

            if (settingTime) return;

            settingDate = true;

            var date = $find(datePickerId).get_selectedDate();
            var time = $find(timePickerId).get_selectedDate();
            var defaultDate = $find(defaultDatePickerId).get_selectedDate();
            if (defaultDate == null) defaultDate = new Date();

            if (date == null && time != null)
                $find(datePickerId).set_selectedDate(defaultDate);

            settingDate = false;
        }

        // checks that if there is no date there is no time
        // we can't have a time without a date
        function ClearTimeIfNoDate(datePickerId, timePickerId) {

            if (settingDate) return;

            settingTime = true;

            var date = $find(datePickerId).get_selectedDate();
            var time = $find(timePickerId).get_selectedDate();

            if (date == null && time != null)
                $find(timePickerId).set_selectedDate(null);

            settingTime = false;
        }


        // Initialize the time if the date is set and the time is not already set.
        // When end param is true time is intialized to 11:59 PM, otherwise 12 AM.
        function InitTimeIfDateAndNoTime(datePickerId, timePickerId, end) {

            if (settingDate) return;

            settingTime = true;

            var date = $find(datePickerId).get_selectedDate();
            var time = $find(timePickerId).get_selectedDate();

            if (date != null && time == null) {
                var newDate = new Date();
                if (end)
                    newDate.setHours(23, 59, 59, 999);
                else
                    newDate.setHours(0, 0, 0, 0);
                $find(timePickerId).set_selectedDate(newDate);
            }

            settingTime = false;
        }

        // fire the publish date range validator
        function FirePublishDateRangeValidator() {
            ValidatorValidate($(publishDateRangeValidator));
        }

        // private functions for publish start date
        // called when publish start date is changed
        function OnPublishStartDateChanged(sender, eventArgs) {
            ClearTimeIfNoDate(publishStartDatePickerId, publishStartTimePickerId);
            InitTimeIfDateAndNoTime(publishStartDatePickerId, publishStartTimePickerId, false);
            FirePublishDateRangeValidator();
        }
        // called when start time is changed
        function OnPublishStartTimeChanged(sender, eventArgs) {
            EnsureDateIfTime(publishStartDatePickerId, publishStartTimePickerId, publishEndDatePickerId);
            FirePublishDateRangeValidator();
        }

        // called when end date is changed
        function OnPublishEndDateChanged(sender, eventArgs) {
            ClearTimeIfNoDate(publishEndDatePickerId, publishEndTimePickerId);
            InitTimeIfDateAndNoTime(publishEndDatePickerId, publishEndTimePickerId, true);
            FirePublishDateRangeValidator();
        }

        // called when end time is changed
        function OnPublishEndTimeChanged(sender, eventArgs) {
            EnsureDateIfTime(publishEndDatePickerId, publishEndTimePickerId, publishStartDatePickerId);
            FirePublishDateRangeValidator();
        }

    }
