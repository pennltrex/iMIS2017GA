(function () {
    var initialTimeout, twoMinuteWarning, countdown, timeout, message, stayLoggedInUrl, logoutUrl;
    var cookieRegistry = [];
    var cookieWatchInterval;
    var cookie = readCookie("Login");
    if (document.getElementById("timeoutValue"))
        timeout = document.getElementById("timeoutValue").value;
    if (document.getElementById("timeoutsoonmsg"))
        message = document.getElementById("timeoutsoonmsg").value;
    if (document.getElementById("stayLoggedInURL"))
        stayLoggedInUrl = document.getElementById("stayLoggedInURL").value;
    if (document.getElementById("logoutUrl"))
        logoutUrl = document.getElementById("logoutUrl").value;
    var modal;
    //Fires as soon as the JS is loaded IIFE
    //Make sure we have a timeout
    if (cookie && timeout > 0 && window.self === window.top) {
        //setup the listener for cookie changes on the Login cookie
        //value doesn't matter, just whether it changed or not.
        listenCookieChange("Login", onCookieChange);
        //start the timeout for the very first time.
        startInitialTimeout();
    }
    function onCookieChange() {
        //If the cookie changed, we need to reset the timer for the modal popup
        window.clearTimeout(initialTimeout);
        //If the modal popup is visible, then we also need to clear the timeout that automatically logs you out.
        window.clearTimeout(twoMinuteWarning);
        //Also clear the interval that represents the countdown in the modal popup.
        window.clearInterval(countdown);
        //Start the timer to show the modal popup over since we cleared it already.
        startInitialTimeout();
        //The modal shouldn't be shown anymore.
        //This is here because the user could click the stay signed in button
        //which would simply give them a new cookie.
        if (modal != undefined)
            modal.modal("hide");
    }
    function startInitialTimeout() {
        //If we're not logged in, then we won't have cookie, and we don't need to timeout.
        //We also only want to show the notification when 
        if (cookie && timeout > 0 && window.self === window.top) {
            //Create the timeout for showing the modal popup
            initialTimeout =
                setTimeout(function () {
                    //This is the actual modal popup - needs it's own HTML file
                    jQuery("<div class=\"modal fade\" id=\"timeoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\"><div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-body\">" + message + "<div class=\"modal-footer\"> <button id=\"btnTimeoutModalSignOut\" type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Sign Out</button><button id=\"btnTimeoutModalStaySignedIn\" type=\"button\" class=\"btn btn-primary\">Stay Signed In</button></div></div></div></div>").appendTo(jQuery("body"));
                    //Reference to the modal so that we can show and hide it.
                    modal = jQuery("#timeoutModal");
                    //Show the modal
                    if (modal != undefined)
                        modal.modal({ keyboard: false, backdrop: 'static', show: true });
                    //button for logging out
                    jQuery("#btnTimeoutModalSignOut").on("click", logOut);
                    //button for triggering ajax call to renew the cookie
                    jQuery("#btnTimeoutModalStaySignedIn").on("click", staySignedIn);
                    //Create the timeout for while the modal is open.
                    twoMinuteWarning =
                        setTimeout(logOut, calculateTimeout(false));
                    var i = 0;
                    //Create the interval for the countdown timer.
                    countdown = setInterval(function () {
                        var timeRemaining = Math.round((calculateTimeout(false) / 1000) - i);
                        document
                            .getElementById("btnTimeoutModalSignOut")
                            .innerText = "Sign Out (" + timeRemaining + ")";
                        i++;
                    },
                        1000);
                }, calculateTimeout(true));
            //(timeout - 2) * 60000);
            //timeout is represented in minutes, so to show the modal 2 minutes before timeout, we subtract 2.
            //Since timeouts are declared in milliseconds, we need to then conver the remaining time to milliseconds
            //converting the time to seconds, we multiply by 60, converting the seconds to milliseconds, we multiply by 1000
            //60 * 1000 = 60,000
        }
    }
    //calculate the timeout value
    //if it's for the initial timout, pass true, if it's for the secondary, pass false
    function calculateTimeout(initial) {
        //convert everything to milliseconds
        var timeoutMilliseconds = timeout * 60000;
        var temp = 0;
        //if this is the initial timeout
        if (initial) {
            //Time to show modal is the total timeout, minus the time the modal is present.
            temp = timeoutMilliseconds - calculateTimeout(false);
        } else {
            //We need to make sure the modal only pops up when we're in the renewal period on the ticket (second half the timeout)
            //if the renewal window is less than 2 minutes, we need to have a smaller modal period.
            if (timeout / 2 > 2) {
                temp = 2;
            } else {
                //the small period is 40% of the timeout.
                temp = (timeout * 0.2);
            }
            temp = temp * 60000;
        }
        return Math.round(temp);
    }

    function logOut() {
        //Delete the cookie to ensure we're logged out.
        eraseCookie("Login");
        //Refresh the page so that Forms Auth can redirect us to the login page,
        //and be able to put the user back on the page they timed out on.
        location.href = logoutUrl;
        //location.reload(true);
    }
    function staySignedIn() {
        //Hit an endpoint server side to renew the cookie.
        //We don't need a handler, as we're already watching for cookie changes.
        location.reload(false);
    }
    function readCookie(name) {
        var nameEq = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEq) == 0) return c.substring(nameEq.length, c.length);
        }
        return null;
    }
    function eraseCookie(name) {
        createCookie(name, "", -1);
    }
    function createCookie(name, value, days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            var expires = "; expires=" + date.toGMTString();
        }
        else var expires = "";
        document.cookie = name + "=" + value + expires + "; path=/";
    }
    function listenCookieChange(cookieName, callback) {
        setInterval(function () {
            if (cookieRegistry[cookieName]) {
                if (readCookie(cookieName) != cookieRegistry[cookieName]) {
                    // update registry so we dont get triggered again
                    cookieRegistry[cookieName] = readCookie(cookieName);
                    return callback();
                }
            } else {
                cookieRegistry[cookieName] = readCookie(cookieName);
            }
        }, 100);
    }
})();