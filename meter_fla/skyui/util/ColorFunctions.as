class skyui.util.ColorFunctions
{
    function ColorFunctions()
    {
    } // End of the function
    static function hexToRgb(a_RRGGBB)
    {
        var _loc1 = skyui.util.ColorFunctions.validHex(a_RRGGBB);
        return ([_loc1 >> 16 & 255, _loc1 >> 8 & 255, _loc1 & 255]);
    } // End of the function
    static function hexToHsv(a_RRGGBB)
    {
        return (skyui.util.ColorFunctions.rgbToHsv(skyui.util.ColorFunctions.hexToRgb(a_RRGGBB)));
    } // End of the function
    static function hexToHsl(a_RRGGBB)
    {
        return (skyui.util.ColorFunctions.rgbToHsl(skyui.util.ColorFunctions.hexToRgb(a_RRGGBB)));
    } // End of the function
    static function hexToStr(a_RRGGBB, a_prefix)
    {
        var _loc2 = a_RRGGBB.toString(16).toUpperCase();
        var _loc3 = "";
        for (var _loc1 = _loc2.length; _loc1 < 6; ++_loc1)
        {
            _loc3 = _loc3 + "0";
        } // end of for
        _loc2 = (a_prefix ? ("0x") : ("")) + _loc3 + _loc2;
        return (_loc2);
    } // End of the function
    static function validHex(a_RRGGBB)
    {
        return (skyui.util.ColorFunctions.clampValue(a_RRGGBB, 0, 16777215));
    } // End of the function
    static function rgbToHex(a_RGB)
    {
        var _loc1 = a_RGB;
        return (_loc1[0] << 16 ^ _loc1[1] << 8 ^ _loc1[2]);
    } // End of the function
    static function rgbToHsv(a_RGB)
    {
        var _loc6 = skyui.util.ColorFunctions.clampValue(a_RGB[0], 0, 255) / 255;
        var _loc5 = skyui.util.ColorFunctions.clampValue(a_RGB[1], 0, 255) / 255;
        var _loc3 = skyui.util.ColorFunctions.clampValue(a_RGB[2], 0, 255) / 255;
        var _loc1;
        var _loc4;
        var _loc2;
        var _loc8 = Math.max(_loc6, Math.max(_loc5, _loc3));
        var _loc10 = Math.min(_loc6, Math.min(_loc5, _loc3));
        var _loc7 = _loc8 - _loc10;
        var _loc12 = (2 * _loc6 - _loc5 - _loc3) / 2;
        var _loc11 = (_loc5 - _loc3) * skyui.util.ColorFunctions.SQRT_3_OVER_2;
        _loc1 = Math.atan2(_loc11, _loc12);
        _loc2 = _loc8;
        _loc4 = _loc7 == 0 ? (0) : (_loc7 / _loc2);
        if (_loc1 < 0)
        {
            _loc1 = _loc1 + skyui.util.ColorFunctions.TWO_PI;
        } // end if
        _loc1 = _loc1 * skyui.util.ColorFunctions.RAD_TO_DEG;
        _loc4 = _loc4 * 100;
        _loc2 = _loc2 * 100;
        _loc1 = Math.round(_loc1);
        _loc4 = Math.round(_loc4);
        _loc2 = Math.round(_loc2);
        return ([_loc1, _loc4, _loc2]);
    } // End of the function
    static function rgbToHsb(a_RGB)
    {
        return (skyui.util.ColorFunctions.rgbToHsv(a_RGB));
    } // End of the function
    static function rgbToHsl(a_RGB)
    {
        var _loc6 = skyui.util.ColorFunctions.clampValue(a_RGB[0], 0, 255) / 255;
        var _loc5 = skyui.util.ColorFunctions.clampValue(a_RGB[1], 0, 255) / 255;
        var _loc3 = skyui.util.ColorFunctions.clampValue(a_RGB[2], 0, 255) / 255;
        var _loc1;
        var _loc4;
        var _loc2;
        var _loc8 = Math.max(_loc6, Math.max(_loc5, _loc3));
        var _loc9 = Math.min(_loc6, Math.min(_loc5, _loc3));
        var _loc7 = _loc8 - _loc9;
        var _loc12 = (2 * _loc6 - _loc5 - _loc3) / 2;
        var _loc11 = (_loc5 - _loc3) * skyui.util.ColorFunctions.SQRT_3_OVER_2;
        _loc1 = Math.atan2(_loc11, _loc12);
        _loc2 = (_loc8 + _loc9) / 2;
        _loc4 = _loc7 == 0 ? (0) : (_loc7 / (1 - Math.abs(2 * _loc2 - 1)));
        if (_loc1 < 0)
        {
            _loc1 = _loc1 + skyui.util.ColorFunctions.TWO_PI;
        } // end if
        _loc1 = _loc1 * skyui.util.ColorFunctions.RAD_TO_DEG;
        _loc4 = _loc4 * 100;
        _loc2 = _loc2 * 100;
        _loc1 = Math.round(_loc1);
        _loc4 = Math.round(_loc4);
        _loc2 = Math.round(_loc2);
        return ([_loc1, _loc4, _loc2]);
    } // End of the function
    static function hsvToRgb(a_HSV)
    {
        var _loc11 = skyui.util.ColorFunctions.loopValue(a_HSV[0], 360);
        var _loc9 = skyui.util.ColorFunctions.clampValue(a_HSV[1], 0, 100) / 100;
        var _loc7 = skyui.util.ColorFunctions.clampValue(a_HSV[2], 0, 100) / 100;
        var _loc2;
        var _loc3;
        var _loc1;
        var _loc4 = _loc7 * _loc9;
        var _loc8 = _loc11 / 60;
        var _loc10 = Math.floor(_loc8);
        var _loc5 = _loc4 * (1 - Math.abs(_loc8 % 2 - 1));
        switch (_loc10)
        {
            case 0:
            {
                _loc2 = _loc4;
                _loc3 = _loc5;
                _loc1 = 0;
                break;
            } 
            case 1:
            {
                _loc2 = _loc5;
                _loc3 = _loc4;
                _loc1 = 0;
                break;
            } 
            case 2:
            {
                _loc2 = 0;
                _loc3 = _loc4;
                _loc1 = _loc5;
                break;
            } 
            case 3:
            {
                _loc2 = 0;
                _loc3 = _loc5;
                _loc1 = _loc4;
                break;
            } 
            case 4:
            {
                _loc2 = _loc5;
                _loc3 = 0;
                _loc1 = _loc4;
                break;
            } 
            case 5:
            {
                _loc2 = _loc4;
                _loc3 = 0;
                _loc1 = _loc5;
                break;
            } 
            default:
            {
                _loc2 = 0;
                _loc3 = 0;
                _loc1 = 0;
                break;
            } 
        } // End of switch
        var _loc6 = _loc7 - _loc4;
        _loc2 = _loc2 + _loc6;
        _loc3 = _loc3 + _loc6;
        _loc1 = _loc1 + _loc6;
        _loc2 = _loc2 * 255;
        _loc3 = _loc3 * 255;
        _loc1 = _loc1 * 255;
        _loc2 = Math.round(_loc2);
        _loc3 = Math.round(_loc3);
        _loc1 = Math.round(_loc1);
        return ([_loc2, _loc3, _loc1]);
    } // End of the function
    static function hsvToHex(a_HSV)
    {
        return (skyui.util.ColorFunctions.rgbToHex(skyui.util.ColorFunctions.hsvToRgb(a_HSV)));
    } // End of the function
    static function hsbToRgb(a_HSB)
    {
        return (skyui.util.ColorFunctions.hsvToRgb(a_HSB));
    } // End of the function
    static function hsbToHex(a_HSB)
    {
        return (skyui.util.ColorFunctions.hsvToHex(a_HSB));
    } // End of the function
    static function hslToRgb(a_HSL)
    {
        var _loc12 = skyui.util.ColorFunctions.loopValue(a_HSL[0], 360);
        var _loc9 = skyui.util.ColorFunctions.clampValue(a_HSL[1], 0, 100) / 100;
        var _loc7 = skyui.util.ColorFunctions.clampValue(a_HSL[2], 0, 100) / 100;
        var _loc2;
        var _loc3;
        var _loc1;
        var _loc4 = (1 - Math.abs(2 * _loc7 - 1)) * _loc9;
        var _loc8 = _loc12 / 60;
        var _loc10 = Math.floor(_loc8);
        var _loc5 = _loc4 * (1 - Math.abs(_loc8 % 2 - 1));
        switch (_loc10)
        {
            case 0:
            {
                _loc2 = _loc4;
                _loc3 = _loc5;
                _loc1 = 0;
                break;
            } 
            case 1:
            {
                _loc2 = _loc5;
                _loc3 = _loc4;
                _loc1 = 0;
                break;
            } 
            case 2:
            {
                _loc2 = 0;
                _loc3 = _loc4;
                _loc1 = _loc5;
                break;
            } 
            case 3:
            {
                _loc2 = 0;
                _loc3 = _loc5;
                _loc1 = _loc4;
                break;
            } 
            case 4:
            {
                _loc2 = _loc5;
                _loc3 = 0;
                _loc1 = _loc4;
                break;
            } 
            case 5:
            {
                _loc2 = _loc4;
                _loc3 = 0;
                _loc1 = _loc5;
                break;
            } 
            default:
            {
                _loc2 = 0;
                _loc3 = 0;
                _loc1 = 0;
                break;
            } 
        } // End of switch
        var _loc6 = _loc7 - _loc4 / 2;
        _loc2 = _loc2 + _loc6;
        _loc3 = _loc3 + _loc6;
        _loc1 = _loc1 + _loc6;
        _loc2 = _loc2 * 255;
        _loc3 = _loc3 * 255;
        _loc1 = _loc1 * 255;
        _loc2 = Math.round(_loc2);
        _loc3 = Math.round(_loc3);
        _loc1 = Math.round(_loc1);
        return ([_loc2, _loc3, _loc1]);
    } // End of the function
    static function hslToHex(a_HSL)
    {
        return (skyui.util.ColorFunctions.rgbToHex(skyui.util.ColorFunctions.hslToRgb(a_HSL)));
    } // End of the function
    static function clampValue(a_val, a_min, a_max)
    {
        return (Math.min(a_max, Math.max(a_min, a_val)));
    } // End of the function
    static function loopValue(a_val, a_max)
    {
        return (a_val % a_max);
    } // End of the function
    static var RAD_TO_DEG = 57.295780;
    static var DEG_TO_RAD = 0.017453;
    static var TWO_PI = 6.283185;
    static var SQRT_3_OVER_2 = 0.866025;
} // End of Class
