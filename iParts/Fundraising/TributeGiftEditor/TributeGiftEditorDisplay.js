/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactManagement_TributeGiftEditorDisplay(detailsPanelID, radioOptionsName, notifyPanelID, checkboxID, tributeAccountValidatorID, showTributeNotifyPanelID, honoreeNameComboBoxClientId) {

    var saveEnabledArray = new Array();
    var validatorArray;

    var internalHonoreeNameComboBoxClientId = honoreeNameComboBoxClientId;

    this.HonoreeNameComboBoxOnClientItemsRequesting = function (sender, eventArgs) {
        // Cancel autocomplete and hide drop down if we have typed less than 3 characters
        eventArgs.set_cancel(sender._inputDomElement.value.length < 3);
    };

    this.HonoreeNameComboBoxOnClientItemsRequested = function (sender, eventArgs) {
        if (sender.get_items().get_count() > 0 && !sender.get_dropDownVisible()) {
            sender.showDropDown();
        }
        else if (sender.get_items().get_count() == 0) {
            sender.hideDropDown();
        }
    };

    this.HonoreeNameComboBoxOnClientDropDownOpening = function(sender, args) {
        // Hide drop down if we have typed less than 3 characters or there are no items to show
        if (sender._inputDomElement.value.length < 3 || sender.get_items().get_count() == 0) {
            args.set_cancel(true);
        } 
    };

    this.HonoreeNameComboBoxKeyPressing = function (sender, args) {
        if (args.get_domEvent().keyCode == 8 || args.get_domEvent().keyCode == 127) { // Backspace or Delete key pressed
            sender._markFirstMatch = false; //This allows users to enter values not in combo, but shortened versions of existing items. Turns off autocomplete 
        } else {
            sender._markFirstMatch = true;
        }
    };

    this.HonoreeNameComboBoxOnClientBlur = function (sender, args) {
        sender.hideDropDown();
    };

    jQuery(document).ready(function () {

        // Tribute settings
        ToggleTributeDetails(true);
        jQuery("input[name$='" + radioOptionsName + "']").click(function () { ToggleTributeDetails(false); ToggleTributeNotificationDetails(false); });

        // Validator array
        var el = jQuery("#" + tributeAccountValidatorID);
        if (el.length == 0) {
            alert('unable to access account ids');
            return;
        }

        // remember the original enabled and disabled settings for the validators
        var idString = el.val();
        validatorArray = idString.split(',');

        // remember validators enabled and disabled
        for (var i = 0; i < validatorArray.length; i++) {
            var validator = document.getElementById(validatorArray[i]);
            if (validator) {
                saveEnabledArray[i] = validator.enabled;
            }
        }

        // Notification settings
        ToggleTributeNotificationDetails(true);

        if (showTributeNotifyPanelID.length != 0) {
            // hide the notify panel            
            jQuery('#' + showTributeNotifyPanelID).hide();
        }
        else {
            // display notify options
            jQuery("#" + checkboxID).click(function () { ToggleTributeNotificationDetails(false); });
        }

    });


    //Toggle the display/show of our tribute details
    function ToggleTributeDetails(firstLoad) {
        var detailPanel = jQuery("#" + detailsPanelID);
        // get the checked radio option
        var selectedRadio = jQuery("input[name$='" + radioOptionsName + "']:checked");

        if (selectedRadio.val() == 'true') {
            detailPanel.show("slow");
        }
        else {
            if (!firstLoad) {
                // detailPanel.show("slow"); // TO DEBUG
                detailPanel.hide("slow");                
            }
            else {
                // detailPanel.show("slow"); // TO DEBUG
                detailPanel.hide(); // on first load, if hiding then do it quickly, otherwise it looks strange                
            }
        }
    }


    // Toggle the display of the Notification details
    function ToggleTributeNotificationDetails(firstLoad) {
        var notifyPanel = jQuery("#" + notifyPanelID);
        // get the checkbox
        var notifyCheckbox = jQuery("#" + checkboxID);
        // get the radio button
        var selectedRadio = jQuery("input[name$='" + radioOptionsName + "']:checked");

        if (notifyCheckbox.is(':checked') && selectedRadio.val() == 'true') {
        	notifyPanel.show("slow");
            TributeValidatorEnable(true);
        }
        else {
            if (!firstLoad) {
                // notifyPanel.show(); // TO DEBUG
            	notifyPanel.hide("slow");
                TributeValidatorEnable(false);
            }
            else {
                // notifyPanel.show(); // TO DEBUG
                notifyPanel.hide(); // on first load, if hiding then do it quickly, otherwise it looks strange
                TributeValidatorEnable(false);
            }
        }
    }

    // These functions allow us to call ToggleTributeDetails and ToggleTributeNotificationDetails as instance members.
    // (see the code-behind OnLoad)
    this.ToggleTributeDetailsExt = function (firstLoad) {
        ToggleTributeDetails(firstLoad);
    };

    this.ToggleTributeNotificationDetailsExt = function (firstLoad) {
        ToggleTributeNotificationDetails(firstLoad);
    };

    // enable or disable the validators on the contact account creator embedded iPart
    function TributeValidatorEnable(isEnabled) {

//        var el = jQuery("#" + tributeAccountValidatorID);
//        if (el == null) {
//            alert('unable to access account ids');
//            return;
//        }
//        
//        var idString = el.val();
        //        var validatorArray = idString.split(',');

        var setCount = 0;
        if (validatorArray == null) return;
        for (var i = 0; i < validatorArray.length; i++) {
            var validator = document.getElementById(validatorArray[i]);
            if (validator) {
                // ValidatorEnable(validator, isEnabled); // This is the recommended way, but it fires the validators when called
                if (isEnabled) {
                    validator.enabled = saveEnabledArray[i];
                }
                else {
                    validator.enabled = false;
                }
                ValidatorUpdateIsValid(); 
                setCount++;
            }
            else {
                // this is ok - we sometimes don't show all the controls
                // for example if the logon controls aren't wanted
            }
        }

        // alert('Set ' + setCount + ' Enabled to ' + isEnabled);
    }
}