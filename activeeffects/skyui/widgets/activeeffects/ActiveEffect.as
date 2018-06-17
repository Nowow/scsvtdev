class skyui.widgets.activeeffects.ActiveEffect extends MovieClip
{
    var _iconLoader, content, _iconHolder, _icon, effectBaseSize, _height, _width, index, _x, _y, background, effectData, _alpha, effectFadeInDuration, effectMoveDuration, dispatchEvent, effectFadeOutDuration, _iconBaseLabel, _iconEmblemLabel, iconLocation, _meter, _meterEmptyIdx, _meterFullIdx, orientation, vAnchor, effectSpacing, hAnchor;
    function ActiveEffect()
    {
        super();
        gfx.events.EventDispatcher.initialize(this);
        _iconLoader = new MovieClipLoader();
        _iconLoader.addListener(this);
        _iconHolder = content.iconContent;
        _icon = _iconHolder.createEmptyMovieClip("icon", _iconHolder.getNextHighestDepth());
        _icon.noIconLoaded = true;
        _width = _height = effectBaseSize;
        var _loc3 = this.determinePosition(index);
        _x = _loc3[0];
        _y = _loc3[1];
        background._alpha = 0;
        _iconHolder.iconBackground._alpha = 0;
        this.initEffect();
        this.updateEffect(effectData);
        _alpha = 0;
        skyui.util.Tween.LinearTween(this, "_alpha", 0, 100, effectFadeInDuration, null);
    } // End of the function
    function updateEffect(a_effectData)
    {
        effectData = a_effectData;
        this.updateMeter();
    } // End of the function
    function updatePosition(a_newIndex)
    {
        index = a_newIndex;
        var _loc2 = this.determinePosition(index);
        skyui.util.Tween.LinearTween(this, "_x", _x, _loc2[0], effectMoveDuration, null);
        skyui.util.Tween.LinearTween(this, "_y", _y, _loc2[1], effectMoveDuration, null);
    } // End of the function
    function remove(a_immediate)
    {
        if (a_immediate == true)
        {
            _alpha = 0;
            this.dispatchEvent({type: "effectRemoved"});
            return;
        } // end if
        skyui.util.Tween.LinearTween(this, "_alpha", 100, 0, effectFadeOutDuration, mx.utils.Delegate.create(this, function ()
        {
            this.dispatchEvent({type: "effectRemoved"});
        }));
    } // End of the function
    function initEffect()
    {
        var _loc3 = skyui.util.EffectIconMap.lookupIconLabel(effectData);
        _iconBaseLabel = _loc3.baseLabel;
        _iconEmblemLabel = _loc3.emblemLabel;
        if (_iconBaseLabel == "default_effect" || _iconBaseLabel == undefined || _iconBaseLabel == "")
        {
            skyui.util.Debug.log("[SkyUI Active Effects]: Missing icon");
            for (var _loc2 in effectData)
            {
                skyui.util.Debug.log("\t\t" + _loc2 + ": " + effectData[_loc2]);
            } // end of for...in
        } // end if
        _iconHolder._width = _iconHolder._height = background._width - skyui.widgets.activeeffects.ActiveEffect.METER_PADDING - skyui.widgets.activeeffects.ActiveEffect.METER_WIDTH;
        _iconHolder._y = (background._height - _iconHolder._height) / 2;
        if (effectData.duration - effectData.elapsed > 1)
        {
            this.initMeter();
        } // end if
        _iconLoader.loadClip(iconLocation, _icon);
    } // End of the function
    function initMeter()
    {
        _meter = content.attachMovie("SimpleMeter", "meter", content.getNextHighestDepth(), {_x: background._width - skyui.widgets.activeeffects.ActiveEffect.METER_WIDTH, _y: _iconHolder._y, _width: skyui.widgets.activeeffects.ActiveEffect.METER_WIDTH, _height: _iconHolder._height});
        _meter.background._alpha = 50;
        _meter.gotoAndStop("Empty");
        _meterEmptyIdx = _meter._currentframe;
        _meter.gotoAndStop("Full");
        _meterFullIdx = _meter._currentframe;
    } // End of the function
    function updateMeter()
    {
        if (_meter == undefined)
        {
            return;
        } // end if
        var _loc2 = 100 * (effectData.duration - effectData.elapsed) / effectData.duration;
        _loc2 = Math.min(100, Math.max(_loc2, 0));
        var _loc3 = Math.floor(Shared.GlobalFunc.Lerp(_meterEmptyIdx, _meterFullIdx, 0, 100, _loc2));
        _meter.gotoAndStop(_loc3);
    } // End of the function
    function onLoadInit(a_mc)
    {
        if (_icon.noIconLoaded == true)
        {
            this.remove(true);
            return;
        } // end if
        _icon._x = 0;
        _icon._y = 0;
        _icon._width = _icon._height = _iconHolder.iconBackground._width;
        _icon.baseIcon.gotoAndStop(_iconBaseLabel);
        _icon.emblemIcon.gotoAndStop(_iconEmblemLabel);
        this.updateEffect(effectData);
    } // End of the function
    function onLoadError(a_mc, a_errorCode)
    {
        var _loc3 = _iconHolder.createTextField("ErrorTextField", _icon.getNextHighestDepth(), 0, 0, _iconHolder.iconBackground._width, _iconHolder.iconBackground._height);
        _loc3.verticalAlign = "center";
        _loc3.textAutoSize = "fit";
        _loc3.multiLine = true;
        var _loc2 = new TextFormat();
        _loc2.align = "center";
        _loc2.color = 16777215;
        _loc2.indent = 20;
        _loc2.font = "$EverywhereBoldFont";
        _loc3.setNewTextFormat(_loc2);
        _loc3.text = "No Icon\nSource";
    } // End of the function
    function determinePosition(a_index)
    {
        var _loc3 = 0;
        var _loc2 = 0;
        if (orientation == "vertical")
        {
            if (vAnchor == "bottom")
            {
                _loc2 = -index * (effectBaseSize + effectSpacing);
            }
            else
            {
                _loc2 = index * (effectBaseSize + effectSpacing);
            } // end else if
        }
        else if (hAnchor == "right")
        {
            _loc3 = -index * (effectBaseSize + effectSpacing);
        }
        else
        {
            _loc3 = index * (effectBaseSize + effectSpacing);
        } // end else if
        return ([_loc3, _loc2]);
    } // End of the function
    function parseTime(a_s)
    {
        var _loc4 = Math.floor(a_s);
        var _loc2 = 0;
        var _loc1 = 0;
        var _loc3 = 0;
        if (_loc4 >= 60)
        {
            _loc2 = Math.floor(_loc4 / 60);
            _loc4 = _loc4 % 60;
        } // end if
        if (_loc2 >= 60)
        {
            _loc1 = Math.floor(_loc2 / 60);
            _loc2 = _loc2 % 60;
        } // end if
        if (_loc1 >= 24)
        {
            _loc3 = Math.floor(_loc1 / 24);
            _loc1 = _loc1 % 24;
        } // end if
        return ((_loc3 != 0 ? (_loc3 + "d ") : ("")) + (_loc1 != 0 || _loc3 ? (_loc1 + "h ") : ("")) + (_loc2 != 0 || _loc3 || _loc1 ? (_loc2 + "m ") : ("")) + (_loc4 + "s"));
    } // End of the function
    static var METER_WIDTH = 15;
    static var METER_PADDING = 5;
} // End of Class
