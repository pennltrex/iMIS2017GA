function Asi_WebRoot_AsiCommon_ContentDesigner_ContentLinkDialog() {
    //All we're doing here so far is handling control visibility for the link type drop down selection
    var my = this;
    var panelId = "";
    var contentUrlTypeDisplayed = true;
    var downloadFileBrowserControlId = "";
    var contentOrUrlBrowserControlId = "";
    var websiteDropDownBrowserControlId = "";
    var linkTextBrowserControlId = "";
    var defaultWebsiteLabelBrowserControlId = "";
    var linksAreReleventBool = true;
    var originalLink = {};
    var usingLinkTypeDropDown = true;
    var javascriptTextPrefix = 'javascript://[';//href placeholder for button click logic in displayHtml.ascx - any change requires displayHtml change too
    var javascriptTextSuffix = ']';//also used for placeholder href

    this.OnLoad = function (linkTypeDropDownId, editPanelId, downloadFileBrowserId, contentUrlControlId, websiteDropDownId, linkTextId, defaultWebsiteLabel, linksAreRelevant) {
        panelId = editPanelId;
        downloadFileBrowserControlId = downloadFileBrowserId;
        contentOrUrlBrowserControlId = contentUrlControlId;
        websiteDropDownBrowserControlId = websiteDropDownId;
        linkTextBrowserControlId = linkTextId;
        defaultWebsiteLabelBrowserControlId = defaultWebsiteLabel;
        linksAreReleventBool = linksAreRelevant === "True" ? true : false;
        var dropDown = jQuery(linkTypeDropDownId);
        if (dropDown.length === 0) {
            usingLinkTypeDropDown = false;
        } else {
            dropDown.change(function () {
                my.LinkDropDownChangeEvent(linkTypeDropDownId);
            });
        }
        var browserButton = jQuery(downloadFileBrowserControlId + "_BrowseButton");
        //clear err msgs on change
        browserButton.click(function () {
            jQuery(downloadFileBrowserControlId + "Required").text(" ");
        });
        if (!linksAreReleventBool) {
            jQuery(defaultWebsiteLabelBrowserControlId).addClass('Required');
        }
        this.DisplayLinkTypeBasedOnParentArgs(linkTypeDropDownId);
        var instance = this;
        this.GetLinkUrl()
            .on('keyup',
                function (e) {
                    var url = instance.GetLinkUrl().val();
                    var test = url.substring(0, 3);
                    if (test === 'www' || test === 'htt') {
                        jQuery(defaultWebsiteLabelBrowserControlId).removeClass('Required');
                    } else {
                        if (!jQuery(defaultWebsiteLabelBrowserControlId).hasClass('Required'))
                            jQuery(defaultWebsiteLabelBrowserControlId).addClass('Required');
                    }
                });

    };

    this.DisplayLinkTypeBasedOnParentArgs = function (linkDropDownId) {
        originalLink = GetRadWindow().Argument; //Return the arguments supplied from the parent page
        var hrefString = jQuery(originalLink.outerHTML);
        hrefString = hrefString.attr('href');
        if (hrefString != undefined) {
            if (hrefString.indexOf("[@]") >= 0)
                hrefString = "@/" + hrefString.substring(3).replace(".aspx", "") + ".aspx";
            if (hrefString.indexOf("[~]") >= 0)
                hrefString = "~/" + hrefString.substring(3);
            if (hrefString.indexOf("Uploaded files/") >= 0 && usingLinkTypeDropDown) {
                if (hrefString.indexOf("Uploaded files/") > 0)
                    hrefString = this.ExtractPathFromJavascript(hrefString);
                jQuery(linkDropDownId + " option[value='2']").attr('selected', 'selected');
                jQuery(linkDropDownId).change();
            } else {
                this.DisplayForContentURLType();
            }
            var browserLink = this.GetLinkUrl();
            browserLink.val(hrefString);
        } else {
            this.DisplayForContentURLType();
        }

        jQuery(panelId).find("#CSSClass").val(originalLink.className);
        if (originalLink.innerHTML.length > 0) {
            jQuery(panelId).find("#LinkText").val(originalLink.innerHTML);
        }
        var selectedObjBrowser = this.GetLinkUrl();
        jQuery(contentOrUrlBrowserControlId).width(500);
        selectedObjBrowser.width(400);
    };

    this.InsertLink = function () {
        if (!this.ValidateRequiredFields())
            return;
        var linkUrl = this.GetLinkUrl();
        var websiteName;
        originalLink.href = linkUrl.val();
        if (contentUrlTypeDisplayed) {
            websiteName = this.FillInValuesForContentOrUrl();
        }
        else {
            var isValid = this.CreateJavascriptForDownloadDocument(linkUrl);
            if (!isValid) {
                jQuery(downloadFileBrowserControlId + "Required").show();
                return;
            }
        }

        originalLink.className = jQuery(panelId).find("#CSSClass").val();
        originalLink.name = jQuery(panelId).find("#LinkText").val();
        if (contentUrlTypeDisplayed) {
            if ((originalLink.href.toLowerCase().indexOf("http") < 0 &&
                    originalLink.href.toLowerCase().indexOf("www") < 0) &&
                !websiteName) {
                jQuery(panelId).find("[id$='ValidationErrorButton']").click();
                return;
            }
        }

        GetRadWindow().close(originalLink); //Use the close function of the getRadWindow to close the dialog and pass the arguments from the dialog to the callback function on the main page. asi.web.businesshtmleditor.js
    };

    //text contains javascript to do the button click and attribute assign
    this.ExtractPathFromJavascript = function (pathWithinJavascript) {
        var startIndex = javascriptTextPrefix.length;
        var endIndex = pathWithinJavascript.length - javascriptTextSuffix.length;
        var pathWithoutJavascript = pathWithinJavascript.slice(startIndex, endIndex);
        return pathWithoutJavascript;
    };

    //we add the path as an attribute to a js call to a button that is clicked to download doc by user
    this.CreateJavascriptForDownloadDocument = function (linkUrl) {
        var path = linkUrl.val();
        if (path.length < 1) {
            jQuery(downloadFileBrowserControlId + "Required").text("Required");
            return false;
        }

        if (path.indexOf("Uploaded files/") !== 0) {
            jQuery(downloadFileBrowserControlId + "Required").text("Must originate in Uploaded Files folder");
            return false;
        }

        originalLink.href = javascriptTextPrefix + path + javascriptTextSuffix;
        return true;
    };

    this.FillInValuesForContentOrUrl = function () {
        var websiteDropDown = jQuery(panelId).find("select[id$='WebsiteDropDownList']");
        var websiteUrl = websiteDropDown.val();
        if (websiteUrl) {
            originalLink.websiteUrl = websiteUrl;
        }

        var websiteName = websiteDropDown.find(":selected").attr("data-websitename");
        if (websiteName) {
            originalLink.websiteName = websiteName;
        }

        originalLink.sourceCode = '';
        if (contentUrlTypeDisplayed) {
            var sourceCode = jQuery(panelId).find("#SourceCode").val();
            if (sourceCode) {
                originalLink.sourceCode = sourceCode;
            }
        }

        originalLink.qsParam = jQuery(panelId).find("#UrlParametersTextBox").val();

        return websiteName;
    };

    this.GetLinkUrl = function () {
        if (contentUrlTypeDisplayed) {
            return jQuery(contentOrUrlBrowserControlId + "_DocBrowserPath");
        }
        return jQuery(downloadFileBrowserControlId + "_DocBrowserPath");
    };
    //this function simply validates that the control contains a value
    this.ValidateRequiredFields = function () {
        var linkText = jQuery(linkTextBrowserControlId);
        var contentUrl = this.GetLinkUrl();
        var defaultWebsite = jQuery(websiteDropDownBrowserControlId);
        if (linkText.val() == undefined || linkText.val().length <= 0) {
            console.log(linkText);
            (linkText.next()).css('display', 'inline');
            return false;
        }
        if (contentUrl.val().length <= 0) {
            return false;
        }
        if (!linksAreReleventBool && jQuery(defaultWebsiteLabelBrowserControlId).hasClass('Required')) {
            if (defaultWebsite.prop('selectedIndex') <= 0) {
                defaultWebsite.next().css('display', 'inline');
                return false;
            }
        }
        return true;
    }
    //----------Code below here used for display hide/show
    this.LinkDropDownChangeEvent = function (id) {
        var useContentUrl = "1";
        var useDownloadFile = "2";
        var dropDownValue = jQuery(id).val();
        if (dropDownValue === useContentUrl) {
            this.DisplayForContentURLType();
            return;
        }
        if (dropDownValue === useDownloadFile) {
            this.DisplayForDownloadFileType();
            return;
        }
    };

    this.DisplayForContentURLType = function () {
        jQuery(panelId).find("div[id$='DivDownloadType']").hide();
        jQuery(panelId).find("div[id$='DivContentType']").show();
        jQuery(panelId).find("div[id$='DivSourceCode']").show();
        jQuery(panelId).find("div[id$='DivParams']").show();
        jQuery(panelId).find("div[id$='DivWebsiteList']").show();
        contentUrlTypeDisplayed = true;
    };

    this.DisplayForDownloadFileType = function () {
        jQuery(panelId).find("div[id$='DivDownloadType']").show();
        jQuery(panelId).find("div[id$='DivContentType']").hide();
        jQuery(panelId).find("div[id$='DivSourceCode']").hide();
        jQuery(panelId).find("div[id$='DivParams']").hide();
        jQuery(panelId).find("div[id$='DivWebsiteList']").hide();
        contentUrlTypeDisplayed = false;
        jQuery(downloadFileBrowserControlId + "Required").hide();
    };

}