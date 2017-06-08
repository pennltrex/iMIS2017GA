
jQuery(document)
    .ready(function () {
        "use strict";
        //don't run anything in iframes
        if (window.self !== window.top)
            return;

        /* Check if we've already at the sites login page. We do this by checking for redirect fragments in the URL because
         * iMIS doesn't otherwise have client side signals that you're on a login page. This may cause a single
         * page reload the first time you hit the login page but it's mostly a failsafe to prevent loops.
         */
        var isLoginPageForSure = (function () {
            var loginPageparams = ["LoginRedirect", "IsJsTimeout", "returnurl"];
            var lowerPageLoc = window.location.pathname.toLowerCase();
            var found = false;
            loginPageparams.forEach(function (item) {
                if (lowerPageLoc.indexOf(item) !== -1) {
                    found = true;
                    return;
                }
            });
            return found;
        }());
        if (isLoginPageForSure)
            return;
        //used to hold a block of server side user info
        var CLIENT_INFO;
        if (document.getElementById("__ClientContext")) {
            CLIENT_INFO = jQuery.parseJSON(document.getElementById("__ClientContext").value);
        }


        //used to hold the timer numbers
        var TIMEOUT_TIMER, TWOMINS_TIMER;
        //set to true once we know the server endpoint for checking session is working
        var GOT_VALID_COOKIEINFO_ONCE = false;
        //stores the session timeout soon message
        if (document.getElementById("timeoutsoonmsg"))
            var TIMEOUT_MSG = atob(document.getElementById("timeoutsoonmsg").value);
        //default two minute warning
        var WARNING_TIME_SECS = 120;
        //If session length is less than 5 minutes, make timeout warning appear when 20% of time remaining instead of 2 minutes.
        function updateWarningTime(timeoutValue)
        {
            if (timeoutValue < 5) {
                WARNING_TIME_SECS = (timeoutValue * 60) * 0.2;
            }
        }


        //This is the actual modal popup - needs it's own HTML file but for now add to page through JS
        jQuery("<div class=\"modal fade\" style=\"z-index:2147483647\" id=\"timeoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"signOutMesssageText\"><div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-body\"><div id=\"signOutMesssageText\">" + TIMEOUT_MSG.replace("[SecondsRemaining]", "") + "</div><div class=\"modal-footer\"> <button id=\"btnTimeoutModalSignOut\" type=\"button\" class=\"btn btn-default\" >Sign Out</button><button id=\"btnTimeoutModalStaySignedIn\" type=\"button\" class=\"btn btn-primary\" >Stay Signed In</button></div></div></div></div>").appendTo(jQuery("body"));
        //Reference to the modal so that we can show and hide it.
        //add event listeners to hidden modal
        jQuery("#btnTimeoutModalSignOut").on("click", { isTimeout: false }, logOut);
        jQuery("#btnTimeoutModalStaySignedIn").on("click", staySignedIn);

        //singleton global obj
        var MODAL = {
            //on screen seconds counter
            countdownTimer: null,
            IsOpen: false,
            Open: function (timeleft) {
                if (this.IsOpen) return;
                //Show the modal
                if (jQuery("#timeoutModal") !== undefined) {
                    this.IsOpen = true;
                    jQuery("#timeoutModal").modal({ keyboard: false, backdrop: "static", show: true });
                    //Create the interval for the countdown timer.
                    this.countdownTimer = window.setInterval(function () {
                            if (timeleft === 0)
                                window.clearInterval(MODAL.countdownTimer);
                            var timeRemaining = Math.floor(timeleft);
                            var msgDiv = document.getElementById("signOutMesssageText");
                            var text = TIMEOUT_MSG.replace("[SecondsRemaining]", timeRemaining);
                            msgDiv.innerHTML = text;
                            timeleft--;
                        },
                        1000);
                }
            },
            Close: function () {
                if (!this.IsOpen) return;
                this.IsOpen = false;
                if (jQuery("#timeoutModal") !== undefined) {
                    jQuery("#timeoutModal").modal("hide");
                }
                window.clearInterval(this.countdownTimer);
            }
        }

        //initialize timers the first time
        //======= THIS IS THE ENTRY POINT TO TIMEOUT PROCESSING =======//
        timeoutCheck();

        //calculates the next interval to fire the warning timer to show the warning popup at the correct offset from session expiration
        function calcWarningTime(timeLeft) {
            var warningTimeLeft = timeLeft - WARNING_TIME_SECS;
            if (warningTimeLeft < 0) warningTimeLeft = 0;
            return warningTimeLeft;
        }
        //some browsers will blow up if you set a timeout more than int.maxvalue in milliseconds. Catch this to prevent instant timer calls if someone decides to use a really long timeout
        //https://github.com/nodejs/node-v0.x-archive/issues/8656
        function setTimeoutWithOverflowCheck(callback, milliseconds) {
            //int.maxvalue
            if (milliseconds > 0x7FFFFFFF) {
                milliseconds = 0x7FFFFFF0;
            }
            //our logic will still work properly even with truncated timeout so just do that
            window.setTimeout(callback, milliseconds);
        }



        //the main loop that keeps timers synchronized when we get updated session expiration from server
        function timeoutCheck() {
            getSessionData(
                //implemented as a callback because ajax call in getSessionData is async...
                function (data) {
                    //out of time (with 1 second margin)
                    if (data.StillGoodSeconds <= 1) {
                        //do redirect
                        logOut({ isTimeout: true });
                    } else {
                        //update the warning time( This only happens if timeout changes while user is logged in )
                        updateWarningTime(data.ExpireMinutes);

                        //keep main timer updated
                        window.clearTimeout(TIMEOUT_TIMER);

                        TIMEOUT_TIMER = setTimeoutWithOverflowCheck(timeoutCheck, data.StillGoodSeconds * 1000);

                        //time to warn
                        if (data.StillGoodSeconds <= WARNING_TIME_SECS) {
                            //put up warning message
                            MODAL.Open(data.StillGoodSeconds);
                        } else {
                            MODAL.Close();
                        }
                        // Restart/update the modal warning timer if it is currently closed
                        if (!MODAL.IsOpen) {
                            window.clearTimeout(TWOMINS_TIMER);
                            TWOMINS_TIMER = setTimeoutWithOverflowCheck(timeoutCheck, calcWarningTime(data.StillGoodSeconds) * 1000);
                        }
                    }
                });
        }

        //this function grabs auth cookie data, then runs the session callback passed in if cookie data was retrieved and is valid for timeouts
        function getSessionData(sessionCallback) {
            jQuery.ajax({
                    type: "POST",
                    url: CLIENT_INFO.baseUrl + "/SessionInfo/GetSessionInfoFromCookie",
                    headers: { "X-NoRefreshSession": "true" } //don't cause session to refresh cookie
                })
                .done(function (data, textStatus, jqXHR) {

                    //do nothing if cookie is for desktop
                    if (data && data.IsDesktop)
                        return;
                    //see if we got back the object we expected
                    if (data === null || (data === void 0) || !data.hasOwnProperty("StillGoodSeconds")) {
                        /*  If we've got something valid before and not now, user has lost their login cookie somewhere. Send them to login page.
                         *  If we're getting invalid info back and we never had valid info, we're at login page or something unexpected is happening, so don't do anything.
                         */
                        if (GOT_VALID_COOKIEINFO_ONCE) {
                            //normal processing but force time left to zero to cause logout
                            data = { StillGoodSeconds: 0 };
                        } else {
                            //at login page or getting invalid info from endpoint...do nothing.
                            return;
                        }
                    }
                    //if we get here make sure to note that we got a valid cookie once
                    GOT_VALID_COOKIEINFO_ONCE = true;
                    sessionCallback(data);
                });
        }


        function logOut(data) {
            //we need to force auth cookie delete from server side because it's httponly
            jQuery.post(CLIENT_INFO.baseUrl + "/SessionInfo/ForceSignout")
                .done(function () {
                    if (document.getElementById("logoutUrl"))
                        var logoutUrl = atob(document.getElementById("logoutUrl").value);
                    //Refresh the page so that Forms Auth can redirect us to the login page,
                    //and be able to put the user back on the page they timed out on.
                    var urlStr = logoutUrl;
                    if (data.isTimeout === true) {
                        //if user was timed out (didn't click sign out button themselves)... add the signout message to the login page by adding a flag to query string before redirect
                        /* Below is some homemade URI parameter handling :-|  */
                        var timeoutParam = jQuery.param({ "IsJsTimeout": true });
                        var qryStrStartIdx = logoutUrl.lastIndexOf("?");
                        if (qryStrStartIdx !== -1) {
                            //need to munge url to place my new param at a usable place in existing query string(make it the first param in query string)
                            urlStr = logoutUrl.slice(0, qryStrStartIdx + 1) +
                                timeoutParam +
                                "&" +
                                logoutUrl.slice(qryStrStartIdx + 1);
                        } else {
                            //there were no parameters so just add one
                            urlStr += "?" + timeoutParam;
                        }
                    }
                    location.href = urlStr;
                    //location.reload(true);
                });
        }
        function staySignedIn() {
            //Hit an endpoint server side to renew the cookie.
            jQuery.ajax({
                url: CLIENT_INFO.baseUrl + "/SessionInfo/StaySingedIn",
                type: "POST",
                headers: { "X-NoRefreshSession": "true" } //don't cause session to refresh cookie(do this to bypass sliding window)
                })
                .done(function() {
                    //refresh timers and stuff
                    timeoutCheck();
                });
        }
    });