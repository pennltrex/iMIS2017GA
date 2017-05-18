function ContactAddressEditorClass() {

    this.EditDialogUrl;
    this.NewAddress;
    this.PreviousTabHidden;
    this.RadAjaxPanel;
    this.SingleTextAddress;

    // Save the current tab's index before going to the selected tab
    this.ClientTabSelectingHandler = function (sender, eventArgs) {
        var tab = eventArgs.get_tab();
        if (tab.get_text() != "+") {
            // Use to track the previous tab selected
            $get(this.PreviousTabHidden).value = tab.get_index();
        }
    };

    this.ClientTabSelectedHandler = function (sender, eventArgs) {
        
        var tab = eventArgs.get_tab();
        if (tab.get_text() == "+") {
            this.CreateNewAddress(sender); return false;
        }
    };

    // this is in a separate function so that it can be called via a link too if needed
    this.CreateNewAddress = function (sender) {
        var obj = this;
        var sUrl = this.EditDialogUrl;
        //check to see if url contains paramerters.  If so add "&".
        if (sUrl.indexOf("?") > 0) {
            sUrl += "&";
        }
        else {  // no params so must add "?" instead of "&"
            sUrl += "?";
        }
        sUrl += "SingleTextAddress=" + this.SingleTextAddress;
        ShowDialog(sUrl, null, 900, 615, this.NewAddress, null, 'E', function (sender) { obj.NewAddressCallBackFunction(sender); }, null, true, true, null, null);
    };

    this.NewAddressCallBackFunction = function (radWindow) {
        var refreshTab = $find(this.RadAjaxPanel).ajaxRequest("refreshTrigger");
    };

}