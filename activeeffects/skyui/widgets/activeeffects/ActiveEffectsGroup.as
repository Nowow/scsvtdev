class skyui.widgets.activeeffects.ActiveEffectsGroup extends MovieClip
{
    var _effectsArray, index, _x, _y, iconLocation, effectBaseSize, effectSpacing, effectFadeInDuration, effectFadeOutDuration, effectMoveDuration, hAnchor, vAnchor, orientation, getNextHighestDepth, attachMovie, dispatchEvent, __get__length;
    function ActiveEffectsGroup()
    {
        super();
        gfx.events.EventDispatcher.initialize(this);
        _effectsArray = new Array();
        var _loc3 = this.determinePosition(index);
        _x = _loc3[0];
        _y = _loc3[1];
    } // End of the function
    function get length()
    {
        return (_effectsArray.length);
    } // End of the function
    function addEffect(a_effectData)
    {
        var _loc15 = _effectsArray.length;
        var _loc3 = {index: _effectsArray.length, effectData: a_effectData, iconLocation: iconLocation, effectBaseSize: effectBaseSize, effectSpacing: effectSpacing, effectFadeInDuration: effectFadeInDuration, effectFadeOutDuration: effectFadeOutDuration, effectMoveDuration: effectMoveDuration, hAnchor: hAnchor, vAnchor: vAnchor, orientation: orientation};
        var _loc2 = this.attachMovie("ActiveEffect", a_effectData.id, this.getNextHighestDepth(), _loc3);
        _loc2.addEventListener("effectRemoved", this, "onEffectRemoved");
        _effectsArray.push(_loc2);
        return (_loc2);
    } // End of the function
    function updatePosition(a_newIndex)
    {
        index = a_newIndex;
        var _loc2 = this.determinePosition(index);
        skyui.util.Tween.LinearTween(this, "_x", _x, _loc2[0], effectMoveDuration, null);
        skyui.util.Tween.LinearTween(this, "_y", _y, _loc2[1], effectMoveDuration, null);
    } // End of the function
    function onEffectRemoved(event)
    {
        var _loc5 = event.target;
        var _loc4 = _loc5.index;
        _effectsArray.splice(_loc4, 1);
        _loc5.removeMovieClip();
        if (_effectsArray.length > 0)
        {
            var _loc3;
            for (var _loc2 = _loc4; _loc2 < _effectsArray.length; ++_loc2)
            {
                _loc3 = _effectsArray[_loc2];
                _loc3.updatePosition(_loc2);
            } // end of for
        }
        else
        {
            this.dispatchEvent({type: "groupRemoved"});
        } // end else if
    } // End of the function
    function determinePosition(a_index)
    {
        var _loc3 = 0;
        var _loc2 = 0;
        if (orientation == "vertical")
        {
            if (hAnchor == "right")
            {
                _loc3 = -(effectSpacing + index * (effectBaseSize + effectSpacing));
            }
            else
            {
                _loc3 = effectSpacing + index * (effectBaseSize + effectSpacing);
            } // end else if
        }
        else if (vAnchor == "bottom")
        {
            _loc2 = -(effectSpacing + index * (effectBaseSize + effectSpacing));
        }
        else
        {
            _loc2 = effectSpacing + index * (effectBaseSize + effectSpacing);
        } // end else if
        return ([_loc3, _loc2]);
    } // End of the function
} // End of Class
