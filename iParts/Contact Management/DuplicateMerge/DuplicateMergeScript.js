
function Asi_Web_iParts_ContactManagement_DuplicateMerge() {
    this.SecondContactPartyId = null;
    this.SwitchContactsLinkId = null;
    this.SelectDuplicateContactButtonId = null;
    this.ContactToKeepPartyId = null;
    this.Url = null;
    this.MergeButtonId = null;
    this.NotDuplicatesButtonId = null;

    this.SelectDuplicateDialogCallback = function (radWindow) {
        if (!radWindow.result || this.SecondContactPartyId == null)
            return;

        if (radWindow.result != '' & radWindow.result != null) {
            jQuery('#' + this.SecondContactPartyId).val(radWindow.result);
            radWindow.result = '';
            radWindow.close();
            jQuery('#' + this.SelectDuplicateContactButtonId).click();
        }
    };

    this.SelectContact = function (obj) {
        if (!obj || jQuery(obj).prop('value') == null)
            return;

        var selectedId = (jQuery(obj).prop('value'));
        if (selectedId.length < 2)
            return;

        jQuery('#' + this.SecondContactPartyId).val(selectedId);

        var radioButtons = jQuery("input[name='ContactRadioOptions']");
        if (radioButtons && radioButtons.length == 2) {
            var userSelectedContactId =  radioButtons.eq(0).prop('value');
            jQuery('#' + this.ContactToKeepPartyId).val(userSelectedContactId);
        }

        jQuery('#' + this.SelectDuplicateContactButtonId).click();
    };

    this.SwitchContacts = function (ob) {
        var userSelectedContactId = jQuery(ob).prop('value');
        jQuery('#' + this.ContactToKeepPartyId).val(userSelectedContactId);
        jQuery('#' + this.SwitchContactsLinkId).click();
        enableDisableButton(false, this.MergeButtonId);
        enableDisableButton(false, this.NotDuplicatesButtonId);
    };

    this.ShowMergeConfirmationDialog = function (mergeButtonId, cancelButtonId, notDuplicatesButtonId) {
        var ans = confirm('Duplicate contact will be deleted. This operation cannot be undone. Do you wish to continue?');
        if (ans == true) {
            enableDisableButton(false, mergeButtonId);
            enableDisableButton(false, cancelButtonId);
            enableDisableButton(false, notDuplicatesButtonId);
            jQuery('[ID$=HiddenMergeButton]').click();
        }
    };

    this.ShowMarkNotDuplicatesConfirmationDialog = function (mergeButtonId, cancelButtonId, notDuplicatesButtonId) {
        var ans = confirm('Are you sure these contacts are not duplicates? This operation cannot be undone.');
        if (ans == true) {
            enableDisableButton(false, mergeButtonId);
            enableDisableButton(false, cancelButtonId);
            enableDisableButton(false, notDuplicatesButtonId);
            jQuery('[ID$=HiddenNotDuplicatesButton]').click();
        }
    };

    this.DisableMergeAndNotDuplicatesButtons = function () {
        enableDisableButton(false, this.MergeButtonId);
        enableDisableButton(false, this.NotDuplicatesButtonId);
    }

    this.EnableMergeAndNotDuplicatesButtons = function () {
        enableDisableButton(true, this.MergeButtonId);
        enableDisableButton(true, this.NotDuplicatesButtonId);
    }

    enableDisableButton = function (enable, buttonId) {
        var button = jQuery('#' + buttonId);
        if (button && button.length == 1)
            enable ? button.removeAttr("disabled") : button.attr("disabled", "disabled");
    };

    this.RefreshParentWindow = function () {
        CancelButton_Click(this.Url);
    };
    
    this.RedirectAfterSuccessfulMerge = function (idParamName, contactPartyId, queryStringDisplayMessage) {
        var url = gWebRoot + "/Party.aspx?" + idParamName + "=" + contactPartyId + "&" + queryStringDisplayMessage + "=true";
        var oWindow = GetRadWindow();
        if (oWindow && oWindow.BrowserWindow && oWindow.BrowserWindow.parent) {
            oWindow.BrowserWindow.parent.location = url; // popups
        } else {
            window.location = url;
        }
    };
}

//////////////////////////////////////////////////////////////////////////////////////////////////
// The following js handles the collapsible sections (tags with a "data-collapsible" attribute).
//////////////////////////////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function () {
    // Ensures this works across ajax requests.
    Sys.Application.add_load(function () {
        handleExpandCollapseClick();
        // Click each Dynamic BO sub-section so they appear collapsed on initial page load.
        clickCollapsibleAreas();
        hideShow20GridLink();

        Sys.Application.remove_load(function () {
            handleExpandCollapseClick();
            clickCollapsibleAreas();
            hideShow20GridLink();
        });
    });

    // Seems like a bug that the "show 20" link displays sometimes since paging is off.  Just hide it 'for now'.
    function hideShow20GridLink() {
        var show20Links = jQuery('a');
        if (show20Links) {
            jQuery(show20Links).each(function () {
                if (jQuery(this).text() == 'show 20')
                    jQuery(this).hide();
            });
        }
    }

    function handleExpandCollapseClick() {
        var fields = jQuery('*[data-collapsible]');
        if (fields == null) return;
        for (var i = 0; i < fields.length; i++) {
            var tempField = fields[i];
            if (tempField == null) continue;
            var tempEntityName = jQuery(tempField).data('collapsible_entity');
            createClickHandler(tempField, tempEntityName);
            createHoverHandler(tempField);
        }
    }

    function createClickHandler(field, entityName) {
        if (field == null) return;
        var clickField = jQuery(field);
        if (clickField == null) return;
        clickField.click(function () {
            var fields = jQuery('*[data-' + entityName + ']').closest('tr');
            if (fields == null) return;

            // Toggle (hide/show) the fields.
            fields.toggle();

            //fields.css({'border-color': 'blue'},{'border-width': '2pt'});
            //fields.each(function () {
            //    try {
            //        jQuery(this).css([['border-color', 'blue']['border-width', '2']]);
            //    } catch (e) {
            //        // do nothing
            //    } 
            //});

            // Toggle the expand/collapse image.
            var parentClickableField = jQuery('#' + entityName);
            if (parentClickableField != null) {
                if (parentClickableField.prop('src').indexOf(gWebRoot + '/images/Icons/Plus.gif') >= 0)
                    parentClickableField.prop('src', gWebRoot + '/images/Icons/Minus.gif');
                else
                    parentClickableField.prop('src', gWebRoot + '/images/Icons/Plus.gif');
            }
        });
    }

    function createHoverHandler(field) {
        if (field == null) return;
        var clickField = jQuery(field);
        if (clickField == null) return;
        clickField.hover(
            function () { // mouse over
                jQuery(this).css('cursor', 'pointer');
            },
            function () { // mouse out
                jQuery(this).css('cursor', 'default');
            }
        );
    }

    function clickCollapsibleAreas() {
        var fields = jQuery('*[data-collapsible]');
        if (fields == null) return;
        fields.each(function () {
            this.click();
        });
    };
});
