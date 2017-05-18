function Asi_Web_iParts_PrimaryOrganizationSelectorDisplay() {

    this.PrimaryOrganizationOnClientItemsRequesting = function (sender, eventArgs) {
        // Cancel autocomplete and hide drop down if we have typed less than 3 characters
        eventArgs.set_cancel(sender._inputDomElement.value.length < 3);
    };

    this.PrimaryOrganizationOnClientDropDownOpening = function (sender, args) {
        // Hide drop down if we have typed less than 3 characters
        args.set_cancel(sender._inputDomElement.value.length < 3);
    };

    this.PrimaryOrganizationOnClientBlur = function (sender) {
        sender.hideDropDown();
    };

    this.PrimaryOrganizationComboBoxKeyPressing = function (sender, args) {
        if (args.get_domEvent().keyCode == 8 || args.get_domEvent().keyCode == 127) { // Backspace or Delete key pressed
            sender._markFirstMatch = false; //This allows users to enter values not in combo, but shortened versions of existing items. Turns off autocomplete 
        } else {
            sender._markFirstMatch = true;
        }
    };
}