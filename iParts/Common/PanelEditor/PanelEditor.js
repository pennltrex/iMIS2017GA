
function EnableDisableUploadControl(checkboxControl) {
    var inputNumber = jQuery("#" + checkboxControl.id).attr("data-filecheckbox");
    var downloadHref = jQuery("a[data-filedownload='" + inputNumber + "']");
    downloadHref.attr("href", downloadHref.data("href"));
    downloadHref.removeClass("Disabled");
    downloadHref.css("text-decoration", "underline");
    var downloadIcon = jQuery("input[data-filedownload='" + inputNumber + "']");
    downloadIcon.removeAttr("disabled", "disabled");
    var control = jQuery(checkboxControl).parentsUntil(".PanelField");
    jQuery(control).find(".ruFileInput").attr("disabled", checkboxControl.checked);
    jQuery(control).find(".ruBrowse").attr("disabled", checkboxControl.checked);
    jQuery(control).find(".ruFakeInput").attr("disabled", checkboxControl.checked);
    if (checkboxControl.checked) {
        downloadHref.data("href", downloadHref.attr("href")).removeAttr("href");
        downloadHref.addClass("Disabled");
        downloadHref.css("text-decoration", "none");
        downloadIcon.attr("disabled", "disabled");
        jQuery(control).find(".ruRemove").click();
    }
}

function EnableDisableRemoveCheckBoxControl(uploadControl) {
    var inputNumber = jQuery("#" + uploadControl.id).attr("data-fileinput");
    jQuery("input[data-filecheckbox='" + inputNumber + "']").attr("disabled", true);
    jQuery("label[data-filecheckbox='" + inputNumber + "']").attr("disabled", true);
    jQuery("a[data-filedownload='" + inputNumber + "']").unbind("click");
    var downloadHref = jQuery("a[data-filedownload='" + inputNumber + "']");
    downloadHref.data("href", downloadHref.attr("href")).removeAttr("href");
    downloadHref.addClass("Disabled");
    downloadHref.css("text-decoration", "none");
    var downloadIcon = jQuery("input[data-filedownload='" + inputNumber + "']");
    downloadIcon.attr("disabled", "disabled");
}

function ResetFields(source, args) {
    var inputNumber = jQuery("#" + source._element.id).attr("data-fileinput");
    jQuery("input[data-filecheckbox='" + inputNumber + "']").attr("disabled", false);
    jQuery("label[data-filecheckbox='" + inputNumber + "']").attr("disabled", false);
    var downloadHref = jQuery("a[data-filedownload='" + inputNumber + "']");
    downloadHref.attr("href", downloadHref.data("href"));
    downloadHref.removeClass("Disabled");
    downloadHref.css("text-decoration", "underline");
    var downloadIcon = jQuery("input[data-filedownload='" + inputNumber + "']");
    downloadIcon.removeAttr("disabled", "disabled");
}

function validateUpload(source, args) {
    var inputNumber = jQuery(source).attr("data-fileinputvalidator");
    var inputControl = jQuery("div[data-fileinput='" + inputNumber + "']");
    var controlValue = inputControl.find("input[id$=_ClientState]").val();
    if (controlValue == "" || controlValue == null) {
        args.IsValid = false;
        return false;
    }
    return true;
}

function FileUploadValidateType(source, args) {
    jQuery(source._element).find(".ruButton").after("<div class='Important'>Invalid file format or file exceeds maximum size</div>");
}

function toggleCheckboxes(source, cbGroup) {
    var checkboxes = jQuery("input[name*='" + cbGroup + "']");
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}

function clearCheckAll() {
    var checkboxes = jQuery("input[onclick*='toggleCheckboxes']");
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
    }
}

function ValidateCheckBoxList(source, args) {
    var validator = document.getElementById('' + source.id + '');
    var chkListModules = validator.previousSibling;
    var chkListinputs = chkListModules.getElementsByTagName("input");
    for (var i = 0; i < chkListinputs.length; i++) {
        if (chkListinputs[i].checked) {
            args.IsValid = true;
            return;
        }
    }
    args.IsValid = false;
}

function responseEnd() {
    jQuery("div[data-ajax-loading-panel=main]").hide();
}
