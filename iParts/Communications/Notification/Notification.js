
function Asi_Web_iParts_Communications_Notification(imisId, alertContainer, alertSets, noAlertsHiddenField, websiteBaseUrl, websiteKey, urlParameters) {
    jQuery(window).on("load", function () {
        var userdata = {};
        alertContainer = jQuery('#' + alertContainer);
        var mainContainer = alertContainer.parent().parent().parent();
        userdata.userid = imisId;
        userdata.alertsets = alertSets;
        userdata.websitebaseurl = websiteBaseUrl;
        userdata.websitekey = websiteKey;
        userdata.urlparameters = urlParameters;
        jQuery.ajax({
            type: "POST",
            url: gWebRoot + "/iparts/Communications/Notification/NotificationWebService.asmx/GetNotifications",
            data: JSON.stringify(userdata),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var hiddenMessage = jQuery('#' + noAlertsHiddenField).val();
                if (data.d.length > 0) {
                    var hasAlerts = false;
                    for (i = 0; i < data.d.length; i++) {
                        if (data.d[i] != "") {
                            hasAlerts = true;
                            break;
                        }
                    }
                    if (hasAlerts == true) {
                        mainContainer.show();
                        alertContainer.hide().html(data.d).fadeIn('slow');
                    } else {

                        if (hiddenMessage != "") {
                            mainContainer.show();
                            alertContainer.hide().html(hiddenMessage).fadeIn('fast');
                        }
                    }
                }
                else {
                    if (hiddenMessage != "") {
                        mainContainer.show();
                        alertContainer.hide().html(hiddenMessage).fadeIn('fast');
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alertContainer.text("Alert error" + " | " + XMLHttpRequest + " | " + textStatus + " | " + errorThrown);
            }
        });
    });
}