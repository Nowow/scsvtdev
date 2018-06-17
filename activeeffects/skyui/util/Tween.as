class skyui.util.Tween
{
    function Tween()
    {
    } // End of the function
    static function LinearTween(a_obj, a_prop, a_start, a_end, a_duration, a_onFinish)
    {
        var _loc1 = "__tween_" + a_prop + "__";
        if (a_obj.hasOwnProperty(_loc1))
        {
            var _loc3 = a_obj[_loc1];
            if (_loc3.isPlaying)
            {
                _loc3.stop();
                false;
            } // end if
        } // end if
        var _loc5 = a_obj[a_prop];
        var _loc4 = Math.abs((a_end - _loc5) / (a_end - a_start)) * a_duration;
        a_obj[_loc1] = new mx.transitions.Tween(a_obj, a_prop, mx.transitions.easing.None.easeNone, _loc5, a_end, _loc4, true);
        if (a_onFinish)
        {
            a_obj[_loc1].onMotionFinished = a_onFinish;
            if (_loc4 <= 0)
            {
                a_onFinish();
            } // end if
        } // end if
        return (a_obj[_loc1]);
    } // End of the function
} // End of Class
