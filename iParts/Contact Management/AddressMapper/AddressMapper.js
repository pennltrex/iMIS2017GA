function AddressMapper(address, clientId, zoomLevel, key, language, mapClientId, errorTextClientId, staticMapLinkClientId, errorMessage1, errorMessage2, errorMessage3, errorMessage4) {
    this.OnLoad = function () {
        geocoder = new google.maps.Geocoder();
        var mapDiv = document.getElementById(mapClientId);
        if (mapDiv != null)
        {
            mapDiv.style.visibility = "hidden";
 
            //A random location in NSW.
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var myOptions = {
                zoom: 12,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                zoomControl: "true"
            };

            
            var map = new google.maps.Map(mapDiv, myOptions);
            
            
            //Add a listener to make the map div visible once it's finished loading the map tiles, 
            //Can't use display:none because it doesn't appear to display the map correctly.
            google.maps.event.addListenerOnce(map, 'idle', function() {


                mapDiv.style.visibility = "visible";
                
                var collapsedImage = jQuery("[id$=_CollapseImage]");
                if (collapsedImage != null) {
                    collapsedImage.on('click', function() {
                        google.maps.event.trigger(map, "resize");
                   
                });
            }


            });
            this.codeAddress(zoomLevel, map);
          
        }
    };

    //Use the geocoder to look up the address.
    this.codeAddress = function(zoom, map) {
        geocoder.geocode({ 'address': address }, function(results, status) {
            var errorMsg = jQuery('#' + errorTextClientId);
            if (status == google.maps.GeocoderStatus.OK) {

                map.setCenter(results[0].geometry.location);
                
                var maxZoomService = new google.maps.MaxZoomService();
                maxZoomService.getMaxZoomAtLatLng(results[0].geometry.location, function(response) {

                    if (response.status == google.maps.MaxZoomStatus.OK) {
                        if (zoom > response.zoom)
                            zoom = response.zoom;
                    }
                });

                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                map.setZoom(zoom);
                setEmbeddedMapLink(address, results[0].geometry.location.lat(), results[0].geometry.location.lng(), zoom, language);
                errorMsg.hide();
            } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                errorMsg.text("Error finding the address.");
                if (errorMessage1)
                    errorMsg.text(errorMessage1);
                errorMsg.show();
            } else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
                errorMsg.text("Error, too many mapping queries from this site.");
                if (errorMessage2)
                    errorMsg.text(errorMessage2);
                errorMsg.show();
            } else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
                errorMsg.text("Error, google maps denied this query.");
                if (errorMessage3)
                    errorMsg.text(errorMessage3);
                errorMsg.show();
            } else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
                errorMsg.text("Error, invalid google maps request.");
                if (errorMessage4)
                    errorMsg.text(errorMessage4);
                errorMsg.show();
            }
        });
    };

    //I don't think that we need this but I wrote it before I found out what static maps was
    //It makes a static image based on a co-ordinate or address, you never know it could be useful for emailing or printing etc.
    function setStaticMapLink(addr, lat, lng, zoom, mapKey, lang) {
        var queryString ;
        var markerQueryString = "&markers=label:A";
        if (lng != undefined && !isNaN(lng) && lat != undefined && !isNaN(lat)) {//Preference lat and lng because we've already gone to the trouble of getting them
            queryString = "center=" + lat + "," + lng;
            markerQueryString = markerQueryString + encodeURIComponent("|") + lat + "," + lng;
        }
        else {
            if (addr != undefined && addr != "") {
                queryString = "center=" + encodeURIComponent(addr);
                markerQueryString = markerQueryString + encodeURIComponent("|") + encodeURIComponent(addr);
            }
            else//Not really enough information
                return;
        }
        queryString = queryString + "&size=800x800";
        if (zoom != undefined && !isNaN(zoom)) {
            queryString = queryString + "&zoom=" + encodeURIComponent(zoom);
        }
        if (mapKey != undefined && mapKey != "") {
            queryString = queryString + "&key=" + encodeURIComponent(mapKey);

        }
        if (lang != undefined && lang != "") {
            queryString = queryString + "&language=" + encodeURIComponent(lang);
        }
        queryString = queryString + "&sensor=false";
    
        var staticMapLink = jQuery('#' + staticMapLinkClientId);
        staticMapLink.attr("href", "http://maps.googleapis.com/maps/api/staticmap?" + queryString + markerQueryString);
        staticMapLink.show();
    }

    function setEmbeddedMapLink(addr, lat, lng, zoom, lang) {
        var queryString ;
        queryString = "f=q";
        if (lang != undefined && lang != "") {
            queryString = queryString + "&hl=" + encodeURIComponent(lang);
        } else {
            queryString = queryString + "&hl=en";
        }
        if (lng != undefined && !isNaN(lng) && lat != undefined && !isNaN(lat)) {//Preference lat and lng because we've already gone to the trouble of getting them

            queryString = queryString + "&geocode=&time=&date=&ttype=&q=" + encodeURIComponent(addr) + "&ll=" + lat + "," + lng;
        }
        else {
            if (addr != undefined && addr != "") {

                queryString = queryString + "&geocode=&time=&date=&ttype=&q=" + encodeURIComponent(addr);
            }
            else//Not really enough information
                return;
        }
        if (zoom != undefined && !isNaN(zoom)) {
            queryString = queryString + "&z=" + encodeURIComponent(zoom);
        }
        queryString = queryString + "&source=embed";
  
        var staticMapLink = jQuery('#' + staticMapLinkClientId);
        staticMapLink.attr("href", "http://maps.google.com/maps?" + queryString);
        staticMapLink.show();
    }
}