/// <reference path="Scripts/jquery-1.7-vsdoc.js" />

function Asi_Web_iParts_ContactManagement_DisplayNameEditorEdit(SalutationTypeControlId, ListAsValue) {

	jQuery(document).ready(function () {
		var salutationDD = jQuery("#" + SalutationTypeControlId);

		// configure page correctly on start up
		if (salutationDD.val().toUpperCase() != ListAsValue.toUpperCase()) {
			jQuery("#anonPanel").find(':input:not(:disabled)').prop('disabled', true);
		}
		// hook up to the change event of the salutation type DD and hide/show anon checkbox
		salutationDD.change(function () {
			if (jQuery(this).val().toUpperCase() == ListAsValue.toUpperCase()) {
				jQuery("#anonPanel").find(':input:disabled').prop('disabled', false);
			}
			else {
				// disable inputs/labels if they are not yet disabled
				jQuery("#anonPanel").find(':input:not(:disabled)').prop('disabled', true);
			}
		});

	});
}