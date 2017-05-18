/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactProfilePictureDisplay(containerClientId) {

	//-----------  Constructor -----------

	/*
	Everything within the iPart is contained within a div with an ID of: containerClientID
	Therefore we only need to pass in the iPart ClientID and for all other (child) controls use a jQuery like so: container.find()	
	*/
	var container = jQuery('#' + containerClientId);
	var authWin;
	var timer;

	this.showLogin = function (url, name, args) {
		var isInternetExplorer = (navigator.userAgent.indexOf("MSIE") != -1) || (navigator.appName == 'Netscape') && (navigator.userAgent.indexOf("Trident") != -1) ? true : false;
		authWin = window.open(url, name, args);
		
		if (authWin == null) {
			if (isInternetExplorer) {
				for (var i = 1; i < window.frames.length; i++) {
					window.frames[i].close();
				}				
				alert('Login to Facebook will fail. Make sure pop-ups are allowed and Protected Mode is unchecked in your internet security settings.');
			}
			else
				alert('Please disable pop-up blocker to login into Facebook.');
		}
		else {
			authWin.focus();
		}
		
		this.awaitAccessToken(authWin);
	}

	this.awaitAccessToken = function (popup) {
		if (isLoaded(popup) == false) {
			var t = this;
			timer = setTimeout(
				function() { t.awaitAccessToken(popup); },
				1000);
			return;
		}

		if (popup.location.href.match(/[#&]error=([^&]*)/i)) {
			popup.close();
			return;
		}

		var accessToken = parseAccessToken(popup.location.href);

		if (accessToken) {
			popup.close();
			var path = "https://graph.facebook.com/me?";
			var queryParams = ['access_token=' + accessToken, 'callback=setUser'];
			var query = queryParams.join('&');
			var url = path + query;

			//use jsonp to call the graph
			var script = document.createElement('script');
			script.src = url;
			document.body.appendChild(script);
			container.find('input[id$=AccessTokenHiddenField]').val(accessToken);			
		} else {
			//alert('Error requesting code...');
		}
	}

	function isLoaded(win) {
		try {
			return ('about:blank' !== win.location.href)
				&& (null !== win.document.body.innerHTML);
		} catch (err) {
			return false;
		}
	}

	function parseAccessToken(uri) {
		var match = uri.match(/[#&]access_token=([^&]*)/i);
		return match[1] || null;
	}
}