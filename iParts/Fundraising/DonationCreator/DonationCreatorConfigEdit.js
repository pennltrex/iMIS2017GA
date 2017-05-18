
function Asi_Web_iParts_Fundraising_DonationCreator_ConfigEdit()
{
 
    this.OnLoad = function (configurationSectionId,
        displayPremiumsId,
        displayModeId,
        processingModeControlId,
        displayPremiumsSectionId,
        giftArrayIQAQueryPathId) {
        var displayPremiumsCheckBox = jQuery(displayPremiumsId).find(":checkbox");
        var processingModeControl = jQuery(processingModeControlId);
        var displayPremiumsSection = jQuery(displayPremiumsSectionId);
        var selectedProcessingModeValue = processingModeControl.find(":radio:checked").val();
        if (selectedProcessingModeValue == 'GiveNGo') {
            displayPremiumsSection.show();
        }  
        else {
            displayPremiumsSection.hide();
            displayPremiumsCheckBox.prop('checked', false);
        }

        if (displayPremiumsCheckBox.prop('checked') == false)
            jQuery(giftArrayIQAQueryPathId).show();

        this.RestoreGiftAmountLabelValue(displayPremiumsSectionId);
    }

    this.ToggleSectionVisibilityForDisplayMode = function (selectControlId, displayAmountFirstDivId, selectGiftFirstDivId, giftArrayIQAQueryPathId, premiumSectionId) {
        var displayModeControl = jQuery(selectControlId);
        var selectedValue = displayModeControl.find(":radio:checked").val();
        var giftArrayIQAQueryPathControl = jQuery(giftArrayIQAQueryPathId);
        if (selectedValue == 'SelectGiftFirst') {
            jQuery(displayAmountFirstDivId).hide();
            jQuery(selectGiftFirstDivId).show();
            this.RestoreGiftAmountLabelValue(premiumSectionId);
            giftArrayIQAQueryPathControl.hide();
            return;
        }
        jQuery(displayAmountFirstDivId).show();
        jQuery(selectGiftFirstDivId).hide();
        giftArrayIQAQueryPathControl.show();
        this.RestoreGiftAmountLabelValue(premiumSectionId);
    };

    this.ToggleSectionVisibility = function(id, premiumSectionId, giftArrayIQAQueryPathId) {
        var displayElement = jQuery(id);
        this.RestoreGiftAmountLabelValue(premiumSectionId);

        if (displayElement.is(":visible")) {
            displayElement.hide();
            if (giftArrayIQAQueryPathId.length > 1) {
                jQuery(giftArrayIQAQueryPathId).show();
            }
            return;
        }
       
        displayElement.show();
        if (giftArrayIQAQueryPathId.length > 1) {
            var displayAmountFirstDiv = jQuery(premiumSectionId).find('[id$=DisplayAmountFirstDiv]');
            if (displayAmountFirstDiv.is(":visible") == false)
                jQuery(giftArrayIQAQueryPathId).hide();
        }
        this.ScrollBottom(displayElement);
    };

    this.ToggleDisplayPremiumsVisibility = function (displayPremiumsSectionId,
        displayPremiumsCheckBoxId,
        displayPremiumsConfigSectionId) {
        this.RestoreGiftAmountLabelValue(displayPremiumsConfigSectionId);
        var displayPremiumsSection = jQuery(displayPremiumsSectionId);
        var premiumsCheckBox = jQuery(displayPremiumsCheckBoxId).find(":checkbox");
        var displayPremiumsConfigSection = jQuery(displayPremiumsConfigSectionId);

        if (displayPremiumsSection.is(":visible")) {
            displayPremiumsSection.hide();
            premiumsCheckBox.prop('checked', false);      
            return;
        }

        displayPremiumsSection.show();
        displayPremiumsConfigSection.hide();
    };


    this.RestoreGiftAmountLabelValue = function (displayPremiumSectionId) {
        //avoids validator error when field is hidden - restores default value if cleared
        var displayPremiumsSection = jQuery(displayPremiumSectionId);

        var amountTextBox = displayPremiumsSection.find('[id$=PremiumGiftAmountLabel_TextField]');
        var textBoxValue = jQuery.trim(amountTextBox.val());
        if (textBoxValue.length == 0) {
            amountTextBox.val('Gift Amount:');
            ValidatorValidate(displayPremiumsSection.find('[id$=PremiumGiftAmountLabel_RequiredFieldValidator]')[0]);//get rid of any previous "required" warning
        }

    };

    this.ScrollBottom = function (element) {
        var mainContainer = element.closest(".EmptyMasterContentPanel");
        if (!mainContainer) return;
        mainContainer.scrollTop(1000);
    }
}
