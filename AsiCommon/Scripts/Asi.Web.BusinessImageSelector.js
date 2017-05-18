function BusinessImageSelectorProperties()
{
    this.ValueControlID = null;
    this.DialogID = null;
}

function ImageSelectorControl_Select(businessImageSelectorProperties) {
    $find(businessImageSelectorProperties.DialogID).open('ImageManager', { CssClasses: [] },
        function(sender, args) { ImageSelectorControl_SelectCallBack(sender, args, businessImageSelectorProperties) });
    
}

function ImageSelectorControl_SelectCallBack(sender, args, businessImageSelectorProperties) {
    if (!args) {
        return false;
    }

    var path = args.value[0].getAttribute("src", 2).toLowerCase();
    if (path.toLowerCase().indexOf("http" == -1)) {
        path = path.replace(gWebRoot, '~');
    }
    var inputField = $get(businessImageSelectorProperties.ValueControlID);
    if (inputField)
        inputField.value = path;
    return false;
}