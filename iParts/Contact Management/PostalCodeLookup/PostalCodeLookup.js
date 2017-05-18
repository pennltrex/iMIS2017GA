function PostalCodeLookupClass(clientID) {
	var countryCode = "uk";
	this.ImisWebServerURL;
	this.jsClientId = clientID;
	this.SubmitPostalCode = function (event) {
	    event.stopImmediatePropagation();
	    event.preventDefault();
		var postalCode = document.getElementById(clientID + "_PostalCodeLookup_PostalCode").value;
		var options = document.getElementById(clientID + "_PostalCodeLookup_AddressOptions-Group");
		if (!options.classList.contains("hidden"));
		options.classList.add("hidden");
		var thisInstance = this;
		showHideNoResults(false);
		var theSearchButton = jQuery(event.target);
	    var searchBtnOrigTxt = theSearchButton.text();
	    var searchBtnDisabledTxt = jQuery("#"+clientID+"_SearchInProgressText").text();
	    //Do the AJAX call
	    //disable search while AJAX call running
		theSearchButton.attr("disabled", "disabled");
	    theSearchButton.text(searchBtnDisabledTxt);
		jQuery.ajax(this.ImisWebServerURL + "/api/addressverification?countrycode=" + countryCode + "&postalcode=" + postalCode + "",
		{
			type: "get",
			contentType: "application/json",
			headers: { "RequestVerificationToken": document.getElementById("__RequestVerificationToken").value },
			success: function (data) {
				if (thisInstance.CheckData(data)) {
					thisInstance.PopulateChoices(data);
				} else {
					showHideNoResults(true);
				}
			},
			error: function (err) {
				console.log(err);
				showHideNoResults(true);
			},
            //runs after other handlers on success or fail, like finally
		    complete: function() {
		        theSearchButton.removeAttr("disabled");//re-enable search button
		        theSearchButton.text(searchBtnOrigTxt);
		    }
		});
	}
	this.PopulateChoices = function (response) {
		var values = response.Items.$values;
		var selectBox = document.getElementById(clientID + "_PostalCodeLookup_AddressOptions");
		while (selectBox.hasChildNodes()) {
			selectBox.removeChild(selectBox.lastChild);
		}
		var firstOption = document.createElement("option");
		firstOption.appendChild(document.createTextNode("Select address"));
		selectBox.appendChild(firstOption);
		for (var i = 0; i < values.length; i++) {
			var option = document.createElement("option");
			option.setAttribute("data-addresstokenid", values[i].AddressTokenId);
			option.appendChild(document.createTextNode(values[i].FullAddress));
			selectBox.appendChild(option);
		}
		document.getElementById(clientID + "_PostalCodeLookup_AddressOptions-Group").classList.remove("hidden");
	}
	this.SelectAddressTokenId = function (event, jsCallback) {
		event.stopImmediatePropagation();
		event.preventDefault();
		var list = document.getElementById(clientID + "_PostalCodeLookup_AddressOptions");
		var AddressTokenId = list.options[list.selectedIndex].dataset.addresstokenid;
		var thisInstance = this;
		jQuery.ajax(this.ImisWebServerURL + "/api/addressverification?countrycode=" + countryCode + "&tokenid=" + AddressTokenId + "",
			{
				type: "get",
				contentType: "application/json",
				headers: { "RequestVerificationToken": document.getElementById("__RequestVerificationToken").value },
				success: function (data) {
					console.log(data);
					if (thisInstance.jsClientId != null && thisInstance.jsClientId != undefined && thisInstance.jsClientId.length > 0)
						jsCallback = thisInstance.jsClientId + "_" + jsCallback;
					window[jsCallback](data.Items.$values[0]);
				},
				error: function (err) {
					console.log(err);
				}
			});
	}
	this.CheckData = function (data) {
		if (data.Items.$values.length === 1) {
			if (data.Items.$values[0].AddressTokenId.length <= 0) {
				return false;
			} else {
				return true;
			}
		}
		return true;
	}

	function showHideNoResults(show) {
		var control = document.getElementById(clientID + "_PostalCodeLookup_NoResults");
		if (show) {
			control.classList.remove('hidden');
		} else {
			if (!control.classList.contains('hidden'))
				control.classList.add('hidden');
		}
	}
}

