function createDonutCharts() {
    jQuery("<style type='text/css' id='dynamic' />").appendTo("head");
    jQuery("div[data-chart-type*=donut]").each(function () {
        var d = jQuery(this);
        var id = jQuery(this).attr('id');
        var max = jQuery(this).data('chart-max');
        if (jQuery(this).data('chart-text') !== null) {
            var text = jQuery(this).data('chart-text');
        } else {
            var text = "";
        }
        if (jQuery(this).data('chart-caption')) {
            var caption = jQuery(this).data('chart-caption');
        } else {
            var caption = "";
        }
        if (jQuery(this).data('chart-initial-rotate')) {
            var rotate = jQuery(this).data('chart-initial-rotate');
        } else {
            var rotate = 0;
        }
        var segments = jQuery(this).data('chart-segments');

        if (d.children().length > 0) {
            return;
        }

        for (var i = 0; i < Object.keys(segments).length; i++) {
            var s = segments[i];
            var start = ((s[0] / max) * 360) + rotate;
            var deg = ((s[1] / max) * 360);
            if (s[1] >= (max / 2)) {
                d.append('<div class="large donut-bite" data-segment-index="' + i + '"> ');
            } else {
                d.append('<div class="donut-bite" data-segment-index="' + i + '"> ');
            }
            var style = jQuery("#dynamic").text() + "#" + id + " .donut-bite[data-segment-index=\"" + i + "\"]{-moz-transform:rotate(" + start + "deg);-ms-transform:rotate(" + start + "deg);-webkit-transform:rotate(" + start + "deg);-o-transform:rotate(" + start + "deg);transform:rotate(" + start + "deg);}#" + id + " .donut-bite[data-segment-index=\"" + i + "\"]:BEFORE{-moz-transform:rotate(" + deg + "deg);-ms-transform:rotate(" + deg + "deg);-webkit-transform:rotate(" + deg + "deg);-o-transform:rotate(" + deg + "deg);transform:rotate(" + deg + "deg); background-color: " + s[2] + ";}#" + id + " .donut-bite[data-segment-index=\"" + i + "\"]:BEFORE{ background-color: " + s[2] + ";}#" + id + " .donut-bite[data-segment-index=\"" + i + "\"].large:AFTER{ background-color: " + s[2] + ";}";
            jQuery("#dynamic").text(style);
        }

        d.children().first().before("<div class='donut-wrapper'><div class='donut-hole'><span class='donut-filling'>" + text + "</span></div></div>");
        d.append("<div class='donut-caption-wrapper'><span class='donut-caption'>" + caption + "</span></div>");
    });
}

function pageLoad() {
    createDonutCharts();
}