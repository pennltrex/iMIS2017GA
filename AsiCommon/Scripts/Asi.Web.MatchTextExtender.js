// (c) Copyright Advanced Solutions International.
// All rights reserved.

if (typeof (Type) !== 'undefined')
{
    Type.registerNamespace('AsiWebControls');
}
AsiWebControls.MatchTextBehavior = function (targetControlID, sourceControlID, enabled, validCharsRegularExpression)
{
    this._targetControlID = targetControlID;
    this._sourceControlClientID = sourceControlID;
    this._enabled = enabled;
    this._validCharsRegularExpression = validCharsRegularExpression;
    this._sourceControl = null;
    this._targetControl = null;
}
AsiWebControls.MatchTextBehavior.prototype = {
    initialize: function ()
    {
        if (this._enabled)
        {
            var sourceElement = $get(this._sourceControlClientID);
            this._sourceControl = sourceElement;
            var mtb = this;
            $addHandler(sourceElement, "keyup", function () { mtb._onkeyup(); });
        }
    },

    _onkeyup: function ()
    {
        /// <summary>
        /// KeyUp handler used to copy text from one control to another
        /// </summary>
        if (this._targetControl == null)
            this._targetControl = $get(this._targetControlID);

        if (this._sourceControl)
        {
            var text = this._sourceControl.value;

            if (this._validCharsRegularExpression && this._validCharsRegularExpression.length > 0)
                text = eval("text.replace(/" + this._validCharsRegularExpression + "/g, '_')");

            this._targetControl.value = text;
        }
    }
}
if (typeof (Type) !== 'undefined')
{
    AsiWebControls.MatchTextBehavior.registerClass('AsiWebControls.MatchTextBehavior');
}

