function Asi_Web_iParts_Events_UpdateAttendance() {

    var _this = this;
    this.RegistrantGridID;
    this.RegistrantsAjaxLoadingPanel;

    this.OnLoad = function() { }

    this.AttendedCheckBoxClicked = function(sender, index) {
        var grid = $find(_this.RegistrantGridID);
        var masterTableView = grid.get_masterTableView();
        var isAttended = sender.checked;
        var row = masterTableView.get_dataItems()[index];
        var unitsLabel = row.findElement("UnitsLabel");
        var unitsTextbox = row.findElement("UnitsTextBox");

        unitsLabel.style.display = (isAttended) ? "none" : "block";
        unitsTextbox.style.display = (isAttended) ? "block" : "none";

        if (isAttended) {
            var units = parseFloat(unitsLabel.innerHTML);
            if (units === 0) {
                var originalUnits = parseFloat(row.get_cell("OriginalCreditUnits").innerHTML);
                if (originalUnits > 0) {
                    unitsTextbox.value = row.get_cell("OriginalCreditUnits").innerHTML;
                } else {
                    unitsTextbox.value = row.get_cell("FunctionUnits").innerHTML;
                }
            } else {
                unitsTextbox.value = unitsLabel.innerHTML;
            }
        }
        else {
            unitsLabel.innerHTML = "0.00";
        }
    }
    this.ShowLoadingPanel = function() {
        jQuery("#" + _this.RegistrantsAjaxLoadingPanel).show();
    }
}