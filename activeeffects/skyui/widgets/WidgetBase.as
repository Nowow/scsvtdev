class skyui.widgets.WidgetBase extends MovieClip
{
    var _clientInfo, _parent, _widgetHolder, _widgetID, _hudMetrics, _alpha, _x, _y, _width, _height;
    function WidgetBase()
    {
        super();
        _clientInfo = {};
        _widgetHolder = _parent;
        _widgetID = _widgetHolder._name;
        if (_global.gfxPlayer)
        {
            _global.gfxExtensions = true;
        }
        else
        {
            _widgetHolder._visible = false;
        } // end else if
    } // End of the function
    function setRootPath(a_path)
    {
        _rootPath = a_path;
    } // End of the function
    function setHudMetrics(a_hudMetrics)
    {
        _hudMetrics = a_hudMetrics;
    } // End of the function
    function setClientInfo(a_clientString)
    {
        var _loc8 = this;
        var _loc3 = new Object();
        var _loc7 = 0;
        var _loc4 = a_clientString.indexOf("<");
        var _loc5 = a_clientString.indexOf("(");
        var _loc6 = a_clientString.indexOf(")");
        _loc3.scriptName = a_clientString.slice(_loc7 + 1, _loc4 - 1);
        _loc3.formName = a_clientString.slice(_loc4 + 1, _loc5 - 1);
        _loc3.formID = a_clientString.slice(_loc5 + 1, _loc6);
        _loc8.clientInfo = _loc3;
    } // End of the function
    function setModes()
    {
        var _loc6 = 0;
        for (var _loc4 = 0; _loc4 < skyui.widgets.WidgetBase.MODES.length; ++_loc4)
        {
            delete _widgetHolder[skyui.widgets.WidgetBase.MODES[_loc4]];
        } // end of for
        for (var _loc4 = 0; _loc4 < arguments.length; ++_loc4)
        {
            var _loc5 = skyui.widgets.WidgetBase.MODEMAP[arguments[_loc4].toLowerCase()];
            if (_loc5 != undefined)
            {
                _widgetHolder[_loc5] = true;
                ++_loc6;
            } // end if
        } // end of for
        if (_loc6 == 0)
        {
            skse.SendModEvent("SKIWF_widgetError", "NoValidModes", Number(_widgetID));
        } // end if
        var _loc7 = _root.HUDMovieBaseInstance.HUDModes[_root.HUDMovieBaseInstance.HUDModes.length - 1];
        _widgetHolder._visible = _widgetHolder.hasOwnProperty(_loc7);
        _root.HUDMovieBaseInstance.HudElements.push(_widgetHolder);
    } // End of the function
    function setHAnchor(a_hAnchor)
    {
        var _loc2 = a_hAnchor.toLowerCase();
        if (_hAnchor == _loc2)
        {
            return;
        } // end if
        _hAnchor = _loc2;
        this.invalidateSize();
    } // End of the function
    function setVAnchor(a_vAnchor)
    {
        var _loc2 = a_vAnchor.toLowerCase();
        if (_vAnchor == _loc2)
        {
            return;
        } // end if
        _vAnchor = _loc2;
        this.invalidateSize();
    } // End of the function
    function setPositionX(a_positionX)
    {
        __x = a_positionX;
        this.updatePosition();
    } // End of the function
    function setPositionY(a_positionY)
    {
        __y = a_positionY;
        this.updatePosition();
    } // End of the function
    function setAlpha(a_alpha)
    {
        _alpha = a_alpha;
    } // End of the function
    function tweenTo(a_newX, a_newY, a_duration)
    {
        var _loc4 = Shared.GlobalFunc.Lerp(-_hudMetrics.hMin, _hudMetrics.hMax, 0, 1280, a_newX);
        var _loc3 = Shared.GlobalFunc.Lerp(-_hudMetrics.vMin, _hudMetrics.vMax, 0, 720, a_newY);
        var _loc2 = Math.max(0, a_duration || 0);
        skyui.util.Tween.LinearTween(this, "_x", _x, _loc4, _loc2, null);
        skyui.util.Tween.LinearTween(this, "_y", _y, _loc3, _loc2, null);
    } // End of the function
    function fadeTo(a_alpha, a_duration)
    {
        var _loc2 = Math.max(0, a_duration || 0);
        skyui.util.Tween.LinearTween(this, "_alpha", _alpha, a_alpha, _loc2, null);
    } // End of the function
    function getWidth()
    {
        return (_width);
    } // End of the function
    function getHeight()
    {
        return (_height);
    } // End of the function
    function invalidateSize()
    {
        this.updateAnchor();
    } // End of the function
    function updateAnchor()
    {
        var _loc3 = this.getWidth();
        var _loc2 = this.getHeight();
        if (_hAnchor == skyui.widgets.WidgetBase.ANCHOR_RIGHT)
        {
            _widgetHolder._x = -_loc3;
        }
        else if (_hAnchor == skyui.widgets.WidgetBase.ANCHOR_CENTER)
        {
            _widgetHolder._x = -_loc3 / 2;
        }
        else
        {
            _widgetHolder._x = 0;
        } // end else if
        if (_vAnchor == skyui.widgets.WidgetBase.ANCHOR_BOTTOM)
        {
            _widgetHolder._y = -_loc2;
        }
        else if (_vAnchor == skyui.widgets.WidgetBase.ANCHOR_CENTER)
        {
            _widgetHolder._y = -_loc2 / 2;
        }
        else
        {
            _widgetHolder._y = 0;
        } // end else if
        this.updatePosition();
    } // End of the function
    function updatePosition()
    {
        _x = Shared.GlobalFunc.Lerp(-_hudMetrics.hMin, _hudMetrics.hMax, 0, 1280, __x);
        _y = Shared.GlobalFunc.Lerp(-_hudMetrics.vMin, _hudMetrics.vMax, 0, 720, __y);
    } // End of the function
    static var MODES = ["All", "Favor", "MovementDisabled", "Swimming", "WarHorseMode", "HorseMode", "InventoryMode", "BookMode", "DialogueMode", "StealthMode", "SleepWaitMode", "BarterMode", "TweenMode", "WorldMapMode", "JournalMode", "CartMode", "VATSPlayback"];
    static var MODEMAP = {all: "All", favor: "Favor", movementdisabled: "MovementDisabled", swimming: "Swimming", warhorsemode: "WarHorseMode", horsemode: "HorseMode", inventorymode: "InventoryMode", bookmode: "BookMode", dialoguemode: "DialogueMode", stealthmode: "StealthMode", sleepwaitmode: "SleepWaitMode", bartermode: "BarterMode", tweenmode: "TweenMode", worldmapmode: "WorldMapMode", journalmode: "JournalMode", cartmode: "CartMode", vatsplayback: "VATSPlayback"};
    static var ANCHOR_LEFT = "left";
    static var ANCHOR_RIGHT = "right";
    static var ANCHOR_CENTER = "center";
    static var ANCHOR_TOP = "top";
    static var ANCHOR_BOTTOM = "bottom";
    var _rootPath = "";
    var __x = 0;
    var __y = 0;
    var _vAnchor = "top";
    var _hAnchor = "left";
} // End of Class
