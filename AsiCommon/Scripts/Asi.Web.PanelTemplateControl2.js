// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.PanelTemplateControl2
// ###########################################################

Sys.Application.add_load(PanelTemplateControl2_AttachEvents);

function PanelTemplateControl2_AttachEvents() {
    PanelTemplateControl2_AttachExpandEvent();
    PanelTemplateControl2_AttachCollapseEvent();
}

function PanelTemplateControl2_AttachExpandEvent() {
    // adapted from bs.collapse - run when a panel is expanded
    jQuery('.panel-collapse').on('shown.bs.collapse', function (e) {
        var parent = e.currentTarget.parentElement;
        if (typeof parent == 'undefined' || parent === null)
            return;
        var expandedText = e.currentTarget.getAttribute('data-expandedText');
        if (typeof expandedText != 'undefined' && expandedText !== null)
            jQuery('.panel-heading-collapse-text', jQuery(parent)).text(expandedText);
        var expandedImage = e.currentTarget.getAttribute('data-expandedImage');
        if (typeof expandedImage != 'undefined' && expandedImage !== null)
            jQuery('.panel-heading-collapse-img', jQuery(parent)).attr("src", expandedImage);
    });
}

function PanelTemplateControl2_AttachCollapseEvent() {
    // adapted from bs.collapse - run when a panel is collapsed
    jQuery('.panel-collapse').on('hidden.bs.collapse', function (e) {
        var parent = e.currentTarget.parentElement;
        if (typeof parent == 'undefined' || parent === null)
            return;
        var collapsedText = e.currentTarget.getAttribute('data-collapsedText');
        if (typeof collapsedText != 'undefined' && collapsedText !== null)
            jQuery('.panel-heading-collapse-text', jQuery(parent)).text(collapsedText);
        var collapsedImage = e.currentTarget.getAttribute('data-collapsedImage');
        if (typeof collapsedImage != 'undefined' && collapsedImage !== null)
            jQuery('.panel-heading-collapse-img', jQuery(parent)).attr("src", collapsedImage);
    });
}
