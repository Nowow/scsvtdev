class skyui.util.Debug
{
    function Debug()
    {
    } // End of the function
    static function log()
    {
        var _loc7 = new Date();
        var _loc10 = String(_loc7.getHours());
        var _loc8 = String(_loc7.getMinutes());
        var _loc9 = String(_loc7.getSeconds());
        var _loc6 = String(_loc7.getMilliseconds());
        var _loc5 = "[" + (_loc10.length < 2 ? ("0" + _loc10) : (_loc10));
        _loc5 = _loc5 + (":" + (_loc8.length < 2 ? ("0" + _loc8) : (_loc8)));
        _loc5 = _loc5 + (":" + (_loc9.length < 2 ? ("0" + _loc9) : (_loc9)));
        _loc5 = _loc5 + ("." + (_loc6.length < 2 ? ("00" + _loc6) : (_loc6.length < 3 ? ("0" + _loc6) : (_loc6))));
        _loc5 = _loc5 + "]";
        if (_global.skse && skyui.util.Debug._buffer.length > 0)
        {
            for (var _loc4 = 0; _loc4 < skyui.util.Debug._buffer.length; ++_loc4)
            {
                skse.Log(skyui.util.Debug._buffer[_loc4]);
            } // end of for
            skyui.util.Debug._buffer.splice(0);
        } // end if
        for (var _loc4 = 0; _loc4 < arguments.length; ++_loc4)
        {
            var _loc3 = _loc5 + " " + arguments[_loc4];
            if (_global.skse)
            {
                skse.Log(_loc3);
                continue;
            } // end if
            if (_global.gfxPlayer)
            {
                trace (_loc3);
                continue;
            } // end if
            skyui.util.Debug._buffer.push(_loc3);
        } // end of for
    } // End of the function
    static function logNT()
    {
        if (_global.skse && skyui.util.Debug._buffer.length > 0)
        {
            for (var _loc4 = 0; _loc4 < skyui.util.Debug._buffer.length; ++_loc4)
            {
                skse.Log(skyui.util.Debug._buffer[_loc4]);
            } // end of for
            skyui.util.Debug._buffer.splice(0);
        } // end if
        for (var _loc4 = 0; _loc4 < arguments.length; ++_loc4)
        {
            var _loc3 = arguments[_loc4];
            if (_global.skse)
            {
                skse.Log(_loc3);
                continue;
            } // end if
            if (_global.gfxPlayer)
            {
                trace (_loc3);
                continue;
            } // end if
            skyui.util.Debug._buffer.push(_loc3);
        } // end of for
    } // End of the function
    static function dump(a_name, a_obj, a_noTimestamp, a_padLevel)
    {
        var _loc6 = "";
        var _loc4 = a_padLevel == undefined ? (0) : (a_padLevel);
        var _loc8 = a_noTimestamp ? (skyui.util.Debug.logNT) : (skyui.util.Debug.log);
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            _loc6 = _loc6 + "    ";
        } // end of for
        if (typeof(a_obj) == "object" || typeof(a_obj) == "function")
        {
            _loc8(_loc6 + a_name);
            for (var _loc7 in a_obj)
            {
                skyui.util.Debug.dump(_loc7, a_obj[_loc7], a_noTimestamp, _loc4 + 1);
            } // end of for...in
        }
        else if (typeof(a_obj) == "array")
        {
            _loc8(_loc6 + a_name);
            for (var _loc1 = 0; _loc1 < a_obj.length; ++_loc1)
            {
                skyui.util.Debug.dump(_loc1, a_obj[_loc1], a_noTimestamp, _loc4 + 1);
            } // end of for
        }
        else
        {
            _loc8(_loc6 + a_name + ": " + a_obj);
        } // end else if
    } // End of the function
    static function prettyFormId(a_formId, a_prefix)
    {
        var _loc2 = a_formId.toString(16).toUpperCase();
        var _loc3 = "";
        for (var _loc1 = _loc2.length; _loc1 < 8; ++_loc1)
        {
            _loc3 = _loc3 + "0";
        } // end of for
        _loc2 = (a_prefix ? ("0x") : ("")) + _loc3 + _loc2;
        return (_loc2);
    } // End of the function
    static function getFunctionName(a_func)
    {
        var _loc2 = skyui.util.Debug.getFunctionNameRecursive(a_func, _global);
        return (_loc2);
    } // End of the function
    static function getFunctionNameRecursive(a_func, a_root)
    {
        var _loc4 = a_func;
        var _loc2 = a_root;
        if (!_loc2)
        {
            return (null);
        } // end if
        for (var _loc8 in _loc2)
        {
            if (_loc2[_loc8] instanceof Function && _loc2[_loc8].prototype != null)
            {
                for (var _loc7 in _loc2[_loc8])
                {
                    if (_loc2[_loc8][_loc7] == _loc4)
                    {
                        return (_loc8 + "." + _loc7);
                    } // end if
                } // end of for...in
                var _loc3 = _loc2[_loc8].prototype;
                var _loc5 = new Array();
                for (var _loc7 in _loc3)
                {
                    _loc5.push(_loc7);
                } // end of for...in
                _global.ASSetPropFlags(_loc3, null, 0, 1);
                for (var _loc7 in _loc3)
                {
                    if (_loc3[_loc7] == _loc4)
                    {
                        return (_loc8 + "." + _loc7);
                    } // end if
                } // end of for...in
                _global.ASSetPropFlags(_loc3, null, 1, 0);
                _global.ASSetPropFlags(_loc3, _loc5, 0, 1);
            } // end if
        } // end of for...in
        for (var _loc8 in _loc2)
        {
            if (typeof(_loc2[_loc8]) == "object")
            {
                var _loc6 = skyui.util.Debug.getFunctionNameRecursive(_loc4, _loc2[_loc8]);
                if (_loc6)
                {
                    return (_loc8 + "." + _loc6);
                } // end if
            } // end if
        } // end of for...in
        return (null);
    } // End of the function
    static var _buffer = [];
} // End of Class
