

function Asi_Web_iParts_Common_QueryMenuDisplay() {

    // Finalises the map layout - i.e. centre and zoom -
    this.ErrorLabelId;
    
    this.FinalizeMap = function (map, msg1, msg2) {
        if (map != null) {
            var statusDiv = jQuery('#statusDiv');
            var errorDiv = $get(this.ErrorLabelId);

            // calc mid points of long and lat 
            var latDiv = jQuery('#latDiv');
            var longDiv = jQuery('#longDiv');

            if ((latDiv.length > 0) && (longDiv.length > 0)) {
                if (statusDiv.length > 0) {
                    errorDiv.text(msg1);
                    statusDiv.hide();
                }
                ;
                var latMinValue = parseFloat(latDiv.attr('MinValue'));
                var latMaxValue = parseFloat(latDiv.attr('MaxValue'));
                var longMinValue = parseFloat(longDiv.attr('MinValue'));
                var longMaxValue = parseFloat(longDiv.attr('MaxValue'));

                var midLat = latMinValue + ((latMaxValue - latMinValue) / 2);
                var midLong = longMinValue + ((longMaxValue - longMinValue) / 2);

                var latlng = new google.maps.LatLng(midLat, midLong);

                var gw = 256;
                var angle = longMaxValue - longMinValue;
                if (angle < 0) {
                    angle += 360;
                }
                var pixelWidth = 256;
                var zoomLevel = 0;
                zoomLevel = Math.round(Math.log(pixelWidth * 360 / angle / gw) / Math.LN2);
                zoomLevel = zoomLevel - 2;
                if (zoomLevel > 15) {
                    zoomLevel = 15;
                }
                if (zoomLevel < 2) {
                    zoomLevel = 2;
                }
                var myOptions = {
                    zoom: zoomLevel,
                    center: latlng
                };
            } else {
                // This means nothing was plotted 
                var latlng = new google.maps.LatLng(51.36, 0.5);
                var myOptions = {
                    center: latlng,
                    zoom: 2
                };
                if (statusDiv.length > 0) {
                    errorDiv.text(msg2);
                    statusDiv.hide();
                }
                ;
            }
            map.setOptions(myOptions);
        }
    }; // Store the max and min longs and lats to enable map to be centred and zoom to be figured out

    this.StoreAddress = function (location) {
        var mapdiv = jQuery('#map_canvas');
        var longDiv = jQuery('#longDiv');
        if (longDiv.length == 0) {
            longDiv = jQuery('<div/>', {
                id: 'longDiv',
                MinValue: '180.000',
                MaxValue: '-180.000'
            }).appendTo('#map_canvas');

        }

        latDiv = jQuery('#latDiv');
        if (latDiv.length == 0) {
            latDiv = jQuery('<div/>', {
                id: 'latDiv',
                MinValue: '180.000',
                MaxValue: '-180.000'
            }).appendTo('#map_canvas');
        }

        // track min and max lat & long
        var locn = new Array();
        var locstr = location.toString();
        locstr = locstr.replace('(', '');
        locstr = locstr.replace(')', '');
        locstr = locstr.replace(' ', '');
        locn = locstr.split(',');

        var latMinValue = parseFloat(latDiv.attr('MinValue'));
        var latMaxValue = parseFloat(latDiv.attr('MaxValue'));


        if (parseFloat(locn[0]) < latMinValue) {
            latDiv.attr({ MinValue: locn[0] });
        }

        if (parseFloat(locn[0]) > latMaxValue) {
            latDiv.attr({ MaxValue: locn[0] });
        }

        var longMinValue = parseFloat(longDiv.attr('MinValue'));
        var longMaxValue = parseFloat(longDiv.attr('MaxValue'));

        if (parseFloat(locn[1]) < longMinValue) {
            longDiv.attr({ MinValue: locn[1] });
        }

        if (parseFloat(locn[1]) > longMaxValue) {
            longDiv.attr({ MaxValue: locn[1] });
        }

    }; // Builds up a list of addresses we are unable to plot - i.e.  Google couldn't
    // figure out the long / lat for an address

    this.ReportBadAddress = function (details) {
        if (details.substring(0, 12) == 'ZERO_RESULTS') {
            details = details.substring(13);
            // Create new Div to hold details of bad addresses 
            var mapdiv = jQuery('#map_canvas');
            var statusDiv = jQuery('#statusDiv');
            if (statusDiv.length == 0) {

                // standard panel class for div containing Panel Title
                statusDiv = jQuery('<div/>', {
                    id: 'statusDiv'
                }).appendTo('#map_canvas');
                statusDiv.insertAfter(mapdiv);
                statusHdrDiv = jQuery('<div id=statusHdrDiv></div>');
                statusHdrDiv.appendTo('#statusDiv');
            }
            statusHdrDiv = jQuery('#statusHdrDiv');
            jQuery('<div>' + details + '<div/>').appendTo('#statusHdrDiv');
        }
    };
}