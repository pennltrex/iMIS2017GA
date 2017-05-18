// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.SimpleSearchField
// ###########################################################

function SimpleSearchFieldProperties()
{
    this.WatermarkClass = 'Watermarked';
    this.WatermarkText = 'Search';
    this.SearchTarget = null;
}

function SimpleSearchField_OnFocus(id, simpleSearchFieldProperties)
{
    var inputField = document.getElementById(id);
    if (inputField == null) return;

    if (hasClass(inputField, simpleSearchFieldProperties.WatermarkClass))
    {
        removeClass(inputField, simpleSearchFieldProperties.WatermarkClass);
        inputField.value = '';

        // RD 11/26/12: Hack for IE to get carrot to show up in the search box after pressing tabbing to the search box
        // IE 9 Solution
        if (inputField.setSelectionRange) {
            inputField.setSelectionRange(0, 0);
        } 
        // IE 8 Solution
        else if(inputField.createTextRange) {
            var fieldRange = inputField.createTextRange();
            fieldRange.moveStart('character', 0);
            fieldRange.collapse();
            fieldRange.select();  
        }
    }
}
function SimpleSearchField_OnBlur(id, simpleSearchFieldProperties)
{
    var inputField = document.getElementById(id);
    if (inputField == null) return;

    if (inputField.value == '' && !hasClass(inputField, simpleSearchFieldProperties.WatermarkClass))
    {
        addClass(inputField, simpleSearchFieldProperties.WatermarkClass);
        inputField.value = simpleSearchFieldProperties.WatermarkText;
    }
}
function SimpleSearchField_ExecuteSearch(id, simpleSearchFieldProperties)
{
    var inputField = document.getElementById(id);
    if (inputField == null) return;
    if (hasClass(inputField, simpleSearchFieldProperties.WatermarkClass)) return;

    var searchTarget = simpleSearchFieldProperties.SearchTarget;
    if (searchTarget.indexOf('?') > 0)
        searchTarget += '&';
    else
        searchTarget += '?';
    searchTarget += 'SearchTerms=' + encodeURIComponent(inputField.value)

    location.href = searchTarget;
}