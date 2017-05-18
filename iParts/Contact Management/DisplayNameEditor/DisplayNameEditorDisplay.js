/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactManagement_DisplayNameEditorDisplay(displayNameTextControlId, anonCheckboxId) {

	var PreviousValue = undefined;

	jQuery(document).ready(function () {
		var checkbox = jQuery("#" + anonCheckboxId);
		SetTextBoxState(checkbox); // make sure our page is setup correctly after a postback

		// hook up click event to our checkbox
		checkbox.click(function () {
			SetTextBoxState(jQuery(this));
		});
	});

	function SetTextBoxState(checkbox) {
		var displayName = jQuery("#" + displayNameTextControlId);
		if (checkbox.is(':checked')) {
			displayName.attr('disabled', true);
			PreviousValue = displayName.val();
			displayName.val("");
		}
		else {
			displayName.removeAttr('disabled');
			// this if prevents us clearing out a pre-postback (viewstate) value during the page load
			if (PreviousValue != undefined) {
				displayName.val(PreviousValue);
			}
		}
	}

	this.EditCallBack = function (radWin) {
	    var refresh = false;
	    if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
	        refresh = radWin.IsDirty;
	    }
	    else {
	        // if for some reason we dont get a rad window then assume we should refresh
	        refresh = true;
	    }
	    if (refresh)
	        window.location.reload();
	};
    
}