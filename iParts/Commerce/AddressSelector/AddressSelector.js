function Asi_Web_AddressSelector(addressIdText, AddressButton, ButtonRefresh) {

    this.UseAddressIdText = addressIdText;
    this.UseAddressButton = AddressButton;
    this.ButtonRefresh = ButtonRefresh;    

    // called to manage addresses
    this.ManageAddresses = function() {
        this.CloseDialog("ManageAddresses", "");
    };

    // close the dialog
    this.CloseDialog = function(action, addressId) {
        var w = GetRadWindow();
        if (w == null) return;
        var r = this.ConstructResultsObject();
        r.Action = action;
        r.AddressId = addressId;
        w.AsiResults = r;
        w.Close();
    };

    // called when an address is selected and ChooseAddressMode==Path
    this.UseAddress_Path = function (addressId) {
        $(this.UseAddressIdText).value = addressId;        
        $(this.UseAddressButton).click();
    };

    // called when an address is selected and ChooseAddressMode==Party
    this.UseAddress_Party = function(addressId) {
        this.CloseDialog("AddressSelected", addressId);
    };

    // called after an address has been inserted
    this.InsertAddress_Callback = function(results) {
        if (results != null && typeof(results) == "object") {
            if (results.Saved == true)
                $(this.ButtonRefresh).click();
        }
    };

    // construct the return object
    this.ConstructResultsObject = function() {
        return { AddressId: "", Action: "" };
    };
}