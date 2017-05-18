// (c) Copyright Advanced Solutions International.
// All rights reserved.

if (typeof(Type) != 'undefined')
{
    Type.registerNamespace('AsiWebControls');
}
var currentKeepAliveExtender;

AsiWebControls.KeepAliveBehavior = function(element) {
    /// <summary>
    /// The KeepAliveBehavior ensures a user's session never expires.
    /// </summary>
    /// <param name="element" type="Sys.UI.DomElement" domElement="true">
    /// The DOM Element the behavior is associated with
    /// </param>
    AsiWebControls.KeepAliveBehavior.initializeBase(this, [element]);
    
    this._tooltipFormatText = "";
    this._reconnectCount = 0;
    this._maxReconnectAttempts = -1;
    this._keepAlivePageUrl = "";
    this._sessionTimeoutLength = 0;
}
AsiWebControls.KeepAliveBehavior.prototype = {
    initialize: function() {
        /// <summary>
        /// Initialize the behavior
        /// </summary>
        AsiWebControls.KeepAliveBehavior.callBaseMethod(this, 'initialize');

        this.Reconnect();
        currentKeepAliveExtender = this;
    },

    dispose: function() {
        if (this._tooltipFormatText)
            this._tooltipFormatText = null;
        if (this._reconnectCount)
            this._reconnectCount = null;
        if (this._maxReconnectAttempts)
            this._maxReconnectAttempts = null;
        if (this._keepAlivePageUrl)
            this._keepAlivePageUrl = null;
        if (this._sessionTimeoutLength)
            this._sessionTimeoutLength = null;

        AsiWebControls.KeepAliveBehavior.callBaseMethod(this, 'dispose');
    },

    get_TooltipFormatText: function() {
        return this._tooltipFormatText;
    },
    set_TooltipFormatText: function(value) {
        this._tooltipFormatText = value;
    },
    get_ReconnectCount: function() {
        return this._reconnectCount;
    },
    set_ReconnectCount: function(value) {
        this._reconnectCount = value;
    },
    get_MaxReconnectAttempts: function() {
        return this._maxReconnectAttempts;
    },
    set_MaxReconnectAttempts: function(value) {
        this._maxReconnectAttempts = value;
    },
    get_KeepAlivePageUrl: function(value) {
        this._keepAlivePageUrl = value;
    },
    set_KeepAlivePageUrl: function(value) {
        this._keepAlivePageUrl = value;
    },
    get_SessionTimeoutLength: function(value) {
        this._sessionTimeoutLength = value;
    },
    set_SessionTimeoutLength: function(value) {
        this._sessionTimeoutLength = value;
    },
    Reconnect: function() {
        if (this._maxReconnectAttempts < 0 || this._reconnectCount < this._maxReconnectAttempts) {
            var targetElement = this.get_element();

            var reconnectTime = this._sessionTimeoutLength * 0.75;
            targetElement.title = this._tooltipFormatText.replace('{0}', (this._reconnectCount * reconnectTime) / 60000);
            var img = new Image(1, 1);
            var url = this._keepAlivePageUrl;
            if (url.indexOf('?') < 0)
                url += "?"
            else
                url += "&";
            url += "NoCache=" + Math.floor(Math.random() * 1000000);
            img.src = url;

            this._reconnectCount++;
            // do the reconnect at 75% of timeout value.
            window.setTimeout('currentKeepAliveExtender.Reconnect()', reconnectTime);
            //alert("Reconnected to " + this._keepAlivePageUrl + ".");
        }
    }
}

if ((typeof (Type) !== 'undefined') && (typeof (AjaxControlToolkit) !== 'undefined') && Type.isNamespace(AjaxControlToolkit) && (typeof (AjaxControlToolkit.BehaviorBase) !== 'undefined'))
{
    AsiWebControls.KeepAliveBehavior.registerClass('AsiWebControls.KeepAliveBehavior', AjaxControlToolkit.BehaviorBase);
}

