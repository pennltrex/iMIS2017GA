/*
Extends client side functionality to Asi.Web.BusinessDataGrid2

(string)    params.GridClientId                         : the element id of the grid control
(bool)      params.IsMultSelect                         : indicates the grid is in multi select mode
(bool)      params.TrackItemSelectionAcrossPostbacks    : indicates we are tracking item selection across postbacks (sorts, page changes etc)
(bool)      params.IsSelectedByDefault                  : indicates the default selected mode for all rows in a multi select grid
(string)    params.DeltaKeys                            : string of keys holding the current selection deltas in a multi select grid

*/
function Asi_Web_BusinessDataGrid2(params) {

    var self = this;        // keep a reference to this object which we can use when "this" refers to something else
    var grid = null;        // will store a reference to the grid when it has been created

    // format recieved parameters
    if (params.GridClientId === undefined) params.GridClientId = null;
    if (params.IsMultiSelect !== true) params.IsMultiSelect = false;
    if (params.TrackItemSelectionAcrossPostbacks !== true) params.TrackItemSelectionAcrossPostbacks = false;
    if (params.IsSelectedByDefault !== true) params.IsSelectedByDefault = false;
    if (params.DeltaKeys === undefined) params.DeltaKeys = null;

    // public functions

    // event handler for OnGridCreated
    this.OnGridCreated = function (sender, eventArgs) {
        grid = sender;
        if (params.IsMultiSelect === true && params.TrackItemSelectionAcrossPostbacks)
            storeDeltaKeys();
    };

    // event handler for OnRowCreated
    this.OnRowCreated = function (sender, eventArgs) {
    };

    // event handler for OnRowSelected
    this.OnRowSelected = function (sender, eventArgs) {
        if (params.IsMultiSelect === true && params.TrackItemSelectionAcrossPostbacks)
            trackRowSelection(eventArgs.get_gridDataItem(), eventArgs.get_tableView());
    };

    // event handler for OnRowDeselected
    this.OnRowDeselected = function (sender, eventArgs) {
        if (params.IsMultiSelect === true && params.TrackItemSelectionAcrossPostbacks)
            trackRowSelection(eventArgs.get_gridDataItem(), eventArgs.get_tableView());
    };

    // private functions

    // Stores the delta keys in a hidden field in the grid.
    // Creates the hidden field.
    // The field is submitted with all posts including AJAX updates.
    function storeDeltaKeys() {

        // remove any existing instances of the hidden field
        // there shouldn't be any
        jQuery("#" + getDeltaKeyElementName()).remove();

        // add to the grid
        jQuery("#" + params.GridClientId).append('<input type="hidden" id="' + getDeltaKeyElementName() + '" name="' + getDeltaKeyElementName() + '" />');

        // set value
        if (typeof params.DeltaKeys !== undefined)
            setDeltaKeys(params.DeltaKeys);

    }

    // Track change of a selected status for a row
    function trackRowSelection(gridDataItem, tableView) {
        if (gridDataItem === undefined || gridDataItem == null) return;
        if (tableView === undefined || tableView == null) return;
        var keyString = getItemKeyString(gridDataItem, tableView);
        if (keyString != null) {
            var selected = gridDataItem.get_selected();
            if (params.IsSelectedByDefault === true)
                // if rows are selected by default, we track excluded key values 
                updateDeltaKeys(!selected, keyString);
            else
                // if rows are not selected by default, we track included key values 
                updateDeltaKeys(selected, keyString);
        }
    }

    /// Gets a single key string for an item.
    /// Combines all data key values in the format
    /// {key=value}{key=value}..... e.g. {Id=123}{Parent=xyz}
    function getItemKeyString(gridDataItem, tableView) {
        if (gridDataItem === undefined || gridDataItem == null) return null;
        if (tableView === undefined || tableView == null) return null;
        var keys = tableView.get_clientDataKeyNames();
        if (keys != null && keys.length > 0) {
            var keyString = "";
            for (var i = 0; i < keys.length; i++) {
                keyString += "{" + keys[i] + ":" + gridDataItem.getDataKeyValue(keys[i]) + "}";
            }
            return keyString;
        }
        return null;
    }

    // Update the delta keys by adding/removing a specific key
    // add : (bool) true=add, false=remove
    // key : the key 
    function updateDeltaKeys(add, key) {
        var keys = getDeltaKeys();
        if (keys == null) return;
        var a = (keys + "").length == 0 ? new Array() : keys.split(",");
        // use jQuery.inArray() as it is compatible with all older browsers where indexOf() is not
        var i = jQuery.inArray(key, a);
        if (i >= 0 && !add)
            a.splice(i, 1);
        else if (i < 0 && add)
            a.push(key);
        setDeltaKeys(a.toString());
    }

    // Gets the current delta keys
    function getDeltaKeys() {
        var e = getHiddenDeltaKeysElement();
        if (e != null)
            return jQuery(e).val();
        return null;
    }

    // Sets the current delta keys
    function setDeltaKeys(value) {
        var e = getHiddenDeltaKeysElement();
        if (e != null) {
            jQuery(e).val(value);
        }
    }

    // Gets the name of the hidden input field we use for storing delta keys
    function getDeltaKeyElementName() {
        return params.GridClientId + "_HiddenDeltaSelectedKeys";
    }

    // Gets the hidden input element that stores the delta keys
    // Returns the jQuery object or null if it could not be located
    function getHiddenDeltaKeysElement() {
        var e = jQuery("#" + getDeltaKeyElementName());
        if (e.length == 1) {
            return e[0];
        }
        return null;
    }

}