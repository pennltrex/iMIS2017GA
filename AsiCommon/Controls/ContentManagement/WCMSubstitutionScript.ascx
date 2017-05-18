<%@ Control Language="C#" AutoEventWireup="true" %>

<script type="text/javascript">
    //<![CDATA[

    var gCartCount;
    var cartDiv = $get("CartItemCount");
    if (cartDiv != null){
        jQuery.ajax({
            type: "POST",
            url: gWebRoot + "/WebMethodUtilities.aspx/GetCartItemCount",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function(result) {
                if (result.d != '' && result.d != null) {
                    gCartCount = result.d;
                    if (gCartCount != null) {
                        cartDiv.innerHTML = gCartCount;
                    }
                }
            },
            async: true
        });
    }

    function CheckForChildren() {
        var contentRecordPageButtonPanelHasChildren = false;
        var contentRecordPageButtonPanel = jQuery('div.ContentRecordPageButtonPanel');
        for (var i = 0, max = contentRecordPageButtonPanel.length; i < max; i++) {
            if (contentRecordPageButtonPanel[i].children.length > 0) {
                contentRecordPageButtonPanelHasChildren = true;
                break;
            }
        }
        if (!contentRecordPageButtonPanelHasChildren) {
            jQuery("Body").addClass("TemplateAreaEasyEditOn");
        }
    }
    if (gIsEasyEditEnabled)
        CheckForChildren();  
    //]]>
</script>
