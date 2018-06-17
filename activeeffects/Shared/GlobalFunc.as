class Shared.GlobalFunc
{
    var getTextFormat, htmlText, setTextFormat, text, _parent, _y, _x, length, _currentframe, gotoAndStop, gotoAndPlay, _name;
    function GlobalFunc()
    {
    } // End of the function
    static function Lerp(aTargetMin, aTargetMax, aSourceMin, aSourceMax, aSource, abClamp)
    {
        var _loc1 = aTargetMin + (aSource - aSourceMin) / (aSourceMax - aSourceMin) * (aTargetMax - aTargetMin);
        if (abClamp)
        {
            _loc1 = Math.min(Math.max(_loc1, aTargetMin), aTargetMax);
        } // end if
        return (_loc1);
    } // End of the function
    static function IsKeyPressed(aInputInfo, abProcessKeyHeldDown)
    {
        if (abProcessKeyHeldDown == undefined)
        {
            abProcessKeyHeldDown = true;
        } // end if
        return (aInputInfo.value == "keyDown" || abProcessKeyHeldDown && aInputInfo.value == "keyHold");
    } // End of the function
    static function RoundDecimal(aNumber, aPrecision)
    {
        var _loc1 = Math.pow(10, aPrecision);
        return (Math.round(_loc1 * aNumber) / _loc1);
    } // End of the function
    static function MaintainTextFormat()
    {
        TextField.prototype.SetText = function (aText, abHTMLText)
        {
            if (aText == undefined || aText == "")
            {
                aText = " ";
            } // end if
            var _loc2 = this.getTextFormat();
            if (abHTMLText)
            {
                var _loc4 = _loc2.letterSpacing;
                var _loc5 = _loc2.kerning;
                htmlText = aText;
                _loc2 = this.getTextFormat();
                _loc2.letterSpacing = _loc4;
                _loc2.kerning = _loc5;
                this.setTextFormat(_loc2);
                return;
            } // end if
            text = aText;
            this.setTextFormat(_loc2);
            return;
        };
        _global.ASSetPropFlags(TextField.prototype, "SetText", 1, 0);
    } // End of the function
    static function SetLockFunction()
    {
        MovieClip.prototype.Lock = function (aPosition)
        {
            var _loc3 = {x: Stage.visibleRect.x + Stage.safeRect.x, y: Stage.visibleRect.y + Stage.safeRect.y};
            var _loc4 = {x: Stage.visibleRect.x + Stage.visibleRect.width - Stage.safeRect.x, y: Stage.visibleRect.y + Stage.visibleRect.height - Stage.safeRect.y};
            _parent.globalToLocal(_loc3);
            _parent.globalToLocal(_loc4);
            if (aPosition == "T" || aPosition == "TL" || aPosition == "TR")
            {
                _y = _loc3.y;
            } // end if
            if (aPosition == "B" || aPosition == "BL" || aPosition == "BR")
            {
                _y = _loc4.y;
            } // end if
            if (aPosition == "L" || aPosition == "TL" || aPosition == "BL")
            {
                _x = _loc3.x;
            } // end if
            if (aPosition == "R" || aPosition == "TR" || aPosition == "BR")
            {
                _x = _loc4.x;
            } // end if
        };
        _global.ASSetPropFlags(MovieClip.prototype, "Lock", 1, 0);
    } // End of the function
    static function AddMovieExploreFunctions()
    {
        MovieClip.prototype.getMovieClips = function ()
        {
            var _loc3 = new Array();
            for (var _loc2 = 0; _loc2 < length; ++_loc2)
            {
                if (this[_loc2] instanceof MovieClip && this[_loc2] != this)
                {
                    _loc3.push(this[_loc2]);
                } // end if
            } // end of for
            return (_loc3);
        };
        MovieClip.prototype.showMovieClips = function ()
        {
            for (var _loc2 = 0; _loc2 < length; ++_loc2)
            {
                if (this[_loc2] instanceof MovieClip && this[_loc2] != this)
                {
                    trace (this[_loc2]);
                    this[_loc2].showMovieClips();
                } // end if
            } // end of for
        };
        _global.ASSetPropFlags(MovieClip.prototype, ["getMovieClips", "showMovieClips"], 1, 0);
    } // End of the function
    static function AddReverseFunctions()
    {
        MovieClip.prototype.PlayReverse = function ()
        {
            if (_currentframe > 1)
            {
                this.gotoAndStop(_currentframe - 1);
                function onEnterFrame()
                {
                    if (_currentframe > 1)
                    {
                        this.gotoAndStop(_currentframe - 1);
                        return;
                    } // end if
                    delete this.onEnterFrame;
                } // End of the function
                return;
            } // end if
            this.gotoAndStop(1);
        };
        MovieClip.prototype.PlayForward = function (aFrameLabel)
        {
            delete this.onEnterFrame;
            this.gotoAndPlay(aFrameLabel);
        };
        MovieClip.prototype.PlayForward = function (aFrame)
        {
            delete this.onEnterFrame;
            this.gotoAndPlay(aFrame);
        };
        _global.ASSetPropFlags(MovieClip.prototype, ["PlayReverse", "PlayForward"], 1, 0);
    } // End of the function
    static function GetTextField(aParentClip, aName)
    {
        if (Shared.GlobalFunc.RegisteredTextFields[aName + aParentClip._name] != undefined)
        {
            return (Shared.GlobalFunc.RegisteredTextFields[aName + aParentClip._name]);
        } // end if
        trace (aName + " is not registered a TextField name.");
    } // End of the function
    static function GetMovieClip(aParentClip, aName)
    {
        if (Shared.GlobalFunc.RegisteredMovieClips[aName + aParentClip._name] != undefined)
        {
            return (Shared.GlobalFunc.RegisteredMovieClips[aName + aParentClip._name]);
        } // end if
        trace (aName + " is not registered a MovieClip name.");
    } // End of the function
    static function AddRegisterTextFields()
    {
        TextField.prototype.RegisterTextField = function (aStartingClip)
        {
            if (Shared.GlobalFunc.RegisteredTextFields[_name + aStartingClip._name] == undefined)
            {
                Shared.GlobalFunc.RegisteredTextFields[_name + aStartingClip._name] = this;
            } // end if
        };
        _global.ASSetPropFlags(TextField.prototype, "RegisterTextField", 1, 0);
    } // End of the function
    static function RegisterTextFields(aStartingClip)
    {
        for (var _loc1 = 0; _loc1 < aStartingClip.length; ++_loc1)
        {
            if (aStartingClip[_loc1] instanceof TextField)
            {
                aStartingClip[_loc1].RegisterTextField(aStartingClip);
            } // end if
        } // end of for
    } // End of the function
    static function RegisterAllTextFieldsInTimeline(aStartingClip)
    {
        for (var _loc1 = 1; aStartingClip._totalFrames && _loc1 <= aStartingClip._totalFrames; ++_loc1)
        {
            aStartingClip.gotoAndStop(_loc1);
            Shared.GlobalFunc.RegisterTextFields(aStartingClip);
        } // end of for
    } // End of the function
    static function AddRegisterMovieClips()
    {
        MovieClip.prototype.RegisterMovieClip = function (aStartingClip)
        {
            if (Shared.GlobalFunc.RegisteredMovieClips[_name + aStartingClip._name] == undefined)
            {
                Shared.GlobalFunc.RegisteredMovieClips[_name + aStartingClip._name] = this;
            } // end if
        };
        _global.ASSetPropFlags(MovieClip.prototype, "RegisterMovieClip", 1, 0);
    } // End of the function
    static function RegisterMovieClips(aStartingClip)
    {
        for (var _loc1 = 0; _loc1 < aStartingClip.length; ++_loc1)
        {
            if (aStartingClip[_loc1] instanceof MovieClip)
            {
                aStartingClip[_loc1].RegisterMovieClip(aStartingClip);
            } // end if
        } // end of for
    } // End of the function
    static function RecursiveRegisterMovieClips(aStartingClip, aRootClip)
    {
        for (var _loc1 = 0; _loc1 < aStartingClip.length; ++_loc1)
        {
            if (aStartingClip[_loc1] instanceof MovieClip)
            {
                if (aStartingClip[_loc1] != aStartingClip)
                {
                    Shared.GlobalFunc.RecursiveRegisterMovieClips(aStartingClip[_loc1], aRootClip);
                } // end if
                aStartingClip[_loc1].RegisterMovieClip(aRootClip);
            } // end if
        } // end of for
    } // End of the function
    static function RegisterAllMovieClipsInTimeline(aStartingClip)
    {
        for (var _loc1 = 0; aStartingClip._totalFrames && _loc1 <= aStartingClip._totalFrames; ++_loc1)
        {
            aStartingClip.gotoAndStop(_loc1);
            Shared.GlobalFunc.RegisterMovieClips(aStartingClip);
        } // end of for
    } // End of the function
    static function StringTrim(astrText)
    {
        var _loc2 = 0;
        var _loc1 = 0;
        var _loc5 = astrText.length;
        var _loc3;
        while (astrText.charAt(_loc2) == " " || astrText.charAt(_loc2) == "\n" || astrText.charAt(_loc2) == "\r" || astrText.charAt(_loc2) == "\t")
        {
            ++_loc2;
        } // end while
        _loc3 = astrText.substring(_loc2);
        for (var _loc1 = _loc3.length - 1; _loc3.charAt(_loc1) == " " || _loc3.charAt(_loc1) == "\n" || _loc3.charAt(_loc1) == "\r" || _loc3.charAt(_loc1) == "\t"; --_loc1)
        {
        } // end of for
        _loc3 = _loc3.substring(0, _loc1 + 1);
        return (_loc3);
    } // End of the function
    static var RegisteredTextFields = new Object();
    static var RegisteredMovieClips = new Object();
} // End of Class
