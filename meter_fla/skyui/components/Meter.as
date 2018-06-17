class skyui.components.Meter extends MovieClip
{
    var background, meterContent, _width, __width, _height, __height, _meterFrameContent, _meterFillHolder, _meterFillContent, _meterFlashAnim, _meterBarAnim, _meterBar, _originalWidth, _originalHeight, _originalCapWidth, _originalCapHeight, _originalMeterFillHolderWidth, onEnterFrame, __get__width, __get__height, _primaryColor, _secondaryColor, __get__color, __set__flashColor, __set__color, _flashColor, __get__flashColor, _fillDirection, __get__fillDirection, _targetPercent, __get__percent, _currentPercent, _fullIdx, _emptyIdx, __set__fillDirection, __set__height, __set__percent, __set__width;
    function Meter()
    {
        super();
        background._visible = meterContent.capBackground._visible = false;
        __width = _width;
        __height = _height;
        _meterFrameContent = meterContent.meterFrameHolder.meterFrameContent;
        _meterFillHolder = meterContent.meterFillHolder;
        _meterFillContent = _meterFillHolder.meterFillContent;
        _meterFlashAnim = _meterFrameContent.meterFlashAnim;
        _meterBarAnim = _meterFillContent.meterBarAnim;
        _meterBar = _meterBarAnim.meterBar;
        _originalWidth = background._width;
        _originalHeight = background._height;
        _originalCapWidth = meterContent.capBackground._width;
        _originalCapHeight = meterContent.capBackground._height;
        _originalMeterFillHolderWidth = _meterFillHolder._width;
        _meterFillHolder._x = _originalCapWidth;
        _width = _originalWidth;
        _height = _originalHeight;
    } // End of the function
    function onLoad()
    {
        this.invalidateSize();
        this.invalidateFillDirection();
        onEnterFrame = enterFrameHandler;
        _initialized = true;
    } // End of the function
    function get width()
    {
        return (__width);
    } // End of the function
    function set width(a_width)
    {
        if (__width == a_width)
        {
            return;
        } // end if
        __width = a_width;
        if (_initialized)
        {
            this.invalidateSize();
        } // end if
        //return (this.width());
        null;
    } // End of the function
    function get height()
    {
        return (background._height);
    } // End of the function
    function set height(a_height)
    {
        if (__height == a_height)
        {
            return;
        } // end if
        __height = a_height;
        if (_initialized)
        {
            this.invalidateSize();
        } // end if
        //return (this.height());
        null;
    } // End of the function
    function setSize(a_width, a_height)
    {
        if (__width == a_width && __height == a_height)
        {
            return;
        } // end if
        __width = a_width;
        __height = a_height;
        if (_initialized)
        {
            this.invalidateSize();
        } // end if
    } // End of the function
    function get color()
    {
        return (_primaryColor);
    } // End of the function
    function set color(a_primaryColor)
    {
        var _loc2 = a_primaryColor == undefined ? (16777215) : (skyui.util.ColorFunctions.validHex(a_primaryColor));
        if (_loc2 == _primaryColor)
        {
            return;
        } // end if
        _primaryColor = _loc2;
        var _loc3 = skyui.util.ColorFunctions.hexToHsv(_loc2);
        _loc3[2] = _loc3[2] - 40;
        _secondaryColor = skyui.util.ColorFunctions.hsvToHex(_loc3);
        if (_initialized)
        {
            this.invalidateColor();
        } // end if
        //return (this.color());
        null;
    } // End of the function
    function setColors(a_primaryColor, a_secondaryColor, a_flashColor)
    {
        this.__set__flashColor(a_flashColor);
        if (a_secondaryColor == undefined || a_secondaryColor < 0)
        {
            this.__set__color(a_primaryColor);
            return;
        } // end if
        _primaryColor = a_primaryColor == undefined ? (16777215) : (skyui.util.ColorFunctions.validHex(a_primaryColor));
        _secondaryColor = skyui.util.ColorFunctions.validHex(a_secondaryColor);
        if (_initialized)
        {
            this.invalidateColor();
        } // end if
    } // End of the function
    function get flashColor()
    {
        return (_flashColor);
    } // End of the function
    function set flashColor(a_flashColor)
    {
        var _loc2;
        _flashColorAuto = false;
        if ((a_flashColor < 0 || a_flashColor == undefined) && _primaryColor != undefined)
        {
            _loc2 = _primaryColor;
            _flashColorAuto = true;
        }
        else if (a_flashColor == undefined)
        {
            _loc2 = 16777215;
        }
        else
        {
            _loc2 = skyui.util.ColorFunctions.validHex(a_flashColor);
        } // end else if
        if (_flashColor == _loc2)
        {
            return;
        } // end if
        _flashColor = _loc2;
        if (_initialized)
        {
            this.invalidateFlashColor();
        } // end if
        //return (this.flashColor());
        null;
    } // End of the function
    function get fillDirection()
    {
        return (_fillDirection);
    } // End of the function
    function set fillDirection(a_fillDirection)
    {
        this.setFillDirection(a_fillDirection);
        //return (this.fillDirection());
        null;
    } // End of the function
    function setFillDirection(a_fillDirection, a_restorePercent)
    {
        var _loc2 = a_fillDirection.toLowerCase();
        if (_fillDirection == _loc2 && !a_restorePercent)
        {
            return;
        } // end if
        _fillDirection = _loc2;
        if (_initialized)
        {
            this.invalidateFillDirection(a_restorePercent);
        } // end if
    } // End of the function
    function get percent()
    {
        return (_targetPercent);
    } // End of the function
    function set percent(a_percent)
    {
        this.setPercent(a_percent);
        //return (this.percent());
        null;
    } // End of the function
    function setPercent(a_percent, a_force)
    {
        _targetPercent = Math.min(1, Math.max(a_percent, 0));
        if (a_force)
        {
            _currentPercent = _targetPercent;
            var _loc2 = Math.floor(Shared.GlobalFunc.Lerp(_emptyIdx, _fullIdx, 0, 1, _currentPercent));
            _meterBarAnim.gotoAndStop(_loc2);
        } // end if
    } // End of the function
    function startFlash(a_force)
    {
        if (_meterFlashAnim.meterFlashing && !a_force)
        {
            return;
        } // end if
        _meterFlashAnim.gotoAndPlay("StartFlash");
    } // End of the function
    function invalidateSize()
    {
        var _loc3 = _originalCapWidth * 3;
        var _loc2;
        if (__width < _loc3)
        {
            __width = _loc3;
        } // end if
        _loc2 = _originalCapHeight / _originalCapWidth * __width / 2 * 0.800000;
        if (__height > _loc2)
        {
            __height = _loc2;
        } // end if
        background._width = __width;
        background._height = __height;
        var _loc4 = __height / _originalHeight;
        meterContent._xscale = meterContent._yscale = _loc4 * 100;
        _meterFrameContent._width = __width / _loc4;
        _meterFillHolder._xscale = (_meterFrameContent._width - 2 * _originalCapWidth) / _originalMeterFillHolderWidth * 100;
    } // End of the function
    function invalidateFillDirection(a_restorePercent)
    {
        switch (_fillDirection)
        {
            case skyui.components.Meter.FILL_DIRECTION_LEFT:
            case skyui.components.Meter.FILL_DIRECTION_BOTH:
            case skyui.components.Meter.FILL_DIRECTION_RIGHT:
            {
                break;
            } 
            default:
            {
                _fillDirection = skyui.components.Meter.FILL_DIRECTION_LEFT;
            } 
        } // End of switch
        _meterFillContent.gotoAndStop(_fillDirection);
        this.drawMeterGradients();
        _meterBarAnim.gotoAndStop("Full");
        _fullIdx = _meterBarAnim._currentframe;
        _meterBarAnim.gotoAndStop("Empty");
        _emptyIdx = _meterBarAnim._currentframe;
        if (a_restorePercent || !_initialized)
        {
            this.setPercent(_currentPercent, true);
        }
        else
        {
            this.setPercent(0, true);
        } // end else if
    } // End of the function
    function drawMeterGradients()
    {
        var _loc4 = _meterBar._width;
        var _loc3 = _meterBar._height;
        var _loc7 = _meterBar.meterBevel;
        var _loc2 = _meterBar.meterShine;
        var _loc8 = [13421772, 16777215, 0, 0, 0];
        var _loc6 = [10, 60, 0, 10, 30];
        var _loc9 = [0, 115, 128, 128, 255];
        var _loc5 = new flash.geom.Matrix();
        if (_loc2 != undefined)
        {
            return;
        } // end if
        _loc2 = _meterBar.createEmptyMovieClip("meterShine", 2);
        _loc7.swapDepths(1);
        _loc5.createGradientBox(_loc4, _loc3, 1.570796);
        _loc2.beginGradientFill("linear", _loc8, _loc6, _loc9, _loc5);
        _loc2.moveTo(0, 0);
        _loc2.lineTo(_loc4, 0);
        _loc2.lineTo(_loc4, _loc3);
        _loc2.lineTo(0, _loc3);
        _loc2.lineTo(0, 0);
        _loc2.endFill();
        this.invalidateColor();
    } // End of the function
    function invalidateColor()
    {
        var _loc4;
        var _loc3;
        var _loc6;
        var _loc7 = _meterBar._width;
        var _loc5 = _meterBar._height;
        var _loc2 = _meterBar.meterGradient;
        var _loc8 = new flash.geom.Matrix();
        if (_loc2 != undefined)
        {
            _loc2.removeMovieClip();
        } // end if
        _loc2 = _meterBar.createEmptyMovieClip("meterGradient", 0);
        switch (_fillDirection)
        {
            case skyui.components.Meter.FILL_DIRECTION_LEFT:
            {
                _loc4 = [_secondaryColor, _primaryColor];
                _loc3 = [100, 100];
                _loc6 = [0, 255];
                break;
            } 
            case skyui.components.Meter.FILL_DIRECTION_BOTH:
            {
                _loc4 = [_secondaryColor, _primaryColor, _secondaryColor];
                _loc3 = [100, 100, 100];
                _loc6 = [0, 127, 255];
                break;
            } 
            case skyui.components.Meter.FILL_DIRECTION_RIGHT:
            default:
            {
                _loc4 = [_primaryColor, _secondaryColor];
                _loc3 = [100, 100];
                _loc6 = [0, 255];
            } 
        } // End of switch
        _loc8.createGradientBox(_loc7, _loc5);
        _loc2.beginGradientFill("linear", _loc4, _loc3, _loc6, _loc8);
        _loc2.moveTo(0, 0);
        _loc2.lineTo(_loc7, 0);
        _loc2.lineTo(_loc7, _loc5);
        _loc2.lineTo(0, _loc5);
        _loc2.lineTo(0, 0);
        _loc2.endFill();
        if (_flashColorAuto || !_initialized)
        {
            if (_flashColorAuto)
            {
                _flashColor = _primaryColor;
            } // end if
            this.invalidateFlashColor();
        } // end if
    } // End of the function
    function invalidateFlashColor()
    {
        var _loc3 = new flash.geom.Transform(_meterFlashAnim);
        var _loc2 = new flash.geom.ColorTransform();
        _loc2.rgb = _flashColor;
        _loc3.colorTransform = _loc2;
    } // End of the function
    function enterFrameHandler()
    {
        if (_targetPercent == _currentPercent)
        {
            return;
        } // end if
        if (_currentPercent < _targetPercent)
        {
            _currentPercent = _currentPercent + _fillDelta;
            if (_currentPercent > _targetPercent)
            {
                _currentPercent = _targetPercent;
            } // end if
        }
        else
        {
            _currentPercent = _currentPercent - _emptyDelta;
            if (_currentPercent < _targetPercent)
            {
                _currentPercent = _targetPercent;
            } // end if
        } // end else if
        _currentPercent = Math.min(1, Math.max(_currentPercent, 0));
        var _loc2 = Math.floor(Shared.GlobalFunc.Lerp(_emptyIdx, _fullIdx, 0, 1, _currentPercent));
        _meterBarAnim.gotoAndStop(_loc2);
    } // End of the function
    static var FILL_DIRECTION_LEFT = "left";
    static var FILL_DIRECTION_RIGHT = "right";
    static var FILL_DIRECTION_BOTH = "both";
    var _fillDelta = 0.020000;
    var _emptyDelta = 0.030000;
    var _flashColorAuto = false;
    var _initialized = false;
} // End of Class
