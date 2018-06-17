class skyui.widgets.activeeffects.ActiveEffectsWidget extends skyui.widgets.WidgetBase
{
    var _effectsHash, _effectsGroups, effectDataArray, _effectBaseSize, _enabled, _groupEffectCount, _orientation, invalidateSize, _rootPath, _hAnchor, _vAnchor, getNextHighestDepth, attachMovie, _intervalId;
    function ActiveEffectsWidget()
    {
        super();
        gfx.events.EventDispatcher.initialize(this);
        _effectsHash = new Object();
        _effectsGroups = new Array();
        effectDataArray = new Array();
    } // End of the function
    function getWidth()
    {
        return (_effectBaseSize);
    } // End of the function
    function getHeight()
    {
        return (_effectBaseSize);
    } // End of the function
    function initNumbers(a_enabled, a_effectSize, a_groupEffectCount, a_minTimeLeft)
    {
        _enabled = a_enabled;
        _effectBaseSize = a_effectSize;
        _groupEffectCount = a_groupEffectCount;
        _minTimeLeft = a_minTimeLeft;
    } // End of the function
    function initStrings(a_orientation)
    {
        _orientation = a_orientation.toLowerCase();
    } // End of the function
    function initCommit()
    {
        this.invalidateSize();
        if (_enabled)
        {
            this.drawEffects();
        } // end if
    } // End of the function
    function setEffectSize(a_effectBaseSize)
    {
        _effectBaseSize = a_effectBaseSize;
        this.invalidateSize();
        this.invalidateEffects();
    } // End of the function
    function setGroupEffectCount(a_groupEffectCount)
    {
        _groupEffectCount = a_groupEffectCount;
        this.invalidateEffects();
    } // End of the function
    function setEnabled(a_enabled)
    {
        _enabled = a_enabled;
        if (_enabled)
        {
            this.eraseEffects();
            this.drawEffects();
        }
        else
        {
            this.eraseEffects();
        } // end else if
    } // End of the function
    function setOrientation(a_orientation)
    {
        _orientation = a_orientation.toLowerCase();
        this.invalidateEffects();
    } // End of the function
    function setMinTimeLeft(a_seconds)
    {
        _minTimeLeft = a_seconds;
    } // End of the function
    function updatePosition()
    {
        super.updatePosition();
        this.invalidateEffects();
    } // End of the function
    function onIntervalUpdate()
    {
        effectDataArray.splice(0);
        skse.RequestActivePlayerEffects(effectDataArray);
        if (_sortFlag)
        {
            effectDataArray.sortOn("elapsed", Array.DESCENDING | Array.NUMERIC);
            _sortFlag = false;
        } // end if
        for (var _loc3 = 0; _loc3 < effectDataArray.length; ++_loc3)
        {
            var _loc2 = effectDataArray[_loc3];
            if (_minTimeLeft != 0 && _minTimeLeft < _loc2.duration - _loc2.elapsed)
            {
                continue;
            } // end if
            var _loc4 = _effectsHash[_loc2.id];
            if (!_loc4)
            {
                var _loc5 = this.getFreeEffectsGroup();
                _loc4 = _loc5.addEffect(_loc2);
                _effectsHash[_loc2.id] = _loc4;
            }
            else
            {
                _loc4.updateEffect(_loc2);
            } // end else if
            _loc4.marker = _marker;
        } // end of for
        for (var _loc6 in _effectsHash)
        {
            _loc4 = _effectsHash[_loc6];
            if (_loc4.marker != _marker)
            {
                _loc4.remove();
                delete _effectsHash[_loc6];
            } // end if
        } // end of for...in
        _marker = 1 - _marker;
    } // End of the function
    function getFreeEffectsGroup()
    {
        for (var _loc2 = 0; _loc2 < _effectsGroups.length; ++_loc2)
        {
            var _loc3 = _effectsGroups[_loc2];
            if (_loc3.length < _groupEffectCount)
            {
                return (_loc3);
            } // end if
        } // end of for
        var _loc5 = _effectsGroups.length;
        var _loc6 = {index: _loc5, iconLocation: _rootPath + skyui.widgets.activeeffects.ActiveEffectsWidget.ICON_SOURCE, effectBaseSize: _effectBaseSize, effectSpacing: skyui.widgets.activeeffects.ActiveEffectsWidget.EFFECT_SPACING, effectFadeInDuration: skyui.widgets.activeeffects.ActiveEffectsWidget.EFFECT_FADE_IN_DURATION, effectFadeOutDuration: skyui.widgets.activeeffects.ActiveEffectsWidget.EFFECT_FADE_OUT_DURATION, effectMoveDuration: skyui.widgets.activeeffects.ActiveEffectsWidget.EFFECT_MOVE_DURATION, hAnchor: _hAnchor, vAnchor: _vAnchor, orientation: _orientation};
        var _loc4 = this.attachMovie("ActiveEffectsGroup", "effectsGroup" + this.getNextHighestDepth(), this.getNextHighestDepth(), _loc6);
        _loc4.addEventListener("groupRemoved", this, "onGroupRemoved");
        _effectsGroups.push(_loc4);
        return (_loc4);
    } // End of the function
    function onGroupRemoved(event)
    {
        var _loc5 = event.target;
        var _loc4 = _loc5.index;
        _effectsGroups.splice(_loc4, 1);
        _loc5.removeMovieClip();
        var _loc3;
        for (var _loc2 = _loc4; _loc2 < _effectsGroups.length; ++_loc2)
        {
            _loc3 = _effectsGroups[_loc2];
            _loc3.updatePosition(_loc2);
        } // end of for
    } // End of the function
    function invalidateEffects()
    {
        if (!_enabled)
        {
            return;
        } // end if
        this.eraseEffects();
        this.drawEffects();
    } // End of the function
    function eraseEffects()
    {
        clearInterval(_intervalId);
        var _loc3;
        for (var _loc2 = 0; _loc2 < _effectsGroups.length; ++_loc2)
        {
            _loc3 = _effectsGroups[_loc2];
            _loc3.removeMovieClip();
        } // end of for
        _effectsHash = new Object();
        _effectsGroups = new Array();
    } // End of the function
    function drawEffects()
    {
        clearInterval(_intervalId);
        _sortFlag = true;
        _intervalId = setInterval(this, "onIntervalUpdate", _updateInterval);
    } // End of the function
    static var EFFECT_SPACING = 5;
    static var EFFECT_FADE_IN_DURATION = 0.250000;
    static var EFFECT_FADE_OUT_DURATION = 0.750000;
    static var EFFECT_MOVE_DURATION = 1;
    static var ICON_SOURCE = "skyui/icons_effect_psychosteve.swf";
    var _marker = 1;
    var _sortFlag = true;
    var _updateInterval = 150;
    var _minTimeLeft = 180;
} // End of Class
