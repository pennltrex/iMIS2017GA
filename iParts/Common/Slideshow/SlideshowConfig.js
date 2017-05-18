function Asi_Web_iParts_SlideShow(openerDialogId, sliderImageControlId) {

    var internalOpenerDialogId = openerDialogId;
    var internalSliderImageControlId = sliderImageControlId;

    this.LaunchImageManager = function () {
        $find(internalOpenerDialogId).open('ImageManager', { CssClasses: [] }); return false;
    }

    this.ImageManagerFunction = function (sender, args) {
        //If no file selected
        if (!args) {
            return false;
        }

        var webRoot = gWebRoot;
        var selectedItem = args.get_value();
        var txt = jQuery('#' + internalSliderImageControlId);
        //Image manager gets handled differently for IE
        if ($telerik.isIE) {         
            var path = selectedItem[0].outerHTML.match(/(\/.*?\.\w{3})/img).toString().toLowerCase();
            if (path.indexOf("http") == -1) {
                txt.val(path.replace(webRoot, '~'));
            } else {
                txt.val(path);
            }
        } else {
            var path = args.value[0].getAttribute("src", 2).toLowerCase();
            if (path.toLowerCase().indexOf("http") == -1) {
                txt.val(path.replace(webRoot, '~'));
            } else {
                txt.val(path);
            }
        }
        return true;
    }

}