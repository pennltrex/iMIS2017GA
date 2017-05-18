function Asi_Web_iParts_Events_EventAdd(radioButtonTemplate,
    radioButtonEvent,
    radioButtonBlank,
    nextButton,
    selectTemplateHasValues,
    selectEventHasValues) {

    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {
        jQuery('#' + radioButtonTemplate + ', #' + radioButtonEvent + ', #' + radioButtonBlank).click(EnableDisableNextButton);
    }

    // Enable/Disable Next button based on the available options within the event and template select lists
    function EnableDisableNextButton(sender) {
        if (nextButton == null) return console.log("Exception (Asi_Web_iParts_Events_EventAdd.ShowHideNextButton): Next button cannot be found.");
        if (sender.currentTarget.id == null) return console.log("Exception (Asi_Web_iParts_Events_EventAdd.ShowHideNextButton): Sender ID is null.");
        if ((sender.currentTarget.id === radioButtonTemplate && selectTemplateHasValues == 'False') ||
            (sender.currentTarget.id === radioButtonEvent && selectEventHasValues == 'False')) {
                jQuery('#' + nextButton).prop('disabled', true);
        }
        else{
            jQuery('#' + nextButton).prop('disabled', false);
        }
    }
}