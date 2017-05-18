function Asi_Web_iParts_Events_FunctionDisplayDisplay() {

    var RefreshButtonId = null;

    // public functions

    // edit a function
    this.EditFunction = function (eventKey, functionKey, url, refreshButtonId) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey + "&FunctionKey=" + functionKey;
        else
            url += "?EventKey=" + eventKey + "&FunctionKey=" + functionKey;
        RefreshButtonId = refreshButtonId;
        var dialog = ShowDialog(url, null, "95%", "95%", "Edit Program Item", null, "E", null, null, false, false, FunctionEditOnClose, null);

        // dialog.set_destroyOnClose(true);
    };

    // delete a function
    this.DeleteFunction = function (deleteButtonId, confirmMessage) {
        if (confirm(confirmMessage)) {
            $(deleteButtonId).click();
        }
    };

    // private functions

    // called when closing the function edit popup
    function FunctionEditOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && RefreshButtonId != null) {
            $(RefreshButtonId).click();
        }
    };

}